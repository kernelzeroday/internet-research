#!/usr/bin/env bash
# test-vintage-suite.sh — Archaeological test suite for SDF Vintage Systems Museum
#
# This test suite probes each vintage system in the SDF Museum and captures:
#   - Whether the system responds
#   - The login/banner text
#   - Basic command outputs
#   - Error handling behavior (what happens with bad input?)
#
# Each test produces a markdown log in tests/outputs/<system>.md
#
# Usage: ./tests/test-vintage-suite.sh [system-letter] [submenu]
#   ./tests/test-vintage-suite.sh          # test all systems
#   ./tests/test-vintage-suite.sh a        # test system 'a' (Multics)
#   ./tests/test-vintage-suite.sh 1 b      # test UNIX 'b' (BSD/386)

set -euo pipefail

mkdir -p tests/outputs

SDF_MENU_HOST="sdf.org"
SDF_MENU_USER="menu"
TIMEOUT=15

# Helper: log output
log() {
    local file="$1"
    shift
    echo "$@" >> "$file"
}

log_header() {
    local file="$1"
    local system="$2"
    local name="$3"
    {
        echo "---"
        echo "test: $system"
        echo "system: $name"
        echo "timestamp: $(date -u '+%Y-%m-%dT%H:%M:%SZ')"
        echo "---"
    } > "$file"
}

# System definitions
declare -A SYSTEMS
SYSTEMS[a]="Multics MR12.8 (Honeywell 6180)"
SYSTEMS[b]="TOPS-20 7(110131)-1 (XKL TOAD-2)"
SYSTEMS[c]="TWENEX TOPS-20 7(63327)-6 (XKL TOAD-2)"
SYSTEMS[d]="TOPS-20 MARS 7(21733) (SC40)"
SYSTEMS[e]="TOPS-10 MARS 7.05 (SC40)"
SYSTEMS[f]="ITS ver 1652 (PDP-10 KS10)"
SYSTEMS[g]="TOPS-10 6.03a (sim KA10)"
SYSTEMS[h]="TOPS-10 7.04 (sim KL10)"
SYSTEMS[i]="OpenVMS 7.3 (VAX 4000-96)"
SYSTEMS[j]="TSS/8 (PDP-8/e)"
SYSTEMS[k]="VM/SP5 (Hercules 4361)"
SYSTEMS[l]="CTSS (i7094)"
SYSTEMS[m]="NOS 1.3 (CDC-6500)"
SYSTEMS[n]="CP-V (XDS Sigma 9)"
SYSTEMS[z]="Bitzone NetBSD BBS"

declare -A UNIX_SYSTEMS
UNIX_SYSTEMS[a]="UNIX V7 (PDP-11/70)"
UNIX_SYSTEMS[b]="BSD/386 v1.1"
UNIX_SYSTEMS[c]="UNIX SVR3.2.3 (AT&T 3B2)"
UNIX_SYSTEMS[d]="BSD 4.3 (MicroVAX 3900)"
UNIX_SYSTEMS[e]="BSD 2.11 (PDP-11/84)"
UNIX_SYSTEMS[f]="HP/UX 10.20 (HP9000/715)"
UNIX_SYSTEMS[g]="TRU64 5.0 (DEC Alpha)"
UNIX_SYSTEMS[h]="SunOS 4.1.1 (Sun-3/160)"
UNIX_SYSTEMS[i]="IRIX 6.5 (SGI Indy R5000)"
UNIX_SYSTEMS[j]="Ultrix 2.0 (DEC MicroVAX I)"
UNIX_SYSTEMS[k]="FreeBSD 14.2 (m-net)"
UNIX_SYSTEMS[l]="DG/UX R4.11 (AViiON m88k)"
UNIX_SYSTEMS[m]="Ultrix 4.5 (DECstation 5000)"
UNIX_SYSTEMS[n]="Solaris 2.6 (SPARC SS20)"
UNIX_SYSTEMS[z]="UNIX50 (Various)"

# Run a test against one system
test_system() {
    local letter="$1"
    local name="$2"
    local menu="$3"  # "main" or "unix"
    local output="tests/outputs/${menu}-${letter}.md"

    echo "  Testing [$letter] $name ..."

    log_header "$output" "$letter" "$name"

    # Use expect to connect, select system, capture banner
    expect << EXPEOF 2>/dev/null >> "$output" | head -20
        set timeout $TIMEOUT
        spawn -noecho ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
            -o ConnectTimeout=10 -l $SDF_MENU_USER $SDF_MENU_HOST

        expect {
            -re "Your choice" { }
            timeout {
                puts "CONNECTION FAILED: SDF menu unreachable"
                exit
            }
        }

        # Navigate to correct menu
        if { "$menu" == "unix" } {
            send "1\r"
            expect {
                -re "Your choice" { }
                timeout { }
            }
        }

        # Select the system
        send "${letter}\r"

        # Wait briefly and capture
        expect {
            -re "login|Login|Username|username|:" {
                puts "LOGIN_PROMPT: \$expect_out(buffer)"
            }
            -re "You are now connected|Connected|Welcome" {
                puts "CONNECTED: \$expect_out(buffer)"
            }
            -re "Connection refused" {
                puts "CONNECTION_REFUSED"
            }
            timeout {
                puts "TIMEOUT - capture follows:"
                puts "\$expect_out(buffer)"
            }
        }

        # Try sending garbage to see error behavior
        send "garbage\r"
        expect {
            -re "login|Login|:" {
                puts "GARBAGE_RESPONSE: \$expect_out(buffer)"
            }
            timeout {
                puts "GARBAGE_TIMEOUT (no response)"
            }
        }

        # Try sending a backspace
        send "\b"
        expect {
            timeout {
                puts "BACKSPACE: no visible effect"
            }
        }

        close
EXPEOF

    # Check result
    if grep -q "CONNECTION_REFUSED" "$output"; then
        echo "    -> DOWN (connection refused)"
    elif grep -q "LOGIN_PROMPT\|CONNECTED" "$output"; then
        echo "    -> RESPONSIVE"
    elif grep -q "TIMEOUT" "$output"; then
        echo "    -> TIMEOUT (may be unresponsive)"
    else
        echo "    -> UNKNOWN"
    fi
}

# Test all systems in a menu
test_all() {
    local -n systems="$1"
    local menu="$2"
    local menu_name="$3"

    echo ""
    echo "=== $menu_name Menu ==="

    for letter in $(echo "${!systems[@]}" | tr ' ' '\n' | sort); do
        test_system "$letter" "${systems[$letter]}" "$menu"
    done
}

# Main
echo "============================================"
echo "SDF Vintage Systems Museum - Test Suite"
echo "Timestamp: $(date -u)"
echo "============================================"

# Test main menu
test_all SYSTEMS main "Main"

# Test UNIX sub-menu
test_all UNIX_SYSTEMS unix "UNIX"

echo ""
echo "============================================"
echo "Test suite complete."
echo "Results in tests/outputs/"
echo "============================================"

# Summary
echo ""
echo "=== SUMMARY ==="
for f in tests/outputs/*.md; do
    name=$(basename "$f" .md)
    if grep -q "RESPONSIVE" "$f" 2>/dev/null; then
        echo "  [UP] $name"
    elif grep -q "DOWN" "$f" 2>/dev/null; then
        echo "  [DOWN] $name"
    elif grep -q "TIMEOUT" "$f" 2>/dev/null; then
        echo "  [SLOW] $name"
    else
        echo "  [??]  $name"
    fi
done

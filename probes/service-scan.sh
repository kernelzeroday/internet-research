#!/usr/bin/env bash
# service-scan.sh - Check which systems are actually reachable
#
# Usage:
#   ./probes/service-scan.sh                    # scan all systems
#   ./probes/service-scan.sh sdf panix          # scan specific systems
#   ./probes/service-scan.sh --quick            # faster scan (1s timeout)
#   ./probes/service-scan.sh --ping             # ICMP ping only
#   ./probes/service-scan.sh --markdown         # output as markdown table
#
# Parses connect.sh's add_system entries and tests connectivity.
# Output: status table with UP/DOWN/TIMEOUT for each system.

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CONNECT_SH="$SCRIPT_DIR/connect.sh"
QUICK=0
PING_ONLY=0
MARKDOWN=0
TIMEOUT=5

# Parse args
ARGS=()
for arg in "$@"; do
    case "$arg" in
        --quick) QUICK=1; TIMEOUT=2 ;;
        --ping)  PING_ONLY=1 ;;
        --markdown) MARKDOWN=1 ;;
        *) ARGS+=("$arg") ;;
    esac
done

if [ ! -f "$CONNECT_SH" ]; then
    echo "Error: $CONNECT_SH not found"
    exit 1
fi

# Parse add_system entries from connect.sh
# Format: add_system "name" "Category" "description" "hint" "command"
# Uses perl for reliable regex matching (BSD awk lacks match() with capture groups)
parse_systems() {
    # Slurp the file, strip line continuations, extract add_system blocks
    perl -e '
    local $/;
    my $text = <>;
    # Remove line continuations (backslash-newline) so multi-line add_system collapses
    $text =~ s/\\\n//g;
    # Match each add_system block
    while ($text =~ /add_system\s+"([^"]+)"\s+"([^"]+)"\s+"([^"]+)"\s+"([^"]+)"\s+"([^"]+)"/g) {
        my ($name, $cat, $desc, $hint, $cmd) = ($1, $2, $3, $4, $5);
        my ($host, $port) = ("", "");
        if ($cmd =~ /ssh\s+(?:-l\s+\w+\s+)?([a-zA-Z0-9._-]+)/) {
            $host = $1; $port = 22;
            if ($cmd =~ /-p\s+(\d+)/) { $port = $1; }
        } elsif ($cmd =~ /telnet\s+([a-zA-Z0-9._-]+)\s*(\d+)?/) {
            $host = $1; $port = $2 || 23;
        } elsif ($cmd =~ /\/dev\/tcp\/([^\/]+)\/(\d+)/) {
            $host = $1; $port = $2;
        } elsif ($cmd =~ /finger.*\@([a-zA-Z0-9._-]+)/) {
            $host = $1; $port = 79;
        }
        if ($name && $host) {
            print "${name}|${host}|${port}\n";
        }
    }
    ' "$1"
}

# Test a host:port
check_host() {
    local name="$1" host="$2" port="$3"
    local status="DOWN"
    local latency=""

    if [ "$PING_ONLY" = 1 ]; then
        if ping -c 1 -W 2 "$host" &>/dev/null; then
            status="UP"
        else
            status="DOWN"
        fi
    else
        local start="$SECONDS"
        if timeout "$TIMEOUT" nc -zv "$host" "$port" 2>&1 | grep -qiE "succeeded|open|Connected"; then
            local elapsed=$((SECONDS - start))
            status="UP"
            latency="${elapsed}s"
        else
            status="DOWN"
        fi
    fi

    echo "$name|$host|$port|$status|$latency"
}

# ── Main ────────────────────────────────────────────────────────────────────

# If specific names given, filter to those
if [ ${#ARGS[@]} -gt 0 ]; then
    FILTER_NAMES=("${ARGS[@]}")
fi

RESULTS=()
SYSTEMS=$(parse_systems "$CONNECT_SH")

if [ "$MARKDOWN" = 0 ]; then
    echo ""
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║              Service Status Scan                        ║"
    echo "║  $(date '+%Y-%m-%d %H:%M:%S')                          ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo ""
fi

UP=0
DOWN=0
TOTAL=0

while IFS='|' read -r name host port; do
    # Apply filter
    if [ ${#FILTER_NAMES[@]} -gt 0 ]; then
        skip=1
        for f in "${FILTER_NAMES[@]}"; do
            if [[ "$name" == *"$f"* ]]; then skip=0; break; fi
        done
        [ $skip = 1 ] && continue
    fi

    TOTAL=$((TOTAL + 1))

    result=$(check_host "$name" "$host" "$port")
    IFS='|' read -r rname rhost rport status latency <<< "$result"
    RESULTS+=("$result")

    if [ "$status" = "UP" ]; then
        UP=$((UP + 1))
        if [ "$MARKDOWN" = 1 ]; then
            echo "| $rname | \`$rhost:$rport\` | ✅ UP | $latency |"
        else
            echo -e "  \033[0;32mUP\033[0m   \033[1m$rname\033[0m  ($rhost:$rport)  ${latency}"
        fi
    else
        DOWN=$((DOWN + 1))
        if [ "$MARKDOWN" = 1 ]; then
            echo "| $rname | \`$rhost:$rport\` | ❌ DOWN | - |"
        else
            echo -e "  \033[0;31mDOWN\033[0m \033[1m$rname\033[0m  ($rhost:$rport)"
        fi
    fi
done <<< "$SYSTEMS"

if [ "$MARKDOWN" = 0 ]; then
    echo ""
    echo "────────────────────────────────────────────"
    echo -e "  \033[0;32m$UP up\033[0m  \033[0;31m$DOWN down\033[0m  $TOTAL total"
    echo ""
fi

exit $DOWN

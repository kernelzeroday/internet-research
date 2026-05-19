#!/usr/bin/env bash
# capture-demo.sh - Record an asciinema demo of connecting to a system
#
# Usage:
#   ./probes/capture-demo.sh <system-name> [duration]
#   ./probes/capture-demo.sh sdf 15
#   ./probes/capture-demo.sh starwars 30
#   ./probes/capture-demo.sh --list
#
# Duration: seconds to record (default: 10, min: 5, max: 60)
#
# Output: screenshots/demos/<system-name>-<timestamp>.cast
#
# Requires: asciinema

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CONNECT_SH="$SCRIPT_DIR/connect.sh"
DEMO_DIR="$SCRIPT_DIR/screenshots/demos"
DURATION=10

# Parse args
if [ "$1" = "--list" ]; then
    echo "Available systems (from connect.sh):"
    awk -F'"' '/^add_system/ {print "  " $2}' "$CONNECT_SH"
    exit 0
fi

SYSTEM_NAME="$1"
[ -n "$2" ] && DURATION="$2"

if [ -z "$SYSTEM_NAME" ]; then
    echo "Usage: $0 <system-name> [duration]"
    echo "       $0 --list"
    exit 1
fi

if [ "$DURATION" -lt 5 ]; then DURATION=5; fi
if [ "$DURATION" -gt 60 ]; then DURATION=60; fi

# Look up the system command
SYSTEM_CMD=""
CURRENT_NAME=""
while IFS= read -r line; do
    # Match add_system with the given name
    if echo "$line" | grep -q "^add_system"; then
        CURRENT_NAME=$(echo "$line" | awk -F'"' '{print $2}')
    fi
    if [ "$CURRENT_NAME" = "$SYSTEM_NAME" ]; then
        # Accumulate until we hit the closing quote of the command field
        if echo "$line" | grep -q '"[^"]*"[^"]*$'; then
            # Last line of this block - extract command
            SYSTEM_CMD=$(echo "$line" | sed 's/.*"\(.*\)"[[:space:]]*$/\1/' | sed 's/\\$//')
            break
        fi
    fi
done < <(grep -A4 "^add_system \"$SYSTEM_NAME\"" "$CONNECT_SH")

if [ -z "$SYSTEM_CMD" ]; then
    echo "Error: system '$SYSTEM_NAME' not found in connect.sh"
    echo "Run '$0 --list' to see available systems."
    exit 1
fi

mkdir -p "$DEMO_DIR"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
OUTPUT_FILE="$DEMO_DIR/$SYSTEM_NAME-$TIMESTAMP.cast"

echo "╔═══════════════════════════════════════════╗"
echo "║  Recording demo: $SYSTEM_NAME"
echo "║  Duration: ${DURATION}s"
echo "║  Command: $SYSTEM_CMD"
echo "║  Output:  $OUTPUT_FILE"
echo "╚═══════════════════════════════════════════╝"
echo ""

# We wrap the connection in a timeout so asciinema exits cleanly
# asciinema rec records the full terminal session
asciinema rec --overwrite -q -t "Demo: $SYSTEM_NAME" \
    -c "timeout $DURATION $SYSTEM_CMD 2>/dev/null || true" \
    "$OUTPUT_FILE"

# Check result
if [ -f "$OUTPUT_FILE" ] && [ -s "$OUTPUT_FILE" ]; then
    SIZE=$(wc -c < "$OUTPUT_FILE")
    echo ""
    echo "✅ Demo recorded: $OUTPUT_FILE ($SIZE bytes)"
    echo "   Replay with: asciinema play $OUTPUT_FILE"
else
    echo "❌ Recording failed or empty"
    exit 1
fi

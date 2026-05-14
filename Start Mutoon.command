#!/bin/bash
# Mutoon.ai Launcher for macOS
# Double-click this file to start the app.

cd "$(dirname "$0")"

# Find an available port starting at 8765
PORT=8765
while lsof -i ":$PORT" >/dev/null 2>&1; do
    PORT=$((PORT + 1))
    if [ "$PORT" -gt 8800 ]; then
        osascript -e 'display dialog "Could not find a free port. Close other servers and try again." buttons {"OK"}'
        exit 1
    fi
done

# Start the local server in the background
python3 -m http.server "$PORT" >/dev/null 2>&1 &
SERVER_PID=$!

# Wait briefly for the server to come up
sleep 1

# Open the page in the default browser
open "http://localhost:$PORT/index.html"

# Show a window so the user knows the server is running
osascript -e "display dialog \"Mutoon.ai is running at http://localhost:$PORT\n\nKeep this dialog open while you use the app.\n\nClick Stop when you are done.\" buttons {\"Stop\"} default button \"Stop\" with title \"Mutoon.ai\""

# Clean up
kill "$SERVER_PID" 2>/dev/null
exit 0

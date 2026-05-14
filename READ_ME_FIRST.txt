MUTOON.AI — How to run on macOS
================================

Just double-click "Start Mutoon.command".

That's it. It will:
  1. Start a local web server on your Mac.
  2. Open the app in your default browser.
  3. The microphone will work because the page loads from http://localhost
     (which browsers allow), not from file:// (which they don't).

When you're done, click "Stop" in the dialog that appears.

------------------------------------------------------------

If macOS blocks the file the first time:
  - Right-click "Start Mutoon.command" → Open → Open in the dialog.
  - Or: System Settings → Privacy & Security → scroll to bottom →
    "Open Anyway" next to the blocked file.

This is a standard macOS Gatekeeper warning for any file downloaded from
the internet that's not from the App Store. You only have to do it once.

------------------------------------------------------------

If the mic still doesn't work after this:
  - Open Chrome
  - Go to http://localhost:8765/index.html (or whatever port the dialog showed)
  - Click the 🔒 lock icon in the URL bar → set Microphone to Allow
  - Refresh

If macOS itself is blocking Chrome's microphone access (separate from the
in-page Allow button), open System Settings → Privacy & Security →
Microphone → make sure Google Chrome's toggle is ON. Then fully quit Chrome
(Cmd+Q) and reopen.

#!/bin/bash

# Path to the custom script
SCRIPT_PATH="$HOME/startup.sh"

# Check if the custom script exists and is executable
if [ -x "$SCRIPT_PATH" ]; then
    # Execute the script
    "$SCRIPT_PATH"
else
    # Fall back to shell
    /bin/bash
fi
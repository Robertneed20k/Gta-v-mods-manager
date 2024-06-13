#!/bin/bash

# Path to vmods.sh and target directory
VMODS_SCRIPT="vmods.sh"
TARGET_DIR="/data/data/com.termux/files/usr/bin"

# Check if vmods.sh exists
if [ ! -f "$VMODS_SCRIPT" ]; then
    echo "Error: $VMODS_SCRIPT not found. Please make sure it exists in the current directory."
    exit 1
fi

# Make vmods.sh executable
chmod +x "$VMODS_SCRIPT"

# Move vmods.sh to a directory in Termux's $PATH
mv "$VMODS_SCRIPT" "$TARGET_DIR/vmods"

echo "Congratulations! vmods has been successfully installed!"
echo "To start, simply type 'vmods' in your terminal."

# Exit successfully
exit 0

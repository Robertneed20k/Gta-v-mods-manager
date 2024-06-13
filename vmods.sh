#!/bin/bash

# Variables
GTAV_DIR="/sdcard/download/pc games/Grand Theft Auto V"
MODS_DIR="$GTAV_DIR/mods"
UPDATE_DIR="$MODS_DIR/update"
VMODS_DIR="/sdcard/download/vmods"

# Ensure necessary directories exist
mkdir -p "$MODS_DIR"
mkdir -p "$UPDATE_DIR"

# Function to list vmods folders with folder names only
list_vmods_folders() {
    echo "Select a folder to interact with:"
    options=()
    i=1
    for folder in "$VMODS_DIR"/*/; do
        folder_name=$(basename "$folder")
        options+=("$folder_name")
        ((i++))
    done

    options+=("Back to main menu")
    select folder_name in "${options[@]}"; do
        if [ "$folder_name" == "Back to main menu" ]; then
            return 1
        elif [ -n "$folder_name" ]; then
            folder_name="$folder_name"  # Folder name selected
            break
        else
            echo "Invalid selection. Please try again."
        fi
    done
}

# Function to display success message
success_message() {
    echo "Mods successfully $1"
}

# Function to backup mods
backup_mods() {
    while true; do
        list_vmods_folders || return
        selected_folder="$folder_name"

        echo "Backing up mods..."
        if [ -f "$UPDATE_DIR/update.rpf" ]; then
            cp "$UPDATE_DIR/update.rpf" "$VMODS_DIR/$selected_folder/update/update.rpf"
            rm "$UPDATE_DIR/update.rpf"
            success_message "backed up"
            break
        else
            echo "No mods found in $UPDATE_DIR to backup."
            read -p "Press Enter to continue..."
            return
        fi
    done
}

# Function to install mods
install_mods() {
    while true; do
        list_vmods_folders || return
        selected_folder="$folder_name"

        echo "Installing mods..."
        if [ -f "$VMODS_DIR/$selected_folder/update/update.rpf" ]; then
            mv "$VMODS_DIR/$selected_folder/update/update.rpf" "$UPDATE_DIR/update.rpf"
            success_message "installed"
            break
        else
            echo "No mods found in $VMODS_DIR/$selected_folder to install."
            read -p "Press Enter to continue..."
            return
        fi
    done
}

# Function to replace mods
replace_mods() {
    while true; do
        list_vmods_folders || return
        selected_folder="$folder_name"

        echo "Replacing mods..."
        if [ -f "$VMODS_DIR/$selected_folder/update/update.rpf" ]; then
            mv "$VMODS_DIR/$selected_folder/update/update.rpf" "$UPDATE_DIR/update.rpf"
            success_message "replaced"
            break
        else
            echo "No mods found in $VMODS_DIR/$selected_folder to replace."
            read -p "Press Enter to continue..."
            return
        fi
    done
}

# Main Menu
exit_flag=0
while [ $exit_flag -eq 0 ]; do
    clear

    echo "GTA V Mod Transfer Script"
    echo "1. Backup Mods"
    echo "2. Install Mods"
    echo "3. Replace Mods"
    echo "4. Exit"
    echo -n "Select an option: "
    read choice

    # Main logic
    case $choice in
        1) backup_mods;;
        2) install_mods;;
        3) replace_mods;;
        4) echo "Exiting..."; exit_flag=1;;
        *) echo "Invalid option";;
    esac

    # Wait for user input to continue
    if [ $exit_flag -eq 0 ]; then
        read -p "Press Enter to continue..."
    fi
done

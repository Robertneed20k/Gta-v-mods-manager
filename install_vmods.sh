#!/bin/bash

# Permission to allow storage access
termux-setup-storage

# Function to display a spinning loading animation
function loading_animation() {
    local duration=${1:-10} # Default duration: 10 seconds
    local chars=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
    local num_chars=${#chars[@]}
    local interval=$((duration * 1000 / num_chars))

    for ((i = 0; i < num_chars; i++)); do
        echo -ne "\rDownloading vmods.sh... ${chars[i]}"
        sleep 0.$interval
    done
}

# Function to display colorful ASCII art
function display_ascii_art() {
    echo -e "\e[1;33m"
    cat << "EOF"
  ____  _     _ _     _____ _     _     
 / ___|| |__ (_) |_  |  ___(_)___| |__  
 \___ \| '_ \| | __| | |_  | / __| '_ \ 
  ___) | | | | | |_  |  _| | \__ \ | | |
 |____/|_| |_|_|\__| |_|   |_|___/_| |_|
                                        
EOF
    echo -e "\e[0m"
}

# Installation script for vmods

# Display colorful ASCII art
display_ascii_art

# Download vmods.sh with a spinning loading animation
echo "Downloading vmods.sh..."
loading_animation & # Run the loading animation function in the background
pid=$!              # Get the process ID of the background task
curl -s -o ~/vmods.sh https://raw.githubusercontent.com/robertneed20k/gta-v-mods/main/vmods.sh >/dev/null 2>&1
kill $pid >/dev/null 2>&1 # Stop the loading animation once the download is complete
echo -e "\rDownloading vmods.sh... Done"

# Make vmods.sh executable
echo "Making vmods.sh executable... done"
chmod +x ~/vmods.sh

# Move vmods.sh to a directory in $PATH
echo "Moving vmods.sh to a directory in \$PATH... done"
mv ~/vmods.sh /data/data/com.termux/files/usr/bin/vmods

# Inform the user that vmods has been successfully installed with a message
echo "Congratulations! vmods has been successfully installed! 🎉"

# Provide instructions on usage
echo "To start, simply type 'vmods' in your terminal."

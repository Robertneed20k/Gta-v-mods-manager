# GTA V Mod Management Script

This script facilitates the management of Grand Theft Auto V (GTA V) mods on Android devices. It allows you to back up, install, and replace mods easily.

## Installation

To install and run the script, follow these steps:

1. **Download the Installation Script**:

   Run the following command in your terminal on your Android device:

   ```bash
   curl -s -o ~/install_vmods.sh https://raw.githubusercontent.com/robertneed20k/gta-v-mods-manager/main/install_vmods.sh && clear && bash ~/install_vmods.sh
   ```

   This command downloads the installation script (`install_vmods.sh`) from the repository and executes it.

2. **Follow the On-Screen Instructions**:

   The installation script will guide you through setting up necessary directories and ensuring your environment is ready for managing GTA V mods.

3. **Clone the Repository** (if not already done):

   Clone this repository to your Android device where GTA V and mods are stored:

   ```bash
   git clone https://github.com/your-username/your-repo.git
   cd your-repo
   ```

4. **Run the Main Script**:

   After installation, run the main script (`gta-v-mods.sh`) to start managing your mods:

   ```bash
   bash gta-v-mods.sh
   ```

5. **Select Options**:

   Use the menu options to back up, install, or replace mods in your GTA V installation.

## Prerequisites

Before running the script, ensure the following prerequisites are met:

- Create a "PC Games" folder and a "vMods" folder in the "/sdcard/Download" directory.
- Place your GTA V game folder inside the "PC Games" folder:
  ```
  /sdcard/Download/PC Games/Grand Theft Auto V
  ```
- Place your pre-installed mods inside the "vMods" folder:
  ```
  /sdcard/Download/vMods
  ```
- Verify your GTA V folder structure:
  ```
  /sdcard/Download/PC Games/Grand Theft Auto V/mods/update
  ```

## Usage

Refer to the [Usage](#usage) section in the README for details on how to interact with the script and manage your mods effectively.

## Contributions

Contributions and improvements to this script are welcome. Feel free to fork this repository, make changes, and submit pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```


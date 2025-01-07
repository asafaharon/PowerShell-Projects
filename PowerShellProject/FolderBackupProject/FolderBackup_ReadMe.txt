# Folder Backup Script with Retention Policy

This PowerShell script automates the process of creating backups for a specified folder. It ensures that only a set number of recent backups are retained, automatically deleting older backups to save storage space. The backups are created in a `Backups` folder located in the same directory as the script.

## Features
1. **Automated Backup Creation:**
   - Creates a backup of the specified source folder with a timestamped name.
   - Ensures that backups are stored in a dedicated `Backups` folder.

2. **Retention Policy:**
   - Retains only the most recent 5 backups by default.
   - Automatically deletes older backups when the retention limit is exceeded.

3. **Excludes Backup Folder from Being Backed Up:**
   - Ensures that the `Backups` folder itself is not included in the backup process.

## How to Use
1. **Set up the script:**
   - The script is configured to back up the folder `C:\Users\asafa\Desktop\PowerShellProject\secend_project`.
   - If needed, update the `$sourcePath` variable at the top of the script to match your desired source folder.

2. **Run the script:**
   1. Open PowerShell.
   2. Navigate to the directory where the script is located:
      ```powershell
      cd "C:\Users\asafa\Desktop\PowerShellProject\secend_project"
      ```
   3. Run the script:
      ```powershell
      .\secend_project.ps1
      ```

## Output
- A new backup folder will be created inside `Backups`, named with the current date and time in the format `Backup_yyyyMMdd_HHmmss`.
- Example of a created backup folder:
  ```
  Backups\Backup_20250105_161837
  ```

## Retention Policy
- By default, the script retains the 5 most recent backups.
- You can modify the retention policy by changing the value of the `$retentionCount` variable.

## Error Handling
- If the source folder does not exist, the script will display an appropriate error message and terminate.
- If there are issues with file permissions or paths, PowerShell will display relevant error messages.

## License
This script is provided as-is, without any warranty. You may modify and use it for personal or commercial purposes.

## Author
This script was created by Asaf Aharon. Feel free to contact me for any questions or suggestions.


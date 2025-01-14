# System Status Report Generator

This PowerShell script generates a comprehensive system status report, including disk usage, running services, and top active processes sorted by CPU usage. The report is saved in a text file with a timestamped name for easy identification.

## Features
1. **Disk Usage Summary**
   - Displays the used, free, and total space for each file system drive.
   - Shows the percentage of free space for each drive.

2. **Running Services**
   - Lists all currently running services.
   - The services are sorted alphabetically by their display name.

3. **Active Processes**
   - Displays the top 10 active processes by CPU usage.
   - Includes process name, ID, CPU usage, and memory usage in MB.

## Output Example
The output file will contain the following sections:

```
--- Disk Usage ---
Name UsedGB FreeGB TotalGB PercentFree
C:    120.5  50.4   170.9      29.51

--- Running Services ---
Name             DisplayName                Status
wuauserv         Windows Update             Running
WinDefend        Windows Defender Antivirus Running

--- Active Processes (Top by CPU) ---
Name             Id   CPU MemoryMB
chrome           1234 25  200.34
explorer         5678 10  150.20
```

## How to Run the Script
1. Open PowerShell.
2. Navigate to the directory where the script is located.
   ```powershell
   cd "C:\path\to\script"
   ```
3. Run the script using the following command:
   ```powershell
   .\first_project.ps1
   ```

## Prerequisites
- PowerShell must be installed on your system (version 5.1 or later).
- Execution policy must allow running scripts. If needed, set the policy using:
  ```powershell
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
  ```

## Output File Location
The output file will be saved in the same directory as the script with a name in the following format:
```
SystemStatusReport_yyyyMMdd_HHmmss.txt
```

## Error Handling
If any errors occur during script execution, ensure that:
- You have sufficient permissions to access the drives and services.
- The execution policy allows script execution.

## License
This script is provided as-is, without any warranty. Feel free to modify and use it for personal or commercial purposes.


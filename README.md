# PowerShell Projects Collection

This repository contains a collection of PowerShell scripts developed for various system management tasks. Each project addresses a specific functionality, such as performance monitoring, malware scanning, system status reporting, and folder backup automation.

## **Projects Overview**

### **1. System Status Report Generator**
This script generates a detailed report of the current system status, including:
- Disk usage.
- Running services.
- Top active processes sorted by CPU usage.

**Features:**
- Generates a timestamped text report.
- Displays disk usage statistics, a list of running services, and top processes.

**How to Run:**
1. Open PowerShell.
2. Navigate to the script's directory.
   ```powershell
   cd "C:\path\to\script"
   ```
3. Run the script:
   ```powershell
   .\SystemStatusReportGenerator.ps1
   ```

---

### **2. Folder Backup Script with Retention Policy**
This script automates the process of creating backups for a specified folder while ensuring only a set number of recent backups are retained.

**Features:**
- Creates timestamped backups.
- Retains the 5 most recent backups by default.
- Excludes the backup folder from being backed up recursively.

**How to Run:**
1. Open PowerShell.
2. Navigate to the script's directory.
   ```powershell
   cd "C:\path\to\script"
   ```
3. Run the script:
   ```powershell
   .\FolderBackupWithRetention.ps1
   ```

---

### **3. Real-Time Performance Monitoring Tool**
This script collects key system performance metrics over a specified period and generates a CSV report along with graphical visualizations.

**Features:**
- Monitors CPU, memory, and disk usage in real-time.
- Generates a CSV report and saves performance graphs as PNG files.

**How to Run:**
1. Open PowerShell.
2. Navigate to the script's directory.
   ```powershell
   cd "C:\path\to\script"
   ```
3. Run the script:
   ```powershell
   .\RealTimePerformanceMonitor.ps1
   ```

---

### **4. Malware Scanner Tool with HTML Report**
This script scans files in a selected folder for potentially malicious files based on their extensions and size. It generates a detailed HTML report and displays a summary in the console.

**Features:**
- Allows graphical folder selection.
- Displays real-time progress during the scan.
- Flags files based on suspicious extensions and large size.
- Generates a detailed HTML report.

**How to Run:**
1. Open PowerShell **as Administrator**.
2. Navigate to the script's directory.
   ```powershell
   cd "C:\path\to\script"
   ```
3. Run the script:
   ```powershell
   .\MalwareScannerWithHTMLReport.ps1
   ```
4. Select the folder to scan when prompted.

---

## **License**
This repository is provided as-is, without any warranty. You are free to modify and use the scripts for personal or commercial purposes.

## **Author**
Developed by **Asaf Aharon**. Feel free to contact me for any questions or suggestions.


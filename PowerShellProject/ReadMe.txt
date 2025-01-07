# PowerShell Projects Collection

This document provides an overview of four PowerShell-based projects developed for various system management tasks. Each project addresses a specific functionality, such as performance monitoring, malware scanning, system status reporting, and folder backup automation.

---

## **1. System Status Report Generator**
### **Description**
This script generates a detailed report of the current system status, including:
- Disk usage.
- Running services.
- Top active processes sorted by CPU usage.

### **Output**
- The report is saved as a timestamped text file.
- Example output includes disk usage statistics, a list of running services, and top active processes.

### **How to Use**
1. Open PowerShell.
2. Navigate to the directory containing the script.
   ```powershell
   cd "C:\path\to\script"
   ```
3. Run the script:
   ```powershell
   .\SystemStatusReportGenerator.ps1
   ```

---

## **2. Folder Backup Script with Retention Policy**
### **Description**
This script automates the process of creating backups for a specified folder. It ensures that only a set number of recent backups are retained by automatically deleting older backups.

### **Features**
- Creates a backup with a timestamped name.
- Retains the 5 most recent backups by default.
- Excludes the backup folder from being backed up again.

### **How to Use**
1. Set up the script by defining the source folder path.
2. Open PowerShell.
3. Navigate to the directory containing the script.
   ```powershell
   cd "C:\path\to\script"
   ```
4. Run the script:
   ```powershell
   .\FolderBackupWithRetention.ps1
   ```

---

## **3. Real-Time Performance Monitoring Tool**
### **Description**
This script monitors key system performance metrics, such as CPU usage, memory usage, and disk usage, over a specified period. It generates a detailed CSV report and graphical visualizations.

### **Features**
- Real-time monitoring with user-defined duration and interval.
- Generates a CSV report with performance data.
- Creates graphs for CPU, memory, and disk usage, saved as PNG files.

### **How to Use**
1. Set up the script by defining the duration and interval.
2. Open PowerShell.
3. Navigate to the directory containing the script.
   ```powershell
   cd "C:\path\to\script"
   ```
4. Run the script:
   ```powershell
   .\RealTimePerformanceMonitor.ps1
   ```

---

## **4. Malware Scanner Tool with HTML Report**
### **Description**
This script scans files in a selected folder for potentially malicious files based on their extensions and size. It generates a detailed HTML report and displays a summary in the console.

### **Features**
- Allows graphical folder selection.
- Displays real-time progress during the scan.
- Flags files based on suspicious extensions and large size.
- Generates a detailed HTML report and opens it automatically upon completion.

### **How to Use**
1. Open PowerShell **as Administrator**.
2. Navigate to the directory containing the script.
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
All scripts in this collection are provided as-is, without any warranty. You are free to modify and use them for personal or commercial purposes.

## **Author**
Developed by Asaf Aharon. Feel free to contact me for any questions or suggestions.

---

This document provides a unified guide for managing and using these PowerShell tools efficiently.


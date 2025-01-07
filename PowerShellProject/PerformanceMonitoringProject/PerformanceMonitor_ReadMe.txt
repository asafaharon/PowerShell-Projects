# Real-Time Performance Monitoring Tool

This project is a **Real-Time Performance Monitoring Tool** developed in PowerShell. It collects key system performance metrics such as CPU usage, memory usage, and disk usage over a specified period and generates a detailed report along with graphical visualizations of the collected data.

## Features
1. **Real-Time Performance Monitoring:**
   - Monitors CPU usage, memory usage, and disk usage at regular intervals.
   - Records performance data over a user-defined duration.

2. **Detailed CSV Report:**
   - Generates a timestamped CSV report with the following fields:
     - `Timestamp`: The date and time of the measurement.
     - `CPU_Usage(%)`: The percentage of CPU in use.
     - `Memory_Usage(MB)`: The amount of memory in use (in MB).
     - `Disk_Usage(%)`: The percentage of disk space in use.

3. **Graphical Visualizations:**
   - Creates graphs for each metric (CPU, memory, and disk usage) showing changes over time.
   - Graphs are saved as PNG images with timestamped filenames.

## How to Use
1. **Set Up the Script:**
   - The script is ready to run as-is.
   - You can adjust the monitoring duration and interval by modifying the following variables in the script:
     ```powershell
     $durationMinutes = 1  # Set the total monitoring duration (in minutes)
     $intervalSeconds = 6  # Set the interval between measurements (in seconds)
     ```

2. **Run the Script:**
   1. Open PowerShell.
   2. Navigate to the directory containing the script.
      ```powershell
      cd "C:\path\to\script"
      ```
   3. Run the script:
      ```powershell
      .\third_project.ps1
      ```

3. **View the Results:**
   - After the script completes, you will find:
     - A CSV report with detailed performance data.
     - PNG images of the performance graphs.

## Example Output
**CSV Report:**
```
Timestamp,CPU_Usage(%),Memory_Usage(MB),Disk_Usage(%)
2025-01-07 10:05:38,15.2,2048,32.5
2025-01-07 10:05:44,12.8,2050,33.1
2025-01-07 10:05:50,18.6,2052,34.0
...
```

**Graphical Output:**
1. `CPU_Usage_Graph_yyyyMMdd_HHmmss.png`
2. `Memory_Usage_Graph_yyyyMMdd_HHmmss.png`
3. `Disk_Usage_Graph_yyyyMMdd_HHmmss.png`

## Customization
- You can customize the retention policy, graph colors, and other visual aspects by editing the relevant sections of the script.

## License
This project is provided as-is, without any warranty. You are free to modify and use it for personal or commercial purposes.

## Author
Developed by Asaf Aharon. Feel free to contact me for any questions or suggestions.


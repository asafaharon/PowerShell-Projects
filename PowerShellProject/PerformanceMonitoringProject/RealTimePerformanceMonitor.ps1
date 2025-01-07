# Tool: Performance Monitoring Tool

# Step 1: Define output path for the report
$outputPath = "$PSScriptRoot\PerformanceReport_$(Get-Date -Format 'yyyyMMdd_HHmmss').csv"
$outputGraphCPU = "$PSScriptRoot\CPU_Usage_Graph_$(Get-Date -Format 'yyyyMMdd_HHmmss').png"
$outputGraphMemory = "$PSScriptRoot\Memory_Usage_Graph_$(Get-Date -Format 'yyyyMMdd_HHmmss').png"
$outputGraphDisk = "$PSScriptRoot\Disk_Usage_Graph_$(Get-Date -Format 'yyyyMMdd_HHmmss').png"

# Step 2: Set monitoring duration and interval
$durationMinutes = 1  # Total monitoring duration in minutes
$intervalSeconds = 6 # Interval between measurements in seconds

# Step 3: Initialize CSV file with headers
"Timestamp,CPU_Usage(%),Memory_Usage(MB),Disk_Usage(%)" | Out-File -FilePath $outputPath

# Step 4: Function to get CPU and memory usage
function Get-PerformanceMetrics {
    $cpu = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples[0].CookedValue
    $memory = (Get-Counter '\Memory\Available MBytes').CounterSamples[0].CookedValue
    $totalMemory = (Get-CimInstance -ClassName Win32_ComputerSystem).TotalPhysicalMemory / 1MB
    $usedMemory = $totalMemory - $memory
    $disk = (Get-Counter '\LogicalDisk(_Total)\% Free Space').CounterSamples[0].CookedValue
    $diskUsage = 100 - $disk

    [PSCustomObject]@{
        Timestamp    = (Get-Date -Format 'yyyy-MM-dd HH:mm:ss')
        CPU_Usage    = [math]::Round($cpu, 2)
        Memory_Usage = [math]::Round($usedMemory, 2)
        Disk_Usage   = [math]::Round($diskUsage, 2)
    }
}

# Step 5: Monitor performance over time and generate intermediate graphs
$startTime = Get-Date
$metricsData = @()
while ((Get-Date) -lt $startTime.AddMinutes($durationMinutes)) {
    $metrics = Get-PerformanceMetrics
    $metricsData += $metrics
    $metricsLine = "$($metrics.Timestamp),$($metrics.CPU_Usage),$($metrics.Memory_Usage),$($metrics.Disk_Usage)"
Add-Content -Path $outputPath -Value $metricsLine

    # Generate intermediate graphs every minute
    if ((Get-Date).Subtract($startTime).TotalSeconds % 60 -eq 0) {
        Generate-Graph -title "CPU Usage Over Time" -yAxisLabel "CPU Usage (%)" -outputPath $outputGraphCPU -data $metricsData -property "CPU_Usage"
        Generate-Graph -title "Memory Usage Over Time" -yAxisLabel "Memory Usage (MB)" -outputPath $outputGraphMemory -data $metricsData -property "Memory_Usage"
        Generate-Graph -title "Disk Usage Over Time" -yAxisLabel "Disk Usage (%)" -outputPath $outputGraphDisk -data $metricsData -property "Disk_Usage"
        Write-Output "Intermediate graphs generated."
    }

    Start-Sleep -Seconds $intervalSeconds
}

# Step 6: Generate final graphs
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function Generate-Graph {
    param (
        [string]$title,
        [string]$yAxisLabel,
        [string]$outputPath,
        [array]$data,
        [string]$property
    )

    $bitmap = New-Object System.Drawing.Bitmap 800, 400
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.Clear([System.Drawing.Color]::White)

    $font = New-Object System.Drawing.Font "Arial", 10
    $brush = [System.Drawing.Brushes]::Black

$pen = New-Object System.Drawing.Pen ([System.Drawing.Color]::Blue), 2

    $maxValue = ($data | Measure-Object -Property $property -Maximum).Maximum
    $scaleFactor = 350 / $maxValue

    for ($i = 0; $i -lt $data.Count - 1; $i++) {
        $x1 = $i * (800 / ($data.Count - 1))
        $y1 = 400 - ($data[$i].$property * $scaleFactor)
        $x2 = ($i + 1) * (800 / ($data.Count - 1))
        $y2 = 400 - ($data[$i + 1].$property * $scaleFactor)
        $graphics.DrawLine($pen, $x1, $y1, $x2, $y2)
    }

    $graphics.DrawString($title, $font, $brush, 10, 10)
    $graphics.DrawString($yAxisLabel, $font, $brush, 10, 380)

    $bitmap.Save($outputPath)
    $graphics.Dispose()
    $bitmap.Dispose()
}

Generate-Graph -title "CPU Usage Over Time" -yAxisLabel "CPU Usage (%)" -outputPath $outputGraphCPU -data $metricsData -property "CPU_Usage"
Generate-Graph -title "Memory Usage Over Time" -yAxisLabel "Memory Usage (MB)" -outputPath $outputGraphMemory -data $metricsData -property "Memory_Usage"
Generate-Graph -title "Disk Usage Over Time" -yAxisLabel "Disk Usage (%)" -outputPath $outputGraphDisk -data $metricsData -property "Disk_Usage"

Write-Output "Performance monitoring completed. Report saved at: $outputPath"
Write-Output "Graphs saved at: $outputGraphCPU, $outputGraphMemory, $outputGraphDisk"

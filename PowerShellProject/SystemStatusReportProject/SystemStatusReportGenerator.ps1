# Tool: System Status Report Generator

# Step 1: Define the output path for the report
$outputPath = "$PSScriptRoot\SystemStatusReport_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"

# Step 2: Create a function to get disk usage
function Get-DiskUsage {
    Get-PSDrive -PSProvider FileSystem | ForEach-Object {
        [PSCustomObject]@{
            Name         = $_.Name
            UsedGB       = [math]::Round(($_.Used / 1GB), 2)
            FreeGB       = [math]::Round(($_.Free / 1GB), 2)
            TotalGB      = [math]::Round(($_.Used + $_.Free) / 1GB, 2)
            PercentFree  = [math]::Round(($_.Free / ($_.Used + $_.Free)) * 100, 2)
        }
    }
}

# Step 3: Create a function to check running services
function Get-RunningServices {
    Get-Service | Where-Object { $_.Status -eq 'Running' } |
    Sort-Object -Property DisplayName |
    Select-Object -Property Name, DisplayName, Status
}

# Step 4: Create a function to get top active processes by CPU
function Get-ActiveProcesses {
    Get-Process |
    Sort-Object -Property CPU -Descending |
    Select-Object -First 10 -Property Name, Id, CPU, @{Name='MemoryMB';Expression={[math]::Round($_.WorkingSet / 1MB, 2)}}
}

# Step 5: Generate the report
"Generating system status report..." | Out-File -FilePath $outputPath

"`n--- Disk Usage ---`n" | Out-File -FilePath $outputPath -Append
Get-DiskUsage | Format-Table -AutoSize | Out-String | Out-File -FilePath $outputPath -Append

"`n--- Running Services ---`n" | Out-File -FilePath $outputPath -Append
Get-RunningServices | Format-Table -AutoSize | Out-String | Out-File -FilePath $outputPath -Append

"`n--- Active Processes (Top by CPU) ---`n" | Out-File -FilePath $outputPath -Append
Get-ActiveProcesses | Format-Table -AutoSize | Out-String | Out-File -FilePath $outputPath -Append

"`nSystem status report generated at $outputPath."

# Tool: Folder Backup Script with Retention Policy

# Step 1: Define source and destination paths
$sourcePath = "C:\\Users\\asafa\\Desktop\\PowerShellProject\\secend_project"  # Source folder to back up
$destinationPath = "$PSScriptRoot\\Backups"  # Backup destination folder in the same directory as the script
$retentionCount = 5  # Number of backups to retain

# Step 2: Create a timestamped backup folder
$timestamp = Get-Date -Format 'yyyyMMdd_HHmmss'
$backupFolder = Join-Path -Path $destinationPath -ChildPath "Backup_$timestamp"

# Step 3: Ensure the destination folder exists
if (-not (Test-Path $destinationPath)) {
    New-Item -ItemType Directory -Path $destinationPath -Force
}

# Step 4: Copy the source folder to the backup folder, excluding the backup folder itself
if (Test-Path $sourcePath) {
    Copy-Item -Path (Join-Path $sourcePath "*") -Destination $backupFolder -Recurse -Force -Exclude "Backups"
    Write-Output "Backup created at: $backupFolder"
} else {
    Write-Output "Source folder does not exist: $sourcePath"
    exit
}

# Step 5: Manage retention by deleting old backups
$backups = Get-ChildItem -Path $destinationPath | Where-Object { $_.PSIsContainer } |
           Sort-Object -Property CreationTime -Descending

if ($backups.Count -gt $retentionCount) {
    $backupsToDelete = $backups | Select-Object -Skip $retentionCount
    foreach ($backup in $backupsToDelete) {
        Remove-Item -Path $backup.FullName -Recurse -Force
        Write-Output "Deleted old backup: $($backup.FullName)"
    }
}

Write-Output "Backup process completed successfully."

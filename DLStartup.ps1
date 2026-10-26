# 1. Path to files inside the DLconf folder
$GameInfoSource = Join-Path $PSScriptRoot "DLconf\gameinfo.gi"
$VideoTxtSource = Join-Path $PSScriptRoot "DLconf\video.txt"

# 2. Default Deadlock installation path
$DeadlockDir = "C:\Program Files (x86)\Steam\steamapps\common\Deadlock"

# If not found at default path, ask user for it
if (-not (Test-Path $DeadlockDir)) {
    $DeadlockDir = Read-Host "Enter the path to your Deadlock folder (e.g., D:\Steam\steamapps\common\Deadlock)"
}

# 3. Destination folders
$CitadelDir = Join-Path $DeadlockDir "game\citadel"
$CfgDir = Join-Path $CitadelDir "cfg"

# Ensure cfg folder exists
if (-not (Test-Path $CfgDir)) {
    New-Item -ItemType Directory -Path $CfgDir -Force | Out-Null
}

# 4. Copy the files
Copy-Item $GameInfoSource -Destination $CitadelDir -Force
Copy-Item $VideoTxtSource -Destination $CfgDir -Force

Write-Host "Custom files applied successfully!" -ForegroundColor Green

# 5. Launch Deadlock via Steam
Start-Process "steam://rungameid/1422450"
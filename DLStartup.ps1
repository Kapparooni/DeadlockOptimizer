# 1. Define paths
$GameInfoSource = "Path\to\DLconf\gameinfo.gi"
$CitadelDirectory = "Path\to\Deadlock\game\citadel"

$VideoTxtSource = "Path\to\DLconf\video.txt"  # Adjust if your backup video.txt is located elsewhere
$CfgDirectory = "Path\to\Deadlock\game\citadel\cfg"

# 2. Ensure destination folders exist
if (-not (Test-Path $CfgDirectory)) {
    New-Item -ItemType Directory -Path $CfgDirectory -Force | Out-Null
}

# 3. Copy/replace both files
Copy-Item -Path $GameInfoSource -Destination $CitadelDirectory -Force
Copy-Item -Path $VideoTxtSource -Destination $CfgDirectory -Force

Write-Host "Custom files applied successfully!" -ForegroundColor Green

# 4. Launch Deadlock via Steam
Start-Process "steam://rungameid/1422450"
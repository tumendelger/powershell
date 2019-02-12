# Create profile
$LOCATION = $env:USERPROFILE + "\Documents"
$PROFILE_DIR = "WindowsPowerShell"

Set-Location $LOCATION
mkdir $PROFILE_DIR -ErrorAction SilentlyContinue

# Copy profile script to new location
Copy-Item .\Microsoft.PowerShell_profile.ps1 $env:USERPROFILE\Documents\WindowPowerShell
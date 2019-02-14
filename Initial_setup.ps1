# Create profile
$LOCATION = $env:USERPROFILE + "\Documents"
$PROFILE_DIR = "WindowsPowerShell"

Set-Location $LOCATION
mkdir $PROFILE_DIR -ErrorAction SilentlyContinue

# Copy profile script to new location
Copy-Item .\Microsoft.PowerShell_profile.ps1 $env:USERPROFILE\Documents\WindowPowerShell

# Install Chocolatey packages
choco install git.install -y
choco install conemu -y
choco install openssh -y

# Install Nuget for PS
Install-PackageProvider NuGet -MinimumVersion '2.8.5.201' -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

# Install PowerShell modules
# Module to colorize directory listing
Install-Module Get-ChildItemColor

# Module to be used to show git info on terminal
Install-Module -Name 'posh-git'
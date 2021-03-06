# Import module posh-git
Import-Module -Name posh-git

#region Environment variables
$env:Path = "$env:Path;C:\Program Files\OpenSSH-Win64"
$env:GIT_SSH_COMMAND = '"C:\Program Files\OpenSSH-Win64\ssh.exe" -T'
$Env:USERNAME = "tumee"
#endregion

#region Aliases
function sources {Set-Location $Env:USERPROFILE\Sources}
function github {Set-location $env:USERPROFILE\Sources\github}
function gitlab {Set-location $env:USERPROFILE\Sources\gitlab}
function bitbucket {Set-location $env:USERPROFILE\Sources\bitbucket}
function doc { Set-Location $env:USERPROFILE\Documents}
function projects { Set-Location $env:USERPROFILE\Documents\Projects}

Set-Alias ls Get-ChildItemColor -option AllScope -Force
Set-Alias dir Get-ChildItemColor -option AllScope -Force
#endregion

#region Code
function prompt {
  $realLASTEXITCODE = $LASTEXITCODE

  Write-Host "$ENV:USERNAME @ " -NoNewline -ForegroundColor DarkYellow
  Write-Host "$ENV:COMPUTERNAME" -NoNewline -ForegroundColor Magenta
  Write-Host " : " -NoNewline -ForegroundColor DarkGray
  Write-Host $($(Get-Location) -replace ($env:USERPROFILE).Replace('\', '\\'), "~") -NoNewline -ForegroundColor DarkGreen
  Write-Host " : " -NoNewline -ForegroundColor DarkGray
  Write-Host (Get-Date -Format "dd/MM/yy HH:MM") -NoNewline -ForegroundColor DarkMagenta
  Write-Host " :" -NoNewline -ForegroundColor DarkGray

  $global:LASTEXITCODE = $realLASTEXITCODE

  Write-VcsStatus

  return " $ "
}

function IsAdmin {
   $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
   $currentPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator);
}
#endregion
# Import module posh-git
Import-Module -Name posh-git

#region Environment variables
$env:Path = "$env:Path;C:\Program Files\OpenSSH-Win64"
$Env:USERNAME = "Tumendelger Erdenebayar"
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
  Write-Host $($(Get-Location) -replace ($env:USERPROFILE).Replace('\', '\\'), "~") -NoNewline -ForegroundColor Blue
  Write-Host " : " -NoNewline -ForegroundColor DarkGray
  Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor DarkMagenta
  Write-Host " : " -NoNewline -ForegroundColor DarkGray

  $global:LASTEXITCODE = $realLASTEXITCODE

  Write-VcsStatus

  return "> "
}

#endregion

#region SSH connections

#endregion
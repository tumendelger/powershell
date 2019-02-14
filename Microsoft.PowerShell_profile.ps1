# Import module posh-git
Import-Module -Name posh-git

#region Environment variables
$env:Path = "$env:Path;C:\Program Files\OpenSSH-Win64"
$Env:USERNAME = "Tumendelger Erdenebayar"
#endregion

#region Aliases
function goto_github_folder {Set-location $env:USERPROFILE\Sources\github}
function goto_gitlab_folder {Set-location $env:USERPROFILE\Sources\gitlab}
function goto_bitbucket_folder {Set-location $env:USERPROFILE\Sources\bitbucket}

Set-Alias github goto_github_folder
Set-Alias gitlab goto_gitlab_folder
Set-Alias bitbucket goto_bitbucket_folder

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

  Write-Host

  return "> "
}
#endregion
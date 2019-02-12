function goto_github_folder {Set-location $env:USERPROFILE\Sources\github}
function goto_gitlab_folder {Set-location $env:USERPROFILE\Sources\gitlab}
function goto_bitbucket_folder {Set-location $env:USERPROFILE\Sources\bitbucket}

Set-Alias github goto_github_folder
Set-Alias gitlab goto_gitlab_folder
Set-Alias bitbucket goto_bitbucket_folder
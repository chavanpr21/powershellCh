echo $PSScriptRoot

$path_leaf  = Split-Path -Path $PSScriptRoot -Leaf

$path_test = Split-Path -Path C:\OnPremDeployment\DB_Upgrade.ps1 




$timestamp = Get-Date -Format FileDateTime


echo $path_leaf

echo $path_test
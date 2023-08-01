$scriptblock = {
param(
[string]$pruthvi = $(throw "parameter is a required parameter")
)

Write-Host "folder zero"
mkdir C:\work\Test_thread_folder

Write-Host "folder one"
mkdir C:\work\Test_thread_folder1

Write-Host "folder two"
mkdir C:\work\Test_thread_folder2

Write-Host "folder three"
mkdir C:\work\Test_thread_folder3

Write-Host "folder four"
mkdir C:\work\Test_thread_folder4

} 

Start-Job -ScriptBlock $scriptblock -name job1 -ArgumentList "Computer"
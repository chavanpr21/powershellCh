
$exitcode = 0
try{
$temp = C:\work\test_StopservicesNK.ps1  C:\work\smoke_224_Inst9_transforms.xml
Write-Host "Execution return : $temp"
Write-Host "lastexitcode : $lastexitcode"
}
catch
{
write-host "`nhost : catch"
write-output  "`noutput : catch"
#Write-Error "`nError : catch"
$exitcode = 1
}
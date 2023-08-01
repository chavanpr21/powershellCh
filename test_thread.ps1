$getserviceinfo = {
param(
[string]$ComputerName 
)
Write-Host "this is from $ComputerName"
}
$Computers = @("dsc11","dsc12","dsc04","dsc01","dsc02","dsc03",
         "salt02", "www.google.nl", "home-dc01", "www.test.com")

foreach($computer in $Computers){
    Start-Job -name $computer -ScriptBlock $getserviceinfo -ArgumentList $computer             
}
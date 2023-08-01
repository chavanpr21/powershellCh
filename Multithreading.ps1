#script created by Mark Bakker 
$getserviceinfo = { #this is the definition you call from start-job
    param( #accepts computername as input argument
        [string]$ComputerName
    )
    function checkSystem  ($ComputerName) { #accepts computername as input argument
        if ($ComputerName -eq "dsc01") {
            Start-Sleep -Seconds 1
        }
        else {
            Start-Sleep -Seconds 2
        }
        $result = Test-Connection $($ComputerName) -Count 1 -ErrorAction SilentlyContinue -TimeToLive 64
        Return $result
    } 

    #here the function gets called
    checkSystem $ComputerName
}

$Computers = @("dsc11","dsc12","dsc04","dsc01","dsc02","dsc03",
         "salt02", "www.google.nl", "home-dc01", "www.test.com")

foreach($computer in $Computers){
    Start-Job -name $computer -ScriptBlock $getserviceinfo `
             -ArgumentList $computer
}

$runningcount = (get-job | where State -eq running).count

while ($runningcount -ne 0){
    $runningcount = (get-job | where State -eq running).count
    Write-Output "sleeping for 1 second"
    Start-Sleep -Seconds 1
}

$endResult = get-job | Receive-Job -Force -Wait  #sometimes 1 job hang forever,force is needed otherwise you will wait foreverto get output :-)
$endResult | ogv

get-job | remove-job -Force
workflow paralleltest {  
 parallel {  
   #Get-CimInstance –ClassName Win32_OperatingSystem  
   #Get-Process –Name PowerShell*  
  # Get-CimInstance –ClassName Win32_ComputerSystem  
  # Get-Service –Name s*  
  }  
}  
  
Start-Transcript -Path c:\temp\ps.log  
paralleltest  

$createZip = {
    Param ([String]$source, [String]$zipfile)
    Process { 
        echo "zip: $source`n     --> $zipfile"
        throw "test"
    }
}

try {
    Start-Job -ScriptBlock $createZip -ArgumentList "abd", "acd"  
    echo "**Don't reach here if error**"
    LogThezippedFile
}
catch {
    echo "Captured: "
    $_ | fl * -force
}
Get-Job | Wait-Job 
Get-Job | receive-job 
Get-Job | Remove-Job 

Stop-Transcript  


$global:smokeTrans = "C:\work\smoke_224_Inst9_transforms.xml"
Function CreateFolderStructure {  
  ##CREATE RUNSPACE
  $PowerShell = [powershell]::Create()
  [void]$PowerShell.AddScript({  
        Write-Host "In The ScriptBlock"
       # Start-Job -FilePath "$PSScriptRoot\Folder_Structure.ps1" -ArgumentList "$smokeTrans" -Name "folderStructureJob"
    # "$PSScriptRoot\Folder_Structure.ps1" $global:smokeTrans
    })
  #Invoke the command
  $PowerShell.Invoke()
  $PowerShell.Dispose()
}
CreateFolderStructure
#Write-Host "$PSScriptRoot $smokeTrans"
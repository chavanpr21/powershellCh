$smokeTrans = "C:\work\smoke_224_Inst9_transforms.xml"
Function CreateFolderStructure {  
  ##CREATE RUNSPACE
  $PowerShell = [powershell]::Create()
  [void]$PowerShell.AddScript({
       # Param ([string]$Filename)
      &"$PSScriptRoot\Folder_Structure.ps1" $smokeTrans
    })#.AddArgument("C:\work\smoke_224_Inst9_transforms.xml")
  #Invoke the command
  $PowerShell.Invoke()
  $PowerShell.Dispose()
}
CreateFolderStructure
$ps = [powershell]::Create()
$ScriptVar = $ps.AddScript({##SCRIPT BLOCK
		$result_FolderStructure = & " C:\work\Folder_Structure.ps1" "C:\work\smoke_224_Inst9_transforms.xml"
		# $Result_PreDeploymentCheckScript = & "C:\work\Pre-deployment_Checks.ps1" "C:\work\smoke_224_Inst9_transforms.xml"                                   
					}).BeginInvoke()

"result: " + $ps.EndInvoke($ScriptVar)
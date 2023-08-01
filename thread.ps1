$scriptBlock = {
C:\work\Folder_Structure.ps1 C:\work\smoke_224_Inst9_transforms.xml
}
$ps = [powershell]::Create()
$asyncResult = $ps.AddScript({##SCRIPT BLOCK
            $scriptBlock
		#C:\work\Folder_Structure.ps1 C:\work\smoke_224_Inst9_transforms.xml                                        
					}).BeginInvoke()
		
while(-not $asyncResult.IsCompleted) {
Start-Sleep 1
Write-Host "this is while loop"
}
# Get the script's success output.
	"result: " + $ps.EndInvoke($asyncResult)
	$ps.Dispose()
											
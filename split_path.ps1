$selectedfile = "C:\work\echo.ps1"
	
	Write-Host $selectedfile
		
	$folder = (Get-Item C:\work\echo.ps1).Directory
		
	Write-Host $folder

$joinedPath = Join-Path $selectedfile + "echo.ps1"
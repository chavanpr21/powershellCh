$Button3.Add_Click({
    cmd /c start powershell.exe -noexit -file "C:\Scripts\script.ps1" -
    
    [System.Windows.Forms.Application]::DoEvents()
})
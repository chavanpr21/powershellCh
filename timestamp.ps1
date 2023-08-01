$timestamp = Get-Date -Format "dd yyyy dd mm hh mm ss" | ForEach-Object { $_ -replace ":", "." -replace " " , "_"}
New-Item -Path C:\Test\work21\$timestamp -Type Directory


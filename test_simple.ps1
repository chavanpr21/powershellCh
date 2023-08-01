$Settings_FilePath = "C:\work3\AMT_DEV_tstq1_1.xml"

[xml]$Settings_xml = Get-Content $Settings_FilePath

write-host $settings_xml.Deployment.filename
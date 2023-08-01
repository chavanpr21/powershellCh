#region Script Settings
#<ScriptSettings xmlns="http://tempuri.org/ScriptSettings.xsd">
#  <ScriptPackager>
#    <process>powershell.exe</process>
#    <arguments />
#    <extractdir>%TEMP%</extractdir>
#    <files />
#    <usedefaulticon>true</usedefaulticon>
#    <showinsystray>false</showinsystray>
#    <altcreds>false</altcreds>
#    <efs>true</efs>
#    <ntfs>true</ntfs>
#    <local>false</local>
#    <abortonfail>true</abortonfail>
#    <product />
#    <version>1.0.0.1</version>
#    <versionstring />
#    <comments />
#    <company />
#    <includeinterpreter>false</includeinterpreter>
#    <forcecomregistration>false</forcecomregistration>
#    <consolemode>false</consolemode>
#    <EnableChangelog>false</EnableChangelog>
#    <AutoBackup>false</AutoBackup>
#    <snapinforce>false</snapinforce>
#    <snapinshowprogress>false</snapinshowprogress>
#    <snapinautoadd>2</snapinautoadd>
#    <snapinpermanentpath />
#    <cpumode>1</cpumode>
#    <hidepsconsole>false</hidepsconsole>
#  </ScriptPackager>
#</ScriptSettings>
#endregion

#region ScriptForm Designer

#region Constructor

[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

#endregion

#region Post-Constructor Custom Code

#endregion

#region Form Creation
#Warning: It is recommended that changes inside this region be handled using the ScriptForm Designer.
#When working with the ScriptForm designer this region and any changes within may be overwritten.
#~~< Form1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Form1 = New-Object System.Windows.Forms.Form
$Form1.ClientSize = New-Object System.Drawing.Size(578, 375)
$Form1.Text = "Form1"
#~~< txtFiledisplay >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$txtFiledisplay = New-Object System.Windows.Forms.RichTextBox
$txtFiledisplay.Location = New-Object System.Drawing.Point(278, 115)
$txtFiledisplay.Size = New-Object System.Drawing.Size(288, 248)
$txtFiledisplay.TabIndex = 6
$txtFiledisplay.Text = ""
#~~< loadfile >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$loadfile = New-Object System.Windows.Forms.Button
$loadfile.Location = New-Object System.Drawing.Point(19, 182)
$loadfile.Size = New-Object System.Drawing.Size(75, 23)
$loadfile.TabIndex = 5
$loadfile.Text = "loadfile"
$loadfile.UseVisualStyleBackColor = $true
$loadfile.add_Click({LoadfileClick($loadfile)})
#~~< LB_filename >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$LB_filename = New-Object System.Windows.Forms.Label
$LB_filename.Location = New-Object System.Drawing.Point(12, 93)
$LB_filename.Size = New-Object System.Drawing.Size(100, 23)
$LB_filename.TabIndex = 4
$LB_filename.Text = "FILENAME"
$LB_filename.add_Click({LB_filenameClick($LB_filename)})
#~~< cmb_ver >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$cmb_ver = New-Object System.Windows.Forms.ComboBox
$cmb_ver.FormattingEnabled = $true
$cmb_ver.Location = New-Object System.Drawing.Point(392, 45)
$cmb_ver.Size = New-Object System.Drawing.Size(121, 21)
$cmb_ver.TabIndex = 3
$cmb_ver.Text = "VER"
$cmb_ver.Items.AddRange([System.Object[]](@("1", "2")))
$cmb_ver.SelectedIndex = -1
#~~< cmb_env >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$cmb_env = New-Object System.Windows.Forms.ComboBox
$cmb_env.FormattingEnabled = $true
$cmb_env.Location = New-Object System.Drawing.Point(265, 45)
$cmb_env.Size = New-Object System.Drawing.Size(121, 21)
$cmb_env.TabIndex = 2
$cmb_env.Text = "ENV"
$cmb_env.Items.AddRange([System.Object[]](@("tstq1", "tstp1")))
$cmb_env.SelectedIndex = -1
#~~< cmb_sdlc >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$cmb_sdlc = New-Object System.Windows.Forms.ComboBox
$cmb_sdlc.FormattingEnabled = $true
$cmb_sdlc.Location = New-Object System.Drawing.Point(129, 45)
$cmb_sdlc.Size = New-Object System.Drawing.Size(121, 21)
$cmb_sdlc.TabIndex = 1
$cmb_sdlc.Text = "SDLC"
$cmb_sdlc.Items.AddRange([System.Object[]](@("DEV", "QA")))
$cmb_sdlc.SelectedIndex = -1
#~~< cmb_client >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$cmb_client = New-Object System.Windows.Forms.ComboBox
$cmb_client.FormattingEnabled = $true
$cmb_client.Location = New-Object System.Drawing.Point(2, 45)
$cmb_client.Size = New-Object System.Drawing.Size(121, 21)
$cmb_client.TabIndex = 0
$cmb_client.Text = "CLIENT"
$cmb_client.Items.AddRange([System.Object[]](@("AMT", "POC")))
$cmb_client.SelectedIndex = -1
$Form1.Controls.Add($txtFiledisplay)
$Form1.Controls.Add($loadfile)
$Form1.Controls.Add($LB_filename)
$Form1.Controls.Add($cmb_ver)
$Form1.Controls.Add($cmb_env)
$Form1.Controls.Add($cmb_sdlc)
$Form1.Controls.Add($cmb_client)

#endregion

#region Custom Code

#endregion

#region Event Loop

function Main{
	[System.Windows.Forms.Application]::EnableVisualStyles()
	[System.Windows.Forms.Application]::Run($Form1)
}

#endregion

#endregion

#region Event Handlers

function LB_filenameClick( $object ){
	$file_name = $cmb_client.SelectedItem + "_" + $cmb_sdlc.SelectedItem + "_" + $cmb_env.SelectedItem + "_" + $cmb_ver.SelectedItem + ".xml"
	
	$LB_filename.Text = $file_name
	Write-Host $file_name
	
}


function LoadfileClick($object)
{
	$loadedfile = $LB_filename.Text
	#Write-Host "this is in loadfile" $LB_filename.Text
	
	$file_data = Get-Content C:\work3\$loadedfile
	Write-Host $file_data
	$txtFiledisplay.Text = $file_data
}

Main # This call must remain below all other event functions

#endregion

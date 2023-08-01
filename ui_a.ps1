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
$Form1.ClientSize = New-Object System.Drawing.Size(766, 353)
$Form1.Text = "Form1"
#~~< destination >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$destination = New-Object System.Windows.Forms.Label
$destination.Location = New-Object System.Drawing.Point(545, 98)
$destination.Size = New-Object System.Drawing.Size(75, 23)
$destination.TabIndex = 12
$destination.Text = "DestServer"
#~~< txtDestinationServer >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$txtDestinationServer = New-Object System.Windows.Forms.TextBox
$txtDestinationServer.Location = New-Object System.Drawing.Point(626, 101)
$txtDestinationServer.Size = New-Object System.Drawing.Size(100, 20)
$txtDestinationServer.TabIndex = 11
$txtDestinationServer.Text = ""
#~~< txtUserName >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$txtUserName = New-Object System.Windows.Forms.TextBox
$txtUserName.Location = New-Object System.Drawing.Point(626, 67)
$txtUserName.Size = New-Object System.Drawing.Size(100, 20)
$txtUserName.TabIndex = 10
$txtUserName.Text = ""
#~~< User_Name >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$User_Name = New-Object System.Windows.Forms.Label
$User_Name.Location = New-Object System.Drawing.Point(545, 70)
$User_Name.Size = New-Object System.Drawing.Size(75, 23)
$User_Name.TabIndex = 9
$User_Name.Text = "UserName"
#~~< XmlFile >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$XmlFile = New-Object System.Windows.Forms.RichTextBox
$XmlFile.Location = New-Object System.Drawing.Point(297, 127)
$XmlFile.Size = New-Object System.Drawing.Size(233, 214)
$XmlFile.TabIndex = 8
$XmlFile.Text = ""
#~~< cmb_Version >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$cmb_Version = New-Object System.Windows.Forms.ComboBox
$cmb_Version.FormattingEnabled = $true
$cmb_Version.Location = New-Object System.Drawing.Point(409, 57)
$cmb_Version.Size = New-Object System.Drawing.Size(121, 21)
$cmb_Version.TabIndex = 7
$cmb_Version.Text = "Version"
$cmb_Version.Items.AddRange([System.Object[]](@("1", "2", "3", "4")))
$cmb_Version.SelectedIndex = -1
#~~< LoadFile >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$LoadFile = New-Object System.Windows.Forms.Button
$LoadFile.Location = New-Object System.Drawing.Point(192, 98)
$LoadFile.Size = New-Object System.Drawing.Size(124, 23)
$LoadFile.TabIndex = 5
$LoadFile.Text = "LoadTransformFile"
$LoadFile.UseVisualStyleBackColor = $true
$LoadFile.add_Click({LoadFileClick($LoadFile)})
#~~< cmb_sdlc >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$cmb_sdlc = New-Object System.Windows.Forms.ComboBox
$cmb_sdlc.FormattingEnabled = $true
$cmb_sdlc.Location = New-Object System.Drawing.Point(149, 57)
$cmb_sdlc.Size = New-Object System.Drawing.Size(121, 21)
$cmb_sdlc.TabIndex = 4
$cmb_sdlc.Text = "SDLC"
$cmb_sdlc.Items.AddRange([System.Object[]](@("DEV", "QA", "INT")))
$cmb_sdlc.SelectedIndex = -1
#~~< cmb_env >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$cmb_env = New-Object System.Windows.Forms.ComboBox
$cmb_env.FormattingEnabled = $true
$cmb_env.Location = New-Object System.Drawing.Point(276, 57)
$cmb_env.Size = New-Object System.Drawing.Size(121, 21)
$cmb_env.TabIndex = 3
$cmb_env.Text = "Env"
$cmb_env.Items.AddRange([System.Object[]](@("tstp1", "tstq1", "tsta1")))
$cmb_env.SelectedIndex = -1
#~~< cmb_ClientName >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$cmb_ClientName = New-Object System.Windows.Forms.ComboBox
$cmb_ClientName.FormattingEnabled = $true
$cmb_ClientName.Location = New-Object System.Drawing.Point(12, 57)
$cmb_ClientName.Size = New-Object System.Drawing.Size(121, 21)
$cmb_ClientName.TabIndex = 2
$cmb_ClientName.Text = "Client"
$cmb_ClientName.Items.AddRange([System.Object[]](@("AMT", "UBS", "POC")))
$cmb_ClientName.SelectedIndex = -1

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

function LoadFileClick( $object ){
#$LoadedFile.Text= $cmb_ClientName.SelectedValue + $cmb_env.SelectedValue + $cmb_sdlc.SelectedValue
	$file_name = $cmb_ClientName.SelectedItem + "_" + $cmb_sdlc.SelectedItem + "_" + $cmb_env.SelectedItem + "_" + $cmb_Version.SelectedItem + ".xml"
	$Settings_FilePath = "C:\work3\$file_name"
	[xml]$Settings_Xml = (Get-Content $Settings_FilePath)
	$ns = New-Object Xml.XmlNamespaceManager($Settings_Xml.NameTable)
	$deployment = $Settings_Xml.transforms.Deployment
	
	
}

Main # This call must remain below all other event functions

#endregion

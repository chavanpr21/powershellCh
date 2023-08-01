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

$System = New-Object -ComObject "Kixforms.System"

#endregion

#region Post-Constructor Custom Code

#endregion

#region Form Creation
#Warning: It is recommended that changes inside this region be handled using the ScriptForm Designer.
#When working with the ScriptForm designer this region and any changes within may be overwritten.

#~~< Form1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Form1 = $System.Form()
$Form1.Text = "Form1"
$Form1.Size = $System.Size(648, 450)
#~~< Form2 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Form2 = $System.Form()
$Form2.Text = "Form2"
$Form2.Size = $System.Size(648, 450)
#~~< ComboBox1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$ComboBox1 = $Form1.Controls.Add($System.ComboBox())
$ComboBox1.SelectedIndex = -1
$ComboBox1.Size = $System.Size(121, 21)
$ComboBox1.TabIndex = 1
$ComboBox1.Location = $System.Point(157, 98)
#~~< TextBox1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$TextBox1 = $Form1.Controls.Add($System.TextBox())
$TextBox1.TabIndex = 0
$TextBox1.Size = $System.Size(100, 20)
$TextBox1.Location = $System.Point(265, 37)

#endregion

#region Custom Code

#endregion

#region Event Loop

function Main{
	$System.Application().EnableVisualStyles()
	$Form1.Show()
	while($Form1.Visible){
		$command=$System.DoEvents()
		if($command){Invoke-Expression $command}
	}
}

#endregion

#endregion

#region Event Handlers

Main #This call must remain below all other event functions

#endregion

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
$Form1.Size = $System.Size(487, 367)
#~~< Button1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Button1 = $Form1.Controls.Add($System.Button())
$Button1.Text = "Button1"
$Button1.TabIndex = 0
$Button1.Size = $System.Size(75, 23)
$Button1.Location = $System.Point(354, 260)
$Button1.Click = "Button1Click( `$Button1` )"
#~~< OpenFileDialog1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$OpenFileDialog1 = $System.OpenFileDialog()
$OpenFileDialog1.FileName = "selected File"

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

function Button1Click( $object ){
	 $OpenFileDialog1.ShowDialog()
	$selectedfile = $OpenFileDialog1.filename	
	Write-Host $selectedfile
		
	$folder = (Get-Item $OpenFileDialog1.filename).Directory		
	Write-Host $folder
	
}

Main #This call must remain below all other event functions

#endregion

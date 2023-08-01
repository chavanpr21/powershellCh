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
$Form1.Size = $System.Size(441, 288)
#~~< Button2 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Button2 = $Form1.Controls.Add($System.Button())
$Button2.Text = "ComboBtn"
$Button2.TabIndex = 2
$Button2.Size = $System.Size(75, 23)
$Button2.Location = $System.Point(154, 137)
$Button2.Click = "ComboBtn( `$Button2` )"
#~~< ComboBox1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$ComboBox1 = $Form1.Controls.Add($System.ComboBox())
#~~< ComboBox1.Items >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$ComboBox1Items1 = $ComboBox1.Items.Add("C:\Users\chavanpr\Desktop\notes\ps_ui.ps1")
$ComboBox1Items2 = $ComboBox1.Items.Add("C:\Users\chavanpr\Desktop\notes\ps_ui2.ps1")
$ComboBox1Items3 = $ComboBox1.Items.Add("C:\Users\chavanpr\Desktop\notes\ps_ui3.ps1")
$ComboBox1Items4 = $ComboBox1.Items.Add("C:\Users\chavanpr\Desktop\notes\ps_ui4.ps1")
$ComboBox1.SelectedIndex = -1
$ComboBox1.Size = $System.Size(121, 21)
$ComboBox1.TabIndex = 1
$ComboBox1.Location = $System.Point(122, 42)
$ComboBox1.SelectedIndexChanged = "ComboBox1SelectedIndexChanged( `$ComboBox1` )"
$Form1.Click = "ChosseFile( `$Form1` )"
#~~< OpenFileDialog1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$OpenFileDialog1 = $System.OpenFileDialog()
$OpenFileDialog1.InitialDirectory = "C:\Users\chavanpr\Desktop\notes"
$OpenFileDialog1.FileName = "ps_ui.ps1"
$OpenFileDialog1.Title = "Select File"

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


function ChosseFile($object)
{
	$selectedFile = $OpenFileDialog1.ShowDialog();
	#Write-Host $selectedFile.FileName
	Write-Host $OpenFileDialog1.InitialDirectory		
	Write-Host $OpenFileDialog1.FileName
	#Write-Host $ComboBox1.FileName
	#Get-Content $OpenFileDialog1.FileName
	#C:\Users\chavanpr\Desktop\notes\ps_ui.ps1
	#powershell.exe $OpenFileDialog1	
	Write-Host "Completed"
	
}


function ComboBtn($object)
{
	Write-Host "$ComboBox1Items1"
	#powershell.exe $ComboBox1Items1
	#Write-Host $ComboBox1.SelectedIndex
	#Write-Host $ComboBox1.SelectedIndex.value
	#Write-Host $ComboBox1.SelectedIndexChanged
	#powershell.exe $ComboBox1Items1.SelectedIndex
		
	Write-Host $ComboBox1.Items[$ComboBox1.SelectedIndex]
	
	powershell.exe $ComboBox1.Items[$ComboBox1.SelectedIndex]
		
	Write-Host "this is combo"
}

function ComboBox1SelectedIndexChanged( $object ){

}

Main # This call must remain below all other event functions

#endregion

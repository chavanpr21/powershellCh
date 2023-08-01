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
$Form1.Size = $System.Size(599, 431)
#~~< btnString >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$btnString = $Form1.Controls.Add($System.Button())
$btnString.Text = "printString"
$btnString.TabIndex = 1
$btnString.Size = $System.Size(75, 23)
$btnString.Location = $System.Point(184, 254)
$btnString.Click = "BtnStringClick( `$btnString` )"
#~~< rtfString >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$rtfString = $Form1.Controls.Add($System.RichTextBox())
$rtfString.Rtf = "{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcharset0 Microsoft Sans Serif;}}"+[char]13+[char]10+"\viewkind4\uc1\pard\f0\fs17\par"+[char]13+[char]10+"}"+[char]13+[char]10
$rtfString.Location = $System.Point(40, 52)
$rtfString.Size = $System.Size(363, 149)
$rtfString.TabIndex = 0

#endregion

#region Custom Code
function time_stamp { process { "$(Get-Date): $_ "} }
					 
function writehosttime
{
	param(
		[string]$logmsg = $(throw "logmsg is a required parameter")
	)
	$time = time_stamp
	Write-Host " $time $logmsg "
}	
										
function string_time
{
	param(
		[string]$msg = $(throw "msg is required parameter")							
	)
	$time = time_stamp
	return "`n $time $msg "
}
#$temp = string_time "this is string time check"

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

	function BtnStringClick($object)
	{
		$temp = string_time "this is string time checkup"
		$rtfString.text = $temp 
		
	$temp2 = string_time "this appending string check"
		
	$rtfString.text = $rtfString.text + $temp2
}

Main # This call must remain below all other event functions

#endregion

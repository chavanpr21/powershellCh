#Start-Job -scriptblock {
#region Script Settings
#<ScriptSettings xmlns="http://tempuri.org/ScriptSettings.xsd">
#  <ScriptPackager>
#    <process>powershell.exe</process>
#    <arguments />
#    <extractdir>%TEMP%</extractdir>
#    <files>C:\work\Scripts\CopyFilesToRemoteServer.ps1|C:\work\Scripts\Folder_Structure.ps1</files>
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
#    <cpumode>2</cpumode>
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
$Form1.ClientSize = New-Object System.Drawing.Size(611, 461)
$Form1.Text = "Form1"
#~~< GroupBox1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$GroupBox1 = New-Object System.Windows.Forms.GroupBox
$GroupBox1.Location = New-Object System.Drawing.Point(122, 57)
$GroupBox1.Size = New-Object System.Drawing.Size(237, 294)
$GroupBox1.TabIndex = 7
$GroupBox1.TabStop = $false
$GroupBox1.Text = "Deploy"
#~~< RdPreDeploy >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$RdPreDeploy = New-Object System.Windows.Forms.RadioButton
$RdPreDeploy.ImageAlign = [System.Drawing.ContentAlignment]::MiddleLeft
$RdPreDeploy.Location = New-Object System.Drawing.Point(6, 59)
$RdPreDeploy.Size = New-Object System.Drawing.Size(104, 24)
$RdPreDeploy.TabIndex = 9
$RdPreDeploy.TabStop = $true
$RdPreDeploy.Text = "Predeploy"
$RdPreDeploy.UseVisualStyleBackColor = $true
#~~< RdDeployful >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$RdDeployful = New-Object System.Windows.Forms.RadioButton
$RdDeployful.Location = New-Object System.Drawing.Point(6, 114)
$RdDeployful.Size = New-Object System.Drawing.Size(104, 24)
$RdDeployful.TabIndex = 8
$RdDeployful.TabStop = $true
$RdDeployful.Text = "FullDeploy"
$RdDeployful.UseVisualStyleBackColor = $true
#~~< StopServices >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$StopServices = New-Object System.Windows.Forms.RadioButton
$StopServices.Location = New-Object System.Drawing.Point(6, 167)
$StopServices.Size = New-Object System.Drawing.Size(109, 24)
$StopServices.TabIndex = 7
$StopServices.TabStop = $true
$StopServices.Text = "StopServices"
$StopServices.UseVisualStyleBackColor = $true
#~~< Button1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$Button1 = New-Object System.Windows.Forms.Button
$Button1.Location = New-Object System.Drawing.Point(74, 260)
$Button1.Size = New-Object System.Drawing.Size(117, 23)
$Button1.TabIndex = 6
$Button1.Text = "Deploy"
$Button1.UseVisualStyleBackColor = $true
$Button1.add_Click({Button1Click($Button1)})
$GroupBox1.Controls.Add($RdPreDeploy)
$GroupBox1.Controls.Add($RdDeployful)
$GroupBox1.Controls.Add($StopServices)
$GroupBox1.Controls.Add($Button1)
$Form1.Controls.Add($GroupBox1)
#~~< BackgroundWorker1 >~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
$BackgroundWorker1 = New-Object System.ComponentModel.BackgroundWorker

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

function Button1Click($object)
	{		
		[System.Windows.Forms.MessageBox]::Show("deployment in progress", "ABC", [System.Windows.Forms.MessageBoxDefaultButton]::Button1,
		[System.Windows.Forms.MessageBoxIcon]::Information)  
		
$argumentfile = 	"C:\work\Scripts\smoke_224_Inst9_transforms.xml"
$scriptfolder = "C:\work\Scripts\Folder_Structure.ps1"
#Start-Job -ScriptBlock {	
try{
	if ($RdPreDeploy.Checked -eq "true")
	{
		#Start-Job -ScriptBlock { & $scriptfolder $argumentfile }    -Name "UI_FolderStructure"		
        $UI_FolderStructure = Start-Job -FilePath $scriptfolder -ArgumentList $argumentfile -Name "UI_FolderStructure"
	        do {
		        	Write-Host "Creating Folders..."
				}                                    
					while ((Get-Job -Name "UI_FolderStructure").State -eq 'Running');
						
			if ((Get-Job -Name UI_FolderStructure).ChildJobs[0].Error -ne '')
				{
					Write-Host "Folder Structure Creation failed.."
					throw(Get-Job -Name UI_FolderStructure).ChildJobs[0].Error
                    
			}        
			#if ((Get-Job -Name UI_FolderStructure).State -eq 'Completed')
            else{
					Remove-Job -Name "UI_FolderStructure"
					$Result_PreDeploymentCheckScript = & " C:\work\Scripts\Pre-deployment_Checks.ps1" "C:\work\Scripts\smoke_224_Inst9_transforms.xml"
					Write-Host " $Result_PreDeploymentCheckScript "             	 
			}			
	}		
} catch {
	throw $_.Exception.Message
}
#} -Name deploy_minor
}

Main # This call must remain below all other event functions

#endregion
#} -Name deploy
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
								
	$form = New-Object System.Windows.Forms.Form			
			$form.Size = New-Object System.Drawing.Size(400, 400)
			$form.StartPosition = 'CenterScreen'
				$OpenFolder.SelectedPath = $textBox.Text		
			$okButton = New-Object System.Windows.Forms.Button
			$okButton.Location = New-Object System.Drawing.Point(75, 120)
			$okButton.Size = New-Object System.Drawing.Size(75, 23)
			$okButton.Text = 'OK'
            $okButton.add_Click({PathSet($okButton)})
			$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
			$form.AcceptButton = $okButton
			$form.Controls.Add($okButton)
			
            $btnDailog = New-Object System.Windows.Forms.Button
			$btnDailog.Location = New-Object System.Drawing.Point(120, 75)
            $btnDailog.Size = New-Object System.Drawing.Size(75, 23)   	
            $form.Controls.Add($btnDailog)
            $btnDailog.add_Click({LoadFileClick($btnDailog)})
            					
			$textBox = New-Object System.Windows.Forms.TextBox
			$textBox.Location = New-Object System.Drawing.Point(10, 40)
			$textBox.Size = New-Object System.Drawing.Size(260, 20)
            $textBox.Text = "C:\log"
			$form.Controls.Add($textBox)
			             
            $OpenFolder = New-Object System.Windows.Forms.FolderBrowserDialog
            #$OpenFolder.Title = "Please Select Folder to Populate Logs"
            $OpenFolder.SelectedPath = "C:\work3"
               					
			$form.Topmost = $true
								
		    $form.Add_Shown({ $textBox.Select() })
			$result = $form.ShowDialog()

function LoadFileClick($object){
$OpenFolder.ShowDialog()
$textBox.Text = $OpenFolder.SelectedPath
}


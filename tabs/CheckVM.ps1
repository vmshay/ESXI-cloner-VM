#Create check Tab
$CheckTab = New-Object System.Windows.Forms.TabPage
$CheckTab.Text = 'Check VM'
$CheckTab.Enabled = $false

#Notice
$CheckNotice = New-Object System.Windows.Forms.Label
$CheckNotice.text = "This tab avaliable ONLY for ESXI VM's!"
$CheckNotice.AutoSize = $true
$CheckNotice.width = 25
$CheckNotice.Location= New-Object System.Drawing.Point(10,10)

#Check SSH status
$CheckSSHButton = New-Object System.Windows.Forms.Button
$CheckSSHButton.text = "Check SSH status"
$CheckSSHButton.AutoSize = $true
$CheckSSHButton.Location= New-Object System.Drawing.Point(10,30)

#Check SecureBoot stastus
$CheckSecureButton = New-Object System.Windows.Forms.Button
$CheckSecureButton.text = "Check SecureBoot status"
$CheckSecureButton.AutoSize = $true
$CheckSecureButton.Location= New-Object System.Drawing.Point(120,30)

#Check script status
$CheckScriptButton = New-Object System.Windows.Forms.Button
$CheckScriptButton.text = "Check Script status"
$CheckScriptButton.AutoSize = $true
$CheckScriptButton.Location= New-Object System.Drawing.Point(265,30)

$CheckSSHResult = New-Object System.Windows.Forms.TextBox
$CheckSSHResult.ReadOnly = $true
$CheckSSHResult.location = New-Object System.Drawing.Point(10,60)

$CheckSecureResult = New-Object System.Windows.Forms.TextBox
$CheckSecureResult.ReadOnly = $true
$CheckSecureResult.location = New-Object System.Drawing.Point(120,60)

$CheckScriptResult = New-Object System.Windows.Forms.TextBox
$CheckScriptResult.ReadOnly = $true
$CheckScriptResult.location = New-Object System.Drawing.Point(265,60)



$FixSSHButton = New-Object System.Windows.Forms.Button
$FixSSHButton.text = "Fix"
$FixSSHButton.AutoSize = $true
$FixSSHButton.Location= New-Object System.Drawing.Point(10,90)



$FixSecureButton = New-Object System.Windows.Forms.Button
$FixSecureButton.text = "Fix"
$FixSecureButton.AutoSize = $true
$FixSecureButton.Location= New-Object System.Drawing.Point(120,90)


$FixScriptButton = New-Object System.Windows.Forms.Button
$FixScriptButton.text = "Fix"
$FixScriptButton.AutoSize = $true
$FixScriptButton.Location= New-Object System.Drawing.Point(265,90)

$CheckTab.Controls.AddRange(@($CheckNotice,$CheckSSHButton,$CheckSecureButton,
                            $CheckScriptButton,$CheckSSHResult,$CheckSecureResult,
                            $CheckScriptResult,$FixSSHButton,$FixSecureButton,
                            $FixScriptButton))
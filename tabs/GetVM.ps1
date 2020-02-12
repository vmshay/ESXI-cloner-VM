#Create Get-VM tab
$VMTab = New-Object System.Windows.Forms.TabPage
$VMTab.Text = 'Get-VM'
$VMTab.Enabled = $Flag_Connected

$SelectOSLabel = New-Object System.Windows.Forms.Label
$SelectOSLabel.text = "Select OS for search"
$SelectOSLabel.AutoSize = $true
$SelectOSLabel.width = 25
$SelectOSLabel.location = New-Object System.Drawing.Point(10,10)

#Select OS
#LinuxCheckbox
$LinRadioButton = New-Object System.Windows.Forms.RadioButton
$LinRadioButton.AutoSize = $true
$LinRadioButton.Text = "Linux"
$LinRadioButton.Checked = $true
$LinRadioButton.Location = New-Object System.Drawing.Point(10, 30)

#WindowsCheckbox
$WinRadioButton = New-Object System.Windows.Forms.RadioButton
$WinRadioButton.AutoSize = $true
$WinRadioButton.Text = "Windows"
$WinRadioButton.Location = New-Object System.Drawing.Point(10, 50)

#ESXICheckbox
$ESXRadioButton = New-Object System.Windows.Forms.RadioButton
$ESXRadioButton.AutoSize = $true
$ESXRadioButton.Text = "ESXI"
$ESXRadioButton.Location = New-Object System.Drawing.Point(10, 70)

#Get GOLD VM button
$GetVMButton = New-Object System.Windows.Forms.Button
$GetVMButton.text = 'Get "GOLD" VM'
$GetVMButton.width = 100
$GetVMButton.height = 30
$GetVMButton.location = New-Object System.Drawing.Point(10,150)

#Selected VM label
$SelectedVMLabel = New-Object System.Windows.Forms.Label
$SelectedVMLabel.text = "Selected VM"
$SelectedVMLabel.AutoSize = $true
$SelectedVMLabel.width = 25
$SelectedVMLabel.location = New-Object System.Drawing.Point(10,100)

#selected VM TextBox
$SelectedVMtextBox = New-Object System.Windows.Forms.TextBox
$SelectedVMtextBox.ReadOnly = $true
$SelectedVMtextBox.location = New-Object System.Drawing.Point(10,120)

#Listbox for found VM's
$ListBoxVM = New-Object System.Windows.Forms.ListBox
$ListBoxVM.Width = 300
$ListBoxVM.Height = 180
$ListBoxVM.ScrollAlwaysVisible = $true
$ListBoxVM.Sorted = $true
$ListBoxVM.location = New-Object System.Drawing.Point(120,10)

#Adding content to Get-VM tab
$VMTab.Controls.AddRange(@($GetVMButton,$ListBoxVM,$SelectOSLabel,$SelectedVMLabel,$SelectedVMtextBox,$LinRadioButton,$WinRadioButton,$ESXRadioButton))


#Create debug Tab
$DebugTab = New-Object System.Windows.Forms.TabPage
$DebugTab.Text = 'Debug'

#Create Debug TextBox
$TextBoxDebug = New-Object System.Windows.Forms.TextBox
$TextBoxDebug.Width = 435
$TextBoxDebug.Height = 190
$TextBoxDebug.Multiline = $true
$TextBoxDebug.ScrollBars = "Vertical"
$TextBoxDebug.ReadOnly = $true

$DebugTab.Controls.Add($TextBoxDebug)
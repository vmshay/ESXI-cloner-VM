#Create Clone Tab
$CloneTab = New-Object System.Windows.Forms.TabPage
$CloneTab.Text = 'Clone'


$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.width                  = 200
$TextBox1.height                 = 25
$TextBox1.enabled                = $true
$TextBox1.ReadOnly               = $true
$TextBox1.location               = New-Object System.Drawing.Point(10,10)


$TakeSnapshotButton              = New-Object system.Windows.Forms.Button
$TakeSnapshotButton.text         = "Take snapshot"
$TakeSnapshotButton.width        = 200
$TakeSnapshotButton.height       = 25
$TakeSnapshotButton.location     = New-Object System.Drawing.Point(10,40)

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Number clones and recource pool"
$Label1.AutoSize                 = $false
$Label1.width                    = 200
$Label1.height                   = 25
$Label1.location                 = New-Object System.Drawing.Point(10,80)

$NumberClones                    = New-Object system.Windows.Forms.TextBox
$NumberClones.multiline          = $false
$NumberClones.width              = 50
$NumberClones.height             = 25
$NumberClones.location           = New-Object System.Drawing.Point(10,100)

$RecoursePools                      = New-Object system.Windows.Forms.ComboBox
$RecoursePools.width                 = 140
$RecoursePools.height                = 25
$RecoursePools.location              = New-Object System.Drawing.Point(70,100)

$CloneButton                     = New-Object system.Windows.Forms.Button
$CloneButton.text                = "Clone"
$CloneButton.width               = 200
$CloneButton.height              = 25
$CloneButton.location            = New-Object System.Drawing.Point(10,130)

$ProgressBar1                    = New-Object system.Windows.Forms.ProgressBar
$ProgressBar1.width              = 400
$ProgressBar1.height             = 25
$ProgressBar1.value              = 0
$ProgressBar1.location           = New-Object System.Drawing.Point(10,160)

$SnapshotList                       = New-Object System.Windows.Forms.ListView
$SnapshotList.text                  = "listView"
$SnapshotList.width                 = 180
$SnapshotList.height                = 140
$SnapshotList.location              = New-Object System.Drawing.Point(230,10)

$SnapshotList.View = "Details"

$SnapshotList.Columns.Add("Name").width = 90
$SnapshotList.Columns.Add("Description").width = 90

$CloneTab.controls.AddRange(@($TextBox1,$TakeSnapshotButton,$NumberClones,$RecoursePools,$ProgressBar1,$CloneButton,$Label1,$SnapshotList))

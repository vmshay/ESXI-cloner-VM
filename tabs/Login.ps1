#Create connect Tab
$LoginTab = New-Object System.Windows.Forms.TabPage
$LoginTab.Text = 'Connect'

#Tab content
#Server label
$LabelServer = New-Object System.Windows.Forms.Label
$LabelServer.text = "Server"
$LabelServer.AutoSize = $true
$LabelServer.width = 25
$LabelServer.location = New-Object System.Drawing.Point(20,13)

#Login label
$LabelLogin = New-Object System.Windows.Forms.Label
$LabelLogin.text = "Login"
$LabelLogin.AutoSize = $true
$LabelLogin.width = 25
$LabelLogin.location = New-Object System.Drawing.Point(20,43)

#Password label
$LabelPassword = New-Object System.Windows.Forms.Label
$LabelPassword.text = "Password"
$LabelPassword.AutoSize = $true
$LabelPassword.width = 25
$LabelPassword.location = New-Object System.Drawing.Point(20,72)

#TextBox server
$TextBoxServer = New-Object System.Windows.Forms.TextBox
$TextBoxServer.multiline = $false
$TextBoxServer.width = 200
$TextBoxServer.location = New-Object System.Drawing.Point(74,10)

#TextboxLogin
$TextboxLogin = New-Object System.Windows.Forms.TextBox
$TextboxLogin.multiline = $false
$TextboxLogin.width = 200
$TextboxLogin.location = New-Object System.Drawing.Point(74,40)

#TextboxPassword
$TextboxPassword = New-Object system.Windows.Forms.TextBox
$TextboxPassword.UseSystemPasswordChar = $true
$TextboxPassword.multiline = $false
$TextboxPassword.width = 200
$TextboxPassword.location = New-Object System.Drawing.Point(74,70)

#Sertificate checkbox
$SecureCheckbox = New-Object System.Windows.Forms.CheckBox
$SecureCheckbox.AutoSize = $true
$SecureCheckbox.Text = "Ignore SSL/TLS certificate"
$SecureCheckbox.Location = New-Object System.Drawing.Point(74, 110)

#Connect button
$ButtonConnect = New-Object System.Windows.Forms.Button
$ButtonConnect.text = "Connect"
$ButtonConnect.width = 90
$ButtonConnect.height = 30
$ButtonConnect.location = New-Object System.Drawing.Point(300,10)

#Diconnect button
$ButtonDisconnect = New-Object System.Windows.Forms.Button
$ButtonDisconnect.text = "Disconnect"
$ButtonDisconnect.Enabled = $false
$ButtonDisconnect.width = 90
$ButtonDisconnect.height = 30
$ButtonDisconnect.location = New-Object System.Drawing.Point(300,50)

#Cancel button
$ButtonCancel = New-Object System.Windows.Forms.Button
$ButtonCancel.text = "Cancel"
$ButtonCancel.width = 90
$ButtonCancel.height = 30
$ButtonCancel.location = New-Object System.Drawing.Point(300,90)

#Adding content to Login tab
$LoginTab.Controls.AddRange(@($LabelServer,$LabelLogin,$LabelPassword,
                            $TextBoxServer,$TextboxLogin,$TextboxPassword,
                            $ButtonConnect, $ButtonDisconnect,$ButtonCancel,$SecureCheckbox))
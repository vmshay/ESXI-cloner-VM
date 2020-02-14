<#Include forms#>
. $WorkDir\tabs\Debug.ps1
. $WorkDir\tabs\Login.ps1
. $WorkDir\tabs\GetVM.ps1
. $WorkDir\tabs\CheckVM.ps1
. $WorkDir\tabs\Clone.ps1
. $WorkDir\tabs\Debug.ps1

function CheckRequirements(){
	try{
	Import-module posh-ssh -erroraction Stop
	Import-module vmware.powercli -erroraction Stop
	}
	catch{
	InstallRequirements	
	}
}

function InstallRequirements(){
	Set-PSRepository -name PsGallery -InstallationPolicy Trusted
	install-module posh-ssh
	Install-PackageProvider -Name NuGet -force
	install-module vmware.powercli
	Import-module posh-ssh -erroraction Stop
	Import-module vmware.powercli -erroraction Stop
}




function Main(){

Set-PowerCLIConfiguration -DefaultVIServerMode Multiple -Confirm:$false
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

$Flag_Connected = $false
$WorkDir = pwd



$MainForm = New-Object System.Windows.Forms.Form
$MainForm.width = 450
$MainForm.height = 250
$MainForm.Text="VM Cloner"
$MainForm.FormBorderStyle="FixedDialog"
$MainForm.MaximizeBox=$false


#Adding Tab's
$TabControl = New-Object System.Windows.Forms.TabControl
$TabControl.Width=450
$TabControl.Height=250
$TabControl.Controls.AddRange(@($LoginTab,$VMTab,$CheckTab, $CloneTab,$DebugTab))

#Adding TabController to form
$MainForm.Controls.add($TabControl)

function DisconnectOnStart(){
Disconnect-VIServer -Server * -Confirm:$false -ErrorAction Continue
#cls
}
function OnConnect(){
#Disable elements
$TextBoxServer.Enabled = !$Flag_Connected
$TextboxLogin.Enabled = !$Flag_Connected
$TextboxPassword.Enabled = !$Flag_Connected
$ButtonConnect.Enabled = !$Flag_Connected
$ButtonCancel.Enabled = !$Flag_Connected
$SecureCheckbox.Enabled = !$Flag_Connected

$ButtonDisconnect.Enabled = $Flag_Connected
$VMTab.Enabled = $Flag_Connected
}
function OnDisconnect(){
$TextBoxServer.Enabled = !$Flag_Connected
$TextboxLogin.Enabled = !$Flag_Connected
$TextboxPassword.Enabled = !$Flag_Connected
$ButtonConnect.Enabled = !$Flag_Connected
$ButtonCancel.Enabled = !$Flag_Connected
$SecureCheckbox.Enabled = !$Flag_Connected

$ButtonDisconnect.Enabled = $Flag_Connected
$VMTab.Enabled = $Flag_Connected
}


#Button's functions
$ButtonConnect.Add_Click({
    try{
        $TextBoxDebug.Text += "Trying connect to " + $TextboxServer.text + " ...`r `n"
            if($SecureCheckbox.Checked){Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false}
            Connect-VIServer $TextBoxServer.text -User $TextboxLogin.text -Password $TextboxPassword.text -ErrorAction Stop
            $TextBoxDebug.Text += "Succesfuly connected to " + $TextboxServer.text
            $Flag_Connected = $true
            OnConnect;
            $pools = (Get-ResourcePool | ? {$_.name -ne "Resources"}).Name
            foreach($pool in $pools){$RecoursePools.Items.Add($pool)}
             
    }
    catch [Exception]{
    $Exception = $_.Exception
    $TextBoxDebug.Text += $Exception.message + "`r`n"
    }
})
$ButtonDisconnect.Add_Click({
    try{
        $TextBoxDebug.Text += "Disconnect" + $TextboxServer.text + " ...`r `n"
            
            Disconnect-VIServer $TextBoxServer.text -Confirm:$false -ErrorAction Stop
            $TextBoxDebug.Text += "Succesfuly disconnected to " + $TextboxServer.text
            $Flag_Connected = $false
            OnDisconnect; 
    }
    catch [Exception]{
    $Exception = $_.Exception
    $TextBoxDebug.Text += $Exception.message + "`r`n"
    }
        
})
$ButtonCancel.Add_Click({
        Disconnect-VIServer -Confirm:$false -ErrorAction Ignore
        $MainForm.Dispose()
})

$GetVMButton.Add_Click({
try{
        $ListBoxVM.Items.Clear()
        if($LinRadioButton.Checked){$vms = (Get-VM | Where-Object {$_.Name -like "*GOLD" -and $_.Guest.GuestFamily -like "*Linux*"});$CheckTab.Enabled = $false}
        if($WinRadioButton.Checked){$vms = (Get-VM | Where-Object {$_.Name -like "*GOLD" -and $_.Guest.GuestFamily -like "*Windows*"});$CheckTab.Enabled = $false}
        if($ESXRadioButton.Checked){$vms = (Get-VM | Where-Object {$_.Name -like "*GOLD" -and $_.Guest.OSFullName -like "*ESXI*"});$CheckTab.Enabled = $true}

        $vms | ForEach-Object {$tmp = $ListBoxVM.Items.Add($_.Name)
        $tmp.SubItems.Add($_.PowerState.ToString().Replace("Powered", ""))
        }
    }
    catch [Exception]{
    $Exception = $_.Exception
    $TextBoxDebug.Text += $Exception.message + "`r`n"
    }
})
$ListBoxVM.Add_click({
    if($ListBoxVM.Items.Count -ne 0){
        $SelectedVMtextBox.Text = $ListBoxVM.SelectedItems[0].Text
        $TextBox1.Text = $ListBoxVM.SelectedItems[0].Text
        $SnapshotList.Items.Clear()
        $snapshots = Get-Snapshot -VM $SelectedVMtextBox.Text
        $snapshots | ForEach-Object {$tmp = $SnapshotList.Items.Add($_.Name)
        $tmp.SubItems.Add($_.Description)      
        }


    }
})

$CheckSSHButton.Add_Click({
    try{
        $vm = Get-VM $SelectedVMtextBox.Text
        $ip = $vm.Guest.IPAddress[0]
        Connect-VIServer $ip -Credential (Get-Credential) -ErrorAction Stop
        $result = Get-VMHost $ip | Get-VMHostService | ? {$_.Key -eq "TSM-SSH"}
        Disconnect-VIServer -Server $ip -Confirm:$false
        if($result.Running){$CheckSSHResult.Text = "OK"}
        elseif(!$result.Running){$CheckSSHResult.Text = "Fail"}
    }
    catch [Exception]{
    $Exception = $_.Exception
    $TextBoxDebug.Text += $Exception.message + "`r`n"
    $CheckSSHResult.Text = "Fail"
    }
})
$CheckSecureButton.Add_Click({
    try{
        $vm = Get-VM $ListView1.SelectedItems[0].Text
        if(!$vm.ExtensionData.Config.BootOptions.EfiSecureBootEnabled){$CheckSecureResult.Text = "OK"}
        elseif($vm.ExtensionData.Config.BootOptions.EfiSecureBootEnabled){$CheckSecureResult.Text = "Fail"}
  
    }
    catch [Exception]{
        $Exception = $_.Exception
        $TextBoxDebug.Text += $Exception.message
        $CheckSecureResult.Text = "Fail"
    }
})
$CheckScriptButton.Add_Click({
    try{
            $TextBoxDebug.Text += pwd;
            $vm = Get-VM $ListView1.SelectedItems[0].Text
            $ip = $vm.Guest.IPAddress[0]
            $session = New-SSHSession -ComputerName $ip -Credential $Credential -AcceptKey:$true
            $output = Invoke-SSHCommand -SSHSession $session -Command "cat /etc/rc.local.d/local.sh"
            $output.Output > "$WorkDir\script\remote.sh"
            $LocalFile = "$WorkDir\script\local.sh"
            $RemoteFile = "$WorkDir\script\remote.sh"
            (gc $LocalFile) | ? {$_.trim() -ne "" } | set-content $RemoteFile
            (gc $RemoteFile) | ? {$_.trim() -ne "" } | set-content $RemoteFile
            if((Compare-Object -ReferenceObject (Get-Content $LocalFile) -DifferenceObject (Get-Content $RemoteFile)).count -eq 0){
                $CheckScriptResult.Text = "OK"
            }
            else{$CheckScriptResult.Text = "Fail"}
        }
    catch [Exception]{
        $Exception = $_.Exception
        $TextBoxDebug.Text += $Exception.message

    }


}) 
$FixSSHButton.Add_Click({
    try{
        $vm = Get-VM $ListView1.SelectedItems[0].Text
        $ip = $vm.Guest.IPAddress[0]
        Connect-VIServer $ip -Credential (Get-Credential) -ErrorAction Stop
        Get-VMHost $ip | Get-VMHostService | ? {$_.Key -eq "TSM-SSH"} | Start-VMHostService
        Disconnect-VIServer -Server $ip -Confirm:$false
        $CheckSSHResult.Text = "OK"
    }
    catch [Exception]{
        $Exception = $_.Exception
        $TextBoxDebug.Text += $Exception.message
        $CheckSecureResult.Text = "Fail"
    }
})
$FixSecureButton.Add_Click({
    try{
        $vm = Get-VM $ListView1.SelectedItems[0].Text
        Stop-vm -vm $vm -Confirm:$false 
        $spec = New-Object VMware.Vim.VirtualMachineConfigSpec
        $spec.Firmware = [VMware.Vim.GuestOsDescriptorFirmwareType]::bios
        $boot = New-Object VMware.Vim.VirtualMachineBootOptions
        $boot.EfiSecureBootEnabled = $false
        $spec.BootOptions = $boot
        $vm.ExtensionData.ReconfigVM($spec)
        Start-vm -VM $vm -Confirm:$false   
    }
    catch [Exception]{
        $Exception = $_.Exception
        $TextBoxDebug.Text += $Exception.message
        $CheckSecureResult.Text = "Fail"
    }
})
$FixScriptButton.Add_Click({
    try{
        $vm = Get-VM $ListView1.SelectedItems[0].Text
        $ip = $vm.Guest.IPAddress[0]
        $RemotePath = "/etc/rc.local.d/"
        
        $sessionSSH = New-SSHSession -ComputerName $ip -Credential $Credential -AcceptKey:$true
        Invoke-SSHCommand -SSHSession $sessionSSH -Command {rm /etc/rc.local.d/local.sh}
        $sessionSSH.Disconnect()
        $sessionSFTP = New-SFTPSession -ComputerName $ip -Credential $Credential
        Set-SFTPFile -SFTPSession $sessionSFTP -RemotePath $RemotePath -LocalFile $WorkDIr\script\local.sh
        $sessionSFTP.Disconnect()
    }
    catch [Exception]{
        $Exception = $_.Exception
        $TextBoxDebug.Text += $Exception.message
    }
})




DisconnectOnStart
$MainForm.ShowDialog();
}
CheckRequirements
Main

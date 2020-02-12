# ESXI-cloner-VM
Cloner ESXI servers for VSphere
## TO DO
- Authenticating to VSphere
  - [x] Connect/Disconnect to VShphere
  - [x] Ignore TLS/SSL connections
- Get vm's with parameters
  - [x] Getting VM with parameters
  - [ ] Grid view for virtual machines
-Clonу
  - [x] Implement tab for cloning VM
  - [x] Grid view for snapshot list
  - [ ] Take snapshot before clonning VM
-Check ESXI vm to requirements before cloning
- [x] Check ssh status
- [x] Check SecureBoot status
- [x] Validation script for correctly reboot
-Export
- [ ] Implement export VM parameters for connect
Other
- [x] Relocating frontend to different files

## Requirements
  - VMWare.PowerCLI module
  - Posh-SHH module
  - Administrator privileges
  - Execution policy "Bypass"
  
### Install requirements

  ```
  Install-module VMWare.PowerCLI
  Install-module Posh-SSH
  ```

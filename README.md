# ESXI-cloner-VM
Cloner ESXI servers for VSphere
## TO DO
- Authenticating to VSphere
  - [x] Connect/Disconnect to VShphere
  - [x] Ignore TLS/SSL connections
- Geting vm's with parameters
  - [x] Getting VM with parameters
  - [x] Grid view for virtual machines
  - [ ] Power on/off VM
- Cloning
  - [x] Implement tab for cloning VM
  - [x] Grid view for snapshot list 
  - [x] Enterште the number cloning VM
  - [x] Selected recource pool
  - [ ] Take snapshot before clonning VM
- Checking ESXI to requirements before cloning
  - [x] Check ssh status
  - [x] Check SecureBoot status
  - [x] Validation script for correctly reboot
- Export
  - [ ] Implement export VM connection parameters
- Other
  - [x] Relocating frontend to different files
  - [x] Check requirements before start

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

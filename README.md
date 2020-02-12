# ESXI-cloner-VM
Cloner ESXI servers for VSphere
## TO DO
- Authenticating to VSphere
  - [x] Connect/Disconnect to VShphere
  - [x] Ignore TLS/SSL connections
- Get vm's with parameters
  - [x] Getting VM with parameters
  - [ ] Grid view for virtual machines
  - [x] Relocating frontend to different files
- [ ] Implement tab for cloning VM
- [ ] Take snapshot for clonning VM
- [x] Checking ESXI host to requirements before cloning
- [x] Check ssh status
- [x] Check SecureBoot status
- [x] Valid script for correctly reboot 
- [x] Implement export VM parameters for connect

## Requirements
  - VMWare.PowerCLI module
  - Posh-SHH module
  - Administrator privileges
  - Execution policy "Bypass"

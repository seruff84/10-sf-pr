instance-id: ${name}
local-hostname: ${name}
network:
  version: 2
  ethernets:
    nics:
      match:
        name: ${if}
      dhcp4: yes
      dhcp-identifier: mac
package_upgrade: true
packages:
- open-vm-tools
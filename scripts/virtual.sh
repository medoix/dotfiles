#!/bin/bash
# Configure setting to run inside a VirtualBox Machine
if grep -q "^flags.*hypervisor" /proc/cpuinfo; then
    VBoxClient --clipboard
    VBoxClient --draganddrop
    VBoxClient --seamless
    VBoxClient --checkhostversion
    VBoxClient --vmsvga
fi
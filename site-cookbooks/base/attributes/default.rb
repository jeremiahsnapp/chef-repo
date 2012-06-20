# add console=tty0 so VMware vSphere console will display the vm's console
# reference: http://www.kernel.org/doc/Documentation/serial-console.txt
default[:grub][:grub_cmdline_linux_default] = "console=ttyS0 console=tty0"

# In a private cloud with no user-data datasource it's a good idea to disable
# cloud-init's search for a datasource.
# nocloud keeps cloud-init from wasting time looking for meta-data and user-data
#
# reference: https://help.ubuntu.com/community/UEC/Images/KVMKernelOptions 
# reference: https://help.ubuntu.com/community/CloudInit
#
# I decided to append this to all grub menu entries with a linux kernel line
# in case I boot into recovery mode and then resume normal boot
default[:grub][:grub_cmdline_linux]         = "ds='nocloud'"

# disable ssh password authentication
default[:sshd][:passwordauthentication]     = "no"

# disable UseDNS because it causes unnecessary delay when
# logging into our servers
default[:sshd][:usedns]     = "no"

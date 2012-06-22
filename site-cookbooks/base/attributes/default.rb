default[:cloud_init][:manual_cache_clean]   = "True"

# add console=tty0 so VMware vSphere console will display the vm's console
# reference: http://www.kernel.org/doc/Documentation/serial-console.txt
default[:grub][:grub_cmdline_linux_default] = "console=ttyS0 console=tty0"

default[:grub][:grub_cmdline_linux]         = ""

# disable ssh password authentication
default[:sshd][:passwordauthentication]     = "no"

# disable UseDNS because it causes unnecessary delay when
# logging into our servers
default[:sshd][:usedns]     = "no"

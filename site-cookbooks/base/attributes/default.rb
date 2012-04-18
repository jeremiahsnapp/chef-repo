# removed console=ttyS0 so i can see boot process in the vm's console
default[:grub][:grub_cmdline_linux_default] = ""

# - I decided to append this to all grub menu entries with a linux kernel line in case i boot into recovery mode and then resume normal boot
#   that way cloud-init won't waste time looking for a metadata service and i don't have to worry about hostname inconsistencies
# - nocloud-net keeps cloud-init from wasting time looking for meta-data and user-data
# - set h equal to whatever the server's fqdn is because on every reboot cloud-init will update /etc/hostname and /etc/hosts and
#   we don't want to require our webserver to always be serving that metadata just to keep the hostname consistent
# - don't include s= if you don't intend to always have the metadata service available because
#   it will cause cloud-init to waste time trying to search for EC2 metadata service
default[:grub][:grub_cmdline_linux]         = "ds='nocloud-net;h=#{node[:fqdn]}'"

# disable ssh password authentication
default[:sshd][:passwordauthentication]     = "no"

# disable UseDNS because it causes unnecessary delay when
# logging into our servers
default[:sshd][:usedns]     = "no"

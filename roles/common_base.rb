name "common_base"
description "Common Base Role"
run_list(
  "recipe[apt]",
  "recipe[git]",
  "recipe[etckeeper]",
  "recipe[timezone]",
  "recipe[byobu]",
  "recipe[openssh]",
  "recipe[postfix]",
  "recipe[postfix::aliases]",
  "recipe[unattended_upgrades]",
  "recipe[ntp]",
  "recipe[logwatch]",    # logwatch requires an MTA; make sure postfix recipe is before logwatch
  "recipe[vim]",
  "recipe[sudo]",
  "recipe[base]",
  "recipe[base::grub]",
  "recipe[base::sshd]",
  "recipe[base::iptables]",
  "recipe[example_users]"
)
override_attributes(
  :tz => "Etc/UTC",
  :byobu => { :launch_by_default => false },
  :unattended_upgrades => { :email => "network.admin@example.edu" },
  :logwatch => { :email => "network.admin@example.edu" },
  :postfix => { :aliases => { "root" => "network.admin@example.edu" } },
  :postfix => { :relayhost => "[email.example.edu]" },
  :authorization => {
    :sudo => {
      :groups => [ "sysadmin" ],
      :passwordless => true,
      :include_sudoers_d => true
    }
  }
)

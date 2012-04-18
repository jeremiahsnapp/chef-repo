name "web"
description "Web Role"
run_list(
  "role[base]",
  "recipe[web]",
  "recipe[web::php]",
  "recipe[web::iptables]"
)
override_attributes(
:apache => {
  # General settings
  :contact               => "webdeveloper@example.edu",
  :timeout               => "120",
  :keepalive             => "On",
  :keepaliverequests     => "200",
  :keepalivetimeout      => "2",

  # Prefork Attributes
  :prefork => {
    :startservers        => "8",
    :minspareservers     => "30",
    :maxspareservers     => "40",
    :serverlimit         => "40",
    :maxclients          => "40",
    :maxrequestsperchild => "1000"
  }
},
:authorization => {
  :sudo => {
    :groups => [ "sysadmin", "developers" ],
    :passwordless => true,
    :include_sudoers_d => true
  }
}
)

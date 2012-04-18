name "base"
description "Base Role"
run_list(
  "recipe[chef-client::delete_validation]",  # COOK-986 - normally this should not be run on a chef server
  "recipe[chef-client::config]",             # this will fail if /etc/chef directory doesn't exist
  "recipe[chef-client::service]",
  "role[common_base]"
)
override_attributes(
  :chef_client => { :server_url => "https://chef.example.edu" } 
) 

name "chef_server"
description "Chef Server Role"
run_list(
  "recipe[chef-server::rubygems-install]",
  "recipe[chef-server::apache-proxy]",
  "recipe[chef-server]",
  "recipe[chef-client::config]",             # this will fail if /etc/chef directory doesn't exist
  "recipe[chef-client::service]",
  "role[common_base]"
)
override_attributes(
  "chef_client" => { "server_url" => "https://chef.example.edu" }
)

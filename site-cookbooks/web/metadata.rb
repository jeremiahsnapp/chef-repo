maintainer       "Jeremiah Snapp"
maintainer_email "jeremiah.snapp@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures web"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

%w{ mysql php apache2 iptables }.each do |cb|
  depends cb
end

#
# Cookbook Name:: web
# Recipe:: php
#
# Copyright 2012, Jeremiah Snapp
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe"mysql::client"

include_recipe"php"

[ "php5-mysql", "php5-mcrypt", "php5-pspell", "php5-xcache", "php5-curl", "php5-gmp", "php5-ffmpeg", "php5-gd", "php5-imap", "php5-ldap", "php5-xsl" ].each do |pkg|
  package pkg do
    action :install
  end
end

[ "DB", "HTTP_Request", "Log", "Mail", "Mail_Mime", "Mail_mimeDecode", 
  "Message", "Net_Socket", "Net_URL", "SOAP", "XML_Feed_Parser", "XML_RPC" ].each do |pear_pkg|
  php_pear pear_pkg do
    action :install
  end
end


package "make" do
  action :install
end
package "php5-dev" do
  action :install
end
php_pear "uploadprogress" do
  action :install
  notifies :reload, "service[apache2]"
end


package "libgpgme11-dev" do
  action :install
end
php_pear "gnupg" do
  action :install
  notifies :reload, "service[apache2]"
end

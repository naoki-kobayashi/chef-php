# apacheのインストール CentOSの場合
package "httpd" do
    action :install
end
 
# apacheの起動 CentOSの場合
service "httpd" do
    action [:start, :enable]
end
 
template "/var/www/html/index.html" do
    source "index.html.erb"
    mode 0644
end
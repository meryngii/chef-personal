#
# Cookbook Name:: virtualbox-shared
# Recipe:: default
#
# written by meryngii <meryngii+git@gmail.com>
#

USER  = node.user
GROUP = node.group
HOME  = node.home
NAME  = node.virtualbox_shared.name

directory File.join(HOME, NAME) do
    owner USER
    group GROUP
    mode 0777
end


template "/etc/init.d/virtualbox-shared" do
    source "virtualbox-shared.erb"
    mode 0755
    variables({
        :device_name => NAME,
        :mount_path => File.join(HOME, NAME)
    })
end

#
#cookbook_file "virtualbox-shared" do
#    path "/etc/init.d/virtualbox-shared"
#    mode 0755
#end

service "virtualbox-shared" do
    action [:enable, :start]
    priority 95
end

## failed to execute
#mount "/home/me/Dropbox" do
#    device "Dropbox"
#    device_type :device
#    fstype "vboxsf"
#end


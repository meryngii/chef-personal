#
# Cookbook Name:: unity-custom
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "launcher" do
    command <<-EOH
        gsettings set com.canonical.Unity.Launcher favorites "['application://ubiquity.desktop', 'application://nautilus.desktop', 'application://firefox.desktop', 'application://gvim.desktop', 'application://gnome-terminal.desktop',  'unity://running-apps', 'unity://expo-icon', 'unity://devices']"
    EOH
end


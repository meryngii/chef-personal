#
# Cookbook Name:: remove-unusable-packages
# Recipe:: default
#
# written by meryngii <meryngii+git@gmail.com>
#

["unity-lens-video", "unity-scope-video-remote", "unity-lens-shopping", "unity-webapps-common",
"ubuntuone-client", "ubuntuone-client-data", "python-ubuntuone-client", "python-ubuntuone-storageprotocol", "rhythmbox-ubuntuone"].each do |name|
    apt_package name do
        action :remove
    end
end

execute "disable-scopes" do
    command <<-EOH
        gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"
        gsettings set com.canonical.Unity.Lenses remote-content-search none
    EOH
end


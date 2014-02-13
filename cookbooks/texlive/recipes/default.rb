#
# Cookbook Name:: texlive
# Recipe:: default
#
# written by meryngii <meryngii+git@gmail.com>
#

["texlive", "texlive-lang-cjk", "texlive-science"].each do |name|
    package name
end


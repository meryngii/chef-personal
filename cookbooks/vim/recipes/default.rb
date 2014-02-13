#
# Cookbook Name:: gvim
# Recipe:: default
#
# written by meryngii <meryngii+git@gmail.com>
#

USER  = node.user
GROUP = node.group
HOME  = node.home

packages = value_for_platform(
    ["ubuntu"] => {"default" => ["vim-gnome"]},
    ["centos"] => {"default" => ["vim-enhanced"]},
    "default"  => "vim"
)

packages.each do |pkg|
    package pkg
end

git File.join(HOME, 'dotfiles') do
    repository 'https://github.com/meryngii/dotfiles'
    enable_submodules true
    user USER
    group GROUP
end

linked_dirs = [".vim"]
linked_files = ['.vim', '.vimrc', '.gvimrc', '.vimshrc']

linked_dirs.each do |f|
    directory File.join(HOME, f) do
        action :delete
        recursive true
    end
end
linked_files.each do |f|
    file File.join(HOME, f) do
        action :delete
    end
end

(linked_dirs + linked_files).each do |f|
    link File.join(HOME, f) do
        owner USER
        group GROUP
        to File.join(HOME, "dotfiles", f)
    end
end


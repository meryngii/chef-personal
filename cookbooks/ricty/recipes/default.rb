#
# Cookbook Name:: ricty
# Recipe:: default
#
# written by meryngii <meryngii+git@gmail.com>
#

HOME = node.home
FONTS = File.join(HOME, ".fonts")

if not File.exist?( File.join(FONTS, "Ricty-Regular.ttf") ) then
    ["fontforge", "unzip"].each do |p|
        package p
    end

    directory "/tmp/ricty"

    remote_file "/tmp/ricty/Inconsolata.otf" do
        source "http://levien.com/type/myfonts/Inconsolata.otf"
    end

    remote_file "/tmp/ricty/migu-1p.zip" do
        source "http://sourceforge.jp/frs/redir.php?m=jaist&f=%2Fmix-mplus-ipa%2F59022%2Fmigu-1m-20130617.zip"
    end

    git "/tmp/ricty/ricty/" do
        repository "https://github.com/yascentur/Ricty"
    end

    directory FONTS

    bash "create_ricty" do
        cwd "/tmp/ricty"
        code <<-EOH
            unzip -o migu-1p.zip
            sh ricty/ricty_generator.sh Inconsolata.otf migu-1m-20130617/migu-1m-regular.ttf migu-1m-20130617/migu-1m-bold.ttf
            cp -f Ricty*.ttf #{FONTS}
        EOH
    end
end


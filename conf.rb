
def make_abs_path(n)
    return File.expand_path("../" + n, __FILE__)
end

puts make_abs_path("site-cookbooks")

cookbook_path    ["cookbooks", "site-cookbooks"].map {|n| make_abs_path(n)}
node_path        make_abs_path("nodes")
role_path        make_abs_path("roles")
environment_path make_abs_path("environments")
data_bag_path    make_abs_path("data_bags")

knife[:berkshelf_path] = "cookbooks"


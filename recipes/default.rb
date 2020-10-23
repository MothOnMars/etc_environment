template "/etc/environment" do
  source "environment.erb"
  mode 0664
  owner "root"
  group "root"
  e = node['etc_environment']
  Chef::Log.info "MCT-----"
  Chef::Log.info e
  Chef::Log.info e.class
  Chef::Log.info "MCT-----"
  variables({ :environment => node['etc_environment'] })
end if node['etc_environment']

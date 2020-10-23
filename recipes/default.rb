template "/etc/environment" do
  source "environment.erb"
  mode 0664
  owner "root"
  group "root"
  e = node['etc_environment']
  hosts = e['ANALYTICS_READER_HOSTS']
  Chef::Log.info "MCT-----"
  Chef::Log.info e
  Chef::Log.info e.class
  Chef::Log.info "hosts: #{hosts}"
  Chef::Log.info "hosts to s: #{hosts.to_s}"
  Chef::Log.info "hosts to json: #{hosts.to_json}"
  Chef::Log.info "hosts class: #{e['ANALYTICS_READER_HOSTS'].class}"
  Chef::Log.info "MCT-----"
  variables({ :environment => node['etc_environment'] })
end if node['etc_environment']

=begin
[2020-10-23T16:36:22+00:00] INFO: MCT-----
[2020-10-23T16:48:24+00:00] INFO: {"ES_PATH_CONF"=>"/etc/elasticsearch", "ANALYTICS_READER_HOSTS"=>["es68x1.snowflake.staging.infr.search.usa.gov:9200", "es68x2.snowflake.staging.infr.search.usa.gov:9200"], "ANALYTICS_READER_USER"=>"elastic", "ANALYTICS_READER_PASSWORD"=>"changeme", "BOT_DETECTION_EMAIL_FROM"=>"default_from@email.gov", "BOT_DETECTION_EMAIL_TO"=>"default_to@email.gov", "RAILS_MASTER_KEY"=>"fake key"}
[2020-10-23T16:48:24+00:00] INFO: Chef::Node::ImmutableMash
[2020-10-23T16:48:24+00:00] INFO: hosts: ["es68x1.snowflake.staging.infr.search.usa.gov:9200", "es68x2.snowflake.staging.infr.search.usa.gov:9200"]
[2020-10-23T16:48:24+00:00] INFO: hosts class: Chef::Node::ImmutableArray
[2020-10-23T16:36:22+00:00] INFO: MCT-----

[2020-10-23T16:48:19+00:00] INFO: mct in vars: ["es68x1.snowflake.staging.infr.search.usa.gov:9200", "es68x2.snowflake.staging.infr.search.usa.gov:9200"]
[2020-10-23T16:48:19+00:00] INFO: mct in vars: Chef::Node::AttrArray
=end

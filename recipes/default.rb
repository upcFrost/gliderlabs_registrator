#
# Cookbook Name:: gliderlabs_registrator
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# Pull the docker image from Docker Hub
docker_image 'gliderlabs/registrator' do
  repo node['gliderlabs_registrator']['repo']
  tag node['gliderlabs_registrator']['tag']
  action :pull
end

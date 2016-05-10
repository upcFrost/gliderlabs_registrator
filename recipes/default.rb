#
# Cookbook Name:: gliderlabs_registrator
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# Pull the docker image from Docker Hub
case node['gliderlabs_registrator']['install_method']
when 'docker'
  docker_image 'gliderlabs/registrator' do
    repo node['gliderlabs_registrator']['registrator_repo']
    tag node['gliderlabs_registrator']['registrator_tag']
    action :pull
  end
when 'source_docker'
  docker_image 'golang' do
    repo node['gliderlabs_registrator']['golang_docker_repo']
    tag node['gliderlabs_registrator']['golang_docker_tag']
    action :pull
  end
  docker_container 'registrator_compile' do
    repo node['gliderlabs_registrator']['golang_docker_repo']
    tag node['gliderlabs_registrator']['golang_docker_tag']
    volumes node['gliderlabs_registrator']['bin_path']
    working_dir node['gliderlabs_registrator']['bin_path']
    env ["GOBIN=#{node['gliderlabs_registrator']['bin_path']}"]
    command node['gliderlabs_registrator']['src_command']
    autoremove true
  end
when 'source'
  include_recipe 'golang::default'
  execute 'Compile registrator' do
    environment 'GOPATH' => '$GOPATH:/tmp', 'GOBIN' => node['gliderlabs_registrator']['bin_path']
    command node['gliderlabs_registrator']['src_command']
  end
end

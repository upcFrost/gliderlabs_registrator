#
# Cookbook Name:: gliderlabs_registrator
# Resource:: default
#
# Copyright 2016, Petr Belyaev <upcfrost@gmail.com>
#
default_action :none

# Install options
attribute :install_method, String, default: node['gliderlabs_registrator']['install_method']
attribute :registrator_repo, String, default: node['gliderlabs_registrator']['registrator_repo']
attribute :registrator_tag, String, default: node['gliderlabs_registrator']['registrator_tag']
attribute :golang_docker_repo, String, default: node['gliderlabs_registrator']['golang_docker_repo']
attribute :golang_docker_tag, String, default: node['gliderlabs_registrator']['golang_docker_tag']
attribute :bin_path, String, default: node['gliderlabs_registrator']['bin_path']
attribute :src_command, String, default: node['gliderlabs_registrator']['src_command']

# Run options
attribute :backend, String, default: node['gliderlabs_registrator']['run_opts']['backend']
attribute :backend_url, String, default: node['gliderlabs_registrator']['run_opts']['backend_url']
attribute :backend_port, String, default: node['gliderlabs_registrator']['run_opts']['backend_port']
attribute :cleanup, String, default: node['gliderlabs_registrator']['run_opts']['cleanup']
attribute :deregister, String, default: node['gliderlabs_registrator']['run_opts']['deregister']
attribute :internal, String, default: node['gliderlabs_registrator']['run_opts']['internal']
attribute :ip, String, default: node['gliderlabs_registrator']['run_opts']['ip']
attribute :resync, String, default: node['gliderlabs_registrator']['run_opts']['resync']
attribute :retry_attempts, String, default: node['gliderlabs_registrator']['run_opts']['retry-attempts']
attribute :retry_interval, String, default: node['gliderlabs_registrator']['run_opts']['retry-interval']
attribute :tags, String, default: node['gliderlabs_registrator']['run_opts']['tags']
attribute :ttl, String, default: node['gliderlabs_registrator']['run_opts']['ttl']
attribute :ttl_refresh, String, default: node['gliderlabs_registrator']['run_opts']['ttl-refresh']

# Docker-specific options
attribute :docker_bind, String, default: node['gliderlabs_registrator']['docker_bind']

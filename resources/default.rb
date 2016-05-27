#
# Cookbook Name:: gliderlabs_registrator
# Resource:: default
#
# Copyright 2016, Petr Belyaev <upcfrost@gmail.com>
#
default_action :create

# Install options
attribute :install_method, String, default: node['gliderlabs_registrator']['install_method']
attribute :registrator_repo, String, default: node['gliderlabs_registrator']['registrator_repo']
attribute :registrator_tag, String, default: node['gliderlabs_registrator']['registrator_tag']
attribute :golang_docker_repo, String, default: node['gliderlabs_registrator']['golang_docker_repo']
attribute :golang_docker_tag, String, default: node['gliderlabs_registrator']['golang_docker_tag']
attribute :bin_path, String, default: node['gliderlabs_registrator']['bin_path']
attribute :src_command, String, default: node['gliderlabs_registrator']['src_command']
attribute :conf_dir, String, default: node['gliderlabs_registrator']['conf_dir']

# Run options
attribute :docker_sock, String, default: node['gliderlabs_registrator']['docker_sock']
attribute :registrator_bin, String, default: node['gliderlabs_registrator']['registrator_bin']
attribute :start_registrator_bin, String, default: node['gliderlabs_registrator']['start_registrator_bin']
attribute :backend, String, default: node['gliderlabs_registrator']['run_opts']['backend']
attribute :cleanup, kind_of: [TrueClass, FalseClass], default: node['gliderlabs_registrator']['run_opts']['cleanup']
attribute :deregister, [String, nil], default: node['gliderlabs_registrator']['run_opts']['deregister']
attribute :internal, kind_of: [TrueClass, FalseClass], default: node['gliderlabs_registrator']['run_opts']['internal']
attribute :ip, [String, nil], default: node['gliderlabs_registrator']['run_opts']['ip']
attribute :resync, [Integer, nil], default: node['gliderlabs_registrator']['run_opts']['resync']
attribute :retry_attempts, [Integer, nil], default: node['gliderlabs_registrator']['run_opts']['retry-attempts']
attribute :retry_interval, [Integer, nil], default: node['gliderlabs_registrator']['run_opts']['retry-interval']
attribute :tags, [String, nil], default: node['gliderlabs_registrator']['run_opts']['tags']
attribute :ttl, [Integer, nil], default: node['gliderlabs_registrator']['run_opts']['ttl']
attribute :ttl_refresh, [Integer, nil], default: node['gliderlabs_registrator']['run_opts']['ttl-refresh']
attribute :run_user, String, default: node['gliderlabs_registrator']['run_opts']['run_user']

# Docker-specific options
attribute :docker_bind, String, default: node['gliderlabs_registrator']['docker_bind']

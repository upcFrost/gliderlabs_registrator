#
# Cookbook Name:: gliderlabs_registrator
# Attributes:: default
#
# Copyright 2016, Petr Belyaev <upcfrost@gmail.com>
#

# Install options
default['gliderlabs_registrator']['install_method'] = 'source_docker'
default['gliderlabs_registrator']['registrator_repo'] = 'gliderlabs/registrator'
default['gliderlabs_registrator']['registrator_tag'] = 'latest'
default['gliderlabs_registrator']['golang_docker_repo'] = 'golang'
default['gliderlabs_registrator']['golang_docker_tag'] = 'latest'
default['gliderlabs_registrator']['bin_path'] = '/usr/local/bin'
default['gliderlabs_registrator']['src_command'] = 'go get github.com/gliderlabs/registrator'

# Run options
default['gliderlabs_registrator']['run_opts']['backend'] = nil
default['gliderlabs_registrator']['run_opts']['backend_url'] = nil
default['gliderlabs_registrator']['run_opts']['backend_port'] = nil
default['gliderlabs_registrator']['run_opts']['cleanup'] = nil
default['gliderlabs_registrator']['run_opts']['deregister'] = 'always'
default['gliderlabs_registrator']['run_opts']['internal'] = nil
default['gliderlabs_registrator']['run_opts']['ip'] = nil
default['gliderlabs_registrator']['run_opts']['resync'] = nil
default['gliderlabs_registrator']['run_opts']['retry-attempts'] = nil
default['gliderlabs_registrator']['run_opts']['retry-interval'] = 2000
default['gliderlabs_registrator']['run_opts']['tags'] = nil
default['gliderlabs_registrator']['run_opts']['ttl'] = nil
default['gliderlabs_registrator']['run_opts']['ttl-refresh'] = nil

# Docker-specific options
default['gliderlabs_registrator']['docker_bind'] = '/var/run/docker.sock:/tmp/docker.sock'


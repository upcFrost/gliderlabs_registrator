#
# Cookbook Name:: gliderlabs_registrator
# Attributes:: default
#
# Copyright 2016, Petr Belyaev <upcfrost@gmail.com>
#

default['gliderlabs_registrator']['repo'] = 'gliderlabs/registrator'
default['gliderlabs_registrator']['tag'] = 'latest'
default['gliderlabs_registrator']['backend'] = nil
default['gliderlabs_registrator']['backend_url'] = nil
default['gliderlabs_registrator']['backend_port'] = nil
default['gliderlabs_registrator']['docker_bind'] = '/var/run/docker.sock:/tmp/docker.sock'
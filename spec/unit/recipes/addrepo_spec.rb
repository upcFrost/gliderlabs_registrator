#
# Cookbook Name:: gliderlabs_registrator
# Spec:: addrepo
#
# Copyright (c) 2016 Petr Belyaev <upcfrost@gmail.com>

require 'spec_helper'

describe 'gliderlabs_registrator::addrepo' do
  context 'When running for CentOS' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '7.2.1511')
      runner.converge(described_recipe)
    end

    it 'Adds yum repo with the correct URL' do
      expect(chef_run).to create_yum_repository('ha-framework').with(
        baseurl: 'http://download.opensuse.org/repositories/home:/upcFrost:/ha-framework/CentOS_7/'
      )
    end
  end

  context 'When running for Ubuntu' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'Adds apt repo with the correct URL' do
      expect(chef_run).to add_apt_repository('ha-framework').with(
        uri: 'http://download.opensuse.org/repositories/home:/upcFrost:/ha-framework/xUbuntu_14.04/'
      )
    end
  end
end

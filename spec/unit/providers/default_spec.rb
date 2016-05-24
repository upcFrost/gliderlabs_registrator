require 'spec_helper'

describe 'test::default_provider' do
  context 'Given default parameters' do
    let :chef_run do
      ChefSpec::ServerRunner.new(step_into: 'gliderlabs_registrator').converge(described_recipe)
    end

    it 'should create systemd service template' do
      expect(chef_run).to create_template('/lib/systemd/system/registrator.service')
    end

    it 'should enable the new service' do
      expect(chef_run).to enable_service('registrator')
    end

    it 'should create the config dir' do
      expect(chef_run).to create_directory('/etc/registrator')
    end

    it 'should write the default config file' do
      expect(chef_run).to create_template('/etc/registrator/registrator.conf')
    end
  end
end

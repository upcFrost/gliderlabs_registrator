require 'spec_helper'

describe 'test::default_provider' do
  context 'Given default parameters' do
    let :chef_run do
      ChefSpec::ServerRunner.new(step_into: 'gliderlabs_registrator').converge(described_recipe)
    end

    it 'should create systemd service template' do
      expect(chef_run).to create_template('/lib/systemd/system/registrator.service')
        .with(source: 'registrator.service.erb')
    end

    it 'should enable the new service' do
      expect(chef_run).to enable_service('registrator')
    end

    it 'should create the config dir' do
      expect(chef_run).to create_directory('/etc/registrator')
        .with(mode: '0755')
        .with(owner: 'root')
    end

    it 'should write the default config file' do
      expect(chef_run).to create_template('/etc/registrator/registrator.conf')
        .with(source: 'registrator.conf.erb')
    end

    it 'should have a pre-made command to reload the systemd daemon list' do
      expect(chef_run).to_not run_execute('systemctl daemon-reload')
        .with(command: '/bin/systemctl daemon-reload')
    end

    it 'should write the start script' do
      expect(chef_run).to create_template('/usr/local/bin/start_registrator.sh')
    end
  end
end

require 'spec_helper'

describe 'gliderlabs_registrator::default' do
  context 'Using the docker install method' do
    let :chef_run do
      ChefSpec::ServerRunner.new do |node|
        node.set['gliderlabs_registrator']['install_method'] = 'docker'
      end.converge(described_recipe)
    end

    it 'should create and start docker service' do
      expect(chef_run).to create_docker_service('default')
      expect(chef_run).to start_docker_service('default')
    end

    it 'should pull the registrator image from the specified repo' do
      expect(chef_run).to pull_docker_image('gliderlabs/registrator')
    end
  end

  context 'Using the source_docker install method' do
    let :chef_run do
      ChefSpec::ServerRunner.new do |node|
        node.set['gliderlabs_registrator']['install_method'] = 'source_docker'
      end.converge(described_recipe)
    end

    it 'should create and start docker service' do
      expect(chef_run).to create_docker_service('default')
      expect(chef_run).to start_docker_service('default')
    end

    it 'should pull the golang image from the docker hub' do
      expect(chef_run).to pull_docker_image('golang')
    end

    it 'should compile the registrator within the golang container' do
      expect(chef_run).to run_docker_container('registrator_compile')
        .with(command: chef_run.node['gliderlabs_registrator']['src_command'])
        .with(detach: false)
        .with(autoremove: true)
        .with(timeout: 3600)
    end
  end

  context 'Using the source install method' do
    let :chef_run do
      ChefSpec::ServerRunner.new do |node|
        node.set['gliderlabs_registrator']['install_method'] = 'source'
      end.converge(described_recipe)
    end

    before do
      stub_command('/usr/local/go/bin/go version | grep "go1.5 "').and_return(true)
    end

    it 'should include golang recipe to ensure it is installed' do
      expect(chef_run).to include_recipe('golang')
    end

    it 'should execute registrator compilation' do
      expect(chef_run).to run_execute('Compile registrator')
        .with(command: chef_run.node['gliderlabs_registrator']['src_command'])
    end
  end
end

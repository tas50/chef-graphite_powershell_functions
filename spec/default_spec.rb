require 'spec_helper'

describe 'graphite_powershell_functions::default' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'windows', version: '2012R2') do |node|
      node.set['graphite_powershell_functions']['CarbonServer'] = 'graphite.therealtimsmith.com'
      node.set['graphite_powershell_functions']['CarbonServerPort'] = 2003
      node.set['graphite_powershell_functions']['MetricPath'] = 'servers.prod.'
    end.converge(described_recipe)
  end
  subject { chef_run }
  before do
    stub_command('C:\\windows\\system32\\WindowsPowerShell\\v1.0\\powershell.exe -NoLogo -NonInteractive -NoProfile -ExecutionPolicy RemoteSigned Get-Service -Name GraphitePowerShell').and_return(true)
  end

  it 'should create install dir' do
    expect(chef_run).to create_directory 'C:\GraphitePowershellFunctions\nssm'
  end

  it 'should template the config file' do
    expect(chef_run).to render_file('C:\GraphitePowershellFunctions\StatsToGraphiteConfig.xml')
  end

  it 'should create powershell script file' do
    expect(chef_run).to create_cookbook_file 'C:\GraphitePowershellFunctions\Graphite-Powershell.ps1'
  end

  it 'enables the service' do
    expect(chef_run).to enable_service('GraphitePowerShell')
    expect(chef_run).to start_service('GraphitePowerShell')
  end
end

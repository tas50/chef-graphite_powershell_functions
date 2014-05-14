require 'spec_helper'

describe 'graphite_powershell_functions::default' do
  let(:chef_run) do
    runner = ChefSpec::Runner.new(platform: 'Windows', version: '2008R2') do |node|
      node.set['collectd']['graphite']['host'] = 'graphite.therealtimsmith.com'
      node.set['collectd']['graphite']['port'] = 2003
      node.set['collectd']['graphite']['prefix'] = 'servers.prod.'
    end.converge(described_recipe)
  end
  subject { chef_run }

  it 'should create install dir' do
    expect(chef_run).to create_directory 'C:\GraphitePowershellFunctions\nssm'
  end

  it 'should template the config file' do
    expect(chef_run).to render_file('C:\GraphitePowershellFunctions\StatsToGraphiteConfig.xml')
  end
end

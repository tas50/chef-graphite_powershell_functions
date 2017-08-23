#
# Cookbook Name:: graphite_powershell_functions
# Recipe:: default
#
# Copyright 2014, Limelight Networks, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

nssm_install_dir = node['graphite_powershell_functions']['nssm_archive'].split('/')[-1].gsub('.zip', '')

# create install dir and nssm dir
directory node['graphite_powershell_functions']['install_dir'] + '\nssm' do
  recursive true
  action :create
end

# drop the actual script in place
cookbook_file node['graphite_powershell_functions']['install_dir'] + '\Graphite-Powershell.ps1' do
  notifies :restart, 'service[GraphitePowerShell]'
end

# create the high level attribute to house our various node attributes
template node['graphite_powershell_functions']['install_dir'] + '\StatsToGraphiteConfig.xml' do
  source 'StatsToGraphiteConfig.xml.erb'
  notifies :restart, 'service[GraphitePowerShell]'
end

# download the Non-Sucking Service Manager zip file
remote_file File.join(Chef::Config[:file_cache_path], 'nssm.zip') do
  source node['graphite_powershell_functions']['nssm_archive']
  checksum node['graphite_powershell_functions']['nssm_archive_checksum']
end

# unzip the file into the install dir
windows_zipfile node['graphite_powershell_functions']['install_dir'] + '\nssm' do
  source File.join(Chef::Config[:file_cache_path], 'nssm.zip')
  action :unzip
  not_if { File.exist?(File.join(node['graphite_powershell_functions']['install_dir'] + '\nssm', nssm_install_dir)) }
end

link File.join(node['graphite_powershell_functions']['install_dir'] + '\nssm', 'current') do
  to File.join(node['graphite_powershell_functions']['install_dir'] + '\nssm', nssm_install_dir)
end

powershell_script 'Install GraphitePowerShell Service' do
  code <<-EOH
    Start-Process -FilePath #{node['graphite_powershell_functions']['install_dir']}\\nssm\\current\\win64\\nssm.exe -ArgumentList 'install #{node['graphite_powershell_functions']['service_name']} "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe" "-command "& { . #{node['graphite_powershell_functions']['install_dir']}\\#{node['graphite_powershell_functions']['main_script']}; #{node['graphite_powershell_functions']['main_method']} }"" ' -NoNewWindow -Wait;
    Start-Process -FilePath #{node['graphite_powershell_functions']['install_dir']}\\nssm\\current\\win64\\nssm.exe -ArgumentList 'set #{node['graphite_powershell_functions']['service_name']} Description "#{node['graphite_powershell_functions']['service_description']}"'
  EOH
  action :run
  not_if 'C:\\windows\\system32\\WindowsPowerShell\\v1.0\\powershell.exe -NoLogo -NonInteractive -NoProfile -ExecutionPolicy RemoteSigned Get-Service -Name GraphitePowerShell'
end

service 'GraphitePowerShell' do
  supports status: true, restart: true
  action [:enable, :start]
end

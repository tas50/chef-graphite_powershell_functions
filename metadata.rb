name             'graphite_powershell_functions'
maintainer       'Tim Smith'
maintainer_email 'tsmith84@gmail.com'
license          'Apache-2.0'
description      'Configures the Graphite PowerShell Functions script to send Windows perf counters to Graphite'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.2.1'
supports         'windows'
depends          'windows'
source_url 'https://github.com/tas50/chef-graphite_powershell_functions'
issues_url 'https://github.com/tas50/chef-graphite_powershell_functions/issues'

chef_version '>= 12.1' if respond_to?(:chef_version)

# graphite_powershell_functions Cookbook

[![Build Status](https://travis-ci.org/tas50/chef-graphite_powershell_functions.svg?branch=master)](https://travis-ci.org/tas50/chef-graphite_powershell_functions) [![Cookbook Version](https://img.shields.io/cookbook/v/tomcat.svg)](https://supermarket.chef.io/cookbooks/graphite_powershell_functions)

A cookbook to install the Graphite PowerShell Function (<https://github.com/MattHodge/Graphite-PowerShell-Functions>) script using Chef. Sets up the script as a Windows service using the Non-Sucky Service Manager (<http://nssm.cc/>) as outlined in Matt Hodge's documentation for Graphite PowerShell Functions.

## Requirements

### Chef

- Chef 12.1+

### Platforms

- Windows

### Cookbooks

- Windows

## Attributes

- `default['graphite_powershell_functions']['CarbonServer']` FQDN of the carbon host. **Required**
- `default['graphite_powershell_functions']['CarbonServerPort']` port of the carbon host (default: `2003`).
- `default['graphite_powershell_functions']['MetricPath']` Path to prefix on the collected metrics (default: `powershell.`).
- `default['graphite_powershell_functions']['MetricSendIntervalSeconds']` Interval to grab metrics (default: 30).
- `default['graphite_powershell_functions']['TimeZoneOfGraphiteServer']` Timezone of the Graphite server (default `UTC`).
- `default['graphite_powershell_functions']['PerformanceCounters']` Array of performance counters to collect
- `default['graphite_powershell_functions']['MetricFilter']` Array of Metrics to filter
- `default['graphite_powershell_functions']['nssm_archive']` URL of the Non-Sucky Service Manager zip archive
- `default['graphite_powershell_functions']['nssm_archive_checksum']` shasum for the zip archive
- `default['graphite_powershell_functions']['install_dir']` directory to install to
- `default['graphite_powershell_functions']['service_name']` name of the service
- `default['graphite_powershell_functions']['service_description'] description of the service

## License & Authors

- Author: Tim Smith ([tsmith@chef.io](mailto:tsmith@chef.io))

```text
Copyright:: 2014-2016, Limelight Networks, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

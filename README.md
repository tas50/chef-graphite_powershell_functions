graphite_powershell_functions Cookbook
======================================
A cookbook to install the Graphite PowerShell Function (https://github.com/MattHodge/Graphite-PowerShell-Functions) script using Chef.  Sets up the script as a Windows service using the Non-Sucky Service Manager (http://nssm.cc/) as outlined in Matt Hodge's documentation for Graphite Powershell Functions.


Requirements
============
* Windows


Attributes
==========

* `default['graphite_powershell_functions']['CarbonServer']` FQDN of the carbon host.  Defaults to the node attribute used by the collectd cookbook
* `default['graphite_powershell_functions']['CarbonServerPort']` port of the carbon host.  Defaults to the node attribute used by the collectd cookbook
* `default['graphite_powershell_functions']['MetricPath']` Path to prefix on the collected metrics.  Defaults to the node attribute used by the collectd cookbook
* `default['graphite_powershell_functions']['MetricSendIntervalSeconds']` Interval to grab metrics.  Default to 15
* `default['graphite_powershell_functions']['TimeZoneOfGraphiteServer']` Timezone of the Graphite server.  Defaults to UTC
* `default['graphite_powershell_functions']['PerformanceCounters']` Array of performance counters to collect
* `default['graphite_powershell_functions']['MetricFilter']` Array of Metrics to filter
* `default['graphite_powershell_functions']['nssm_archive']` URL of the Non-Sucky Service Manager zip archive
* `default['graphite_powershell_functions']['nssm_archive_checksum']` shasum for the zip archive

License and Author
------------------

Author:: Tim Smith (<tsmith@limelight.com>)

Copyright:: 2014, Limelight Networks, Inc.

License:: Apache 2.0
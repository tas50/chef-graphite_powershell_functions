# chef-graphite_powershell_functions Cookbook CHANGELOG

This file is used to list changes made in each version of the graphite_powershell_functions cookbook.

## v1.2.0

- Add travis.yml for testing
- Add chefignore to limit files uploaded to the chef server
- Use standard chef .gitignore file
- Remove use of hash rockets in rubocop.yml
- Use supermarket URL in berksfile
- Add a changelog
- Add a contributing doc
- Breakout deps into groups in the Gemfile and update to the latest versions
- Dont use collectd attributes directly in the attributes since this break anyone not using collectd
- Change MetricSendIntervalSeconds to 30 seconds from 15 seconds
- Update the Graphite Powershell script
- Restart the service when the config is updated
- Add more chefspec tests

## v1.1.0

- Update to the latest upstream release of the Powershell script
- Add the bulk Graphite metric update code currently awaiting merging into the upstream Powershell script
- Reorder sanitization method in the Powershell so the hostname is not sanitized. The hostname attribute being used must be properly sanitized before being set in the config file. The default attribute implements this with a gsub of . to _
- Switch the default update time period from every 15 seconds to every 30 seconds
- Add additional tests and update the test harness
- Fix an incorrect license in the default recipe file
- Restart the service when the config file or Powershell script is updated

## v1.0.0

- Initial release

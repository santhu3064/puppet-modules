class ntp::params{
	 $package_name   = 'ntp'
	 $package_ensure = 'present'
	 $service_enable     = true
	 $service_ensure      = 'running'
	 $service_hasstatus  = true
	 $service_hasrestart = true
	 $ntp_config_name = 'ntp.conf'
	 $ntp_config_mode = '0644'
	 $servers  = ['puppet-ubuntu-client.local', 	'puppet-centos-client.local']

	$service_name = $facts['os']['family'] ? {
		'Debian' => 'ntp',
		default => 'ntpd',
	}
}
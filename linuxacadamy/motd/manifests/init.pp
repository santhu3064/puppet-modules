class motd{
	$hostname = $facts['networking']['fqdn']
	$os_name  = $facts['os']['name']
	$os_release = $facts['os']['release']

	if $hostname == 'puppet-server.local' {
	   file { '/etc/motd':
		ensure	=> file,
		content	=> "\n\n[Puppet Master] ${hostname} ${os_name} ${os_release}\n\n",
                }
	}	
	elsif $facts['networking']['fqdn'] == 'puppet-lamp-ubuntu-client.local' {
	  file { '/etc/motd':
                ensure  => file,
                content => "\n\n[Puppet Node] ${hostname} ${os_name} ${os_release}\n\n",
                }

	}	
}

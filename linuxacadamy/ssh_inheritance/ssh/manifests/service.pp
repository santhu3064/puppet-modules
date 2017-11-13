class ssh::service(
	$service_name = $::ssh::service_name 
	) {
	service { 'sshd':
		ensure => running,
		name => $service_name,
		enable => true,
		hasstatus => true,
		hasrestart => true,
	}
}
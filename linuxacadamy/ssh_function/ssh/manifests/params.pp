class ssh::params{
	#case $facts['os']['family'] {

	#	'Debian':
	#	{
	#		$package_name  = 'openssh-server'
	#		$service_name = 'ssh'
	#	}

	#	'RedHat':
	#	{
	#		$package_name  = 'openssh-server'
	#		$service_name = 'ssh'	
	#	}
	#	default:
	#	{
	#		fail ('This is not an suppoerted operating system' )
	#	}
	#}
	$permit_root_login = false
     $port		   = 22
	case $facts['operatingsystem'] {

		'Debian', 'Ubuntu': {
			$package_name = 'openssh-server'
			$service_name = 'ssh'
		}
		/^RedHat|Centos/: {
			$package_name = 'openssh-server'
			$service_name = 'sshd'
			notify{ "${0} is our operating system":  }
		}
		default: {
			fail("${facts['operatingsystem']} is not supported")
		}
	}
}

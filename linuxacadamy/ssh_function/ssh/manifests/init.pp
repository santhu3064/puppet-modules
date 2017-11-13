class ssh (
	String $package_name,
	String $service_name,
	String $service_ensure,
	String $ensure,
	Boolean $service_enable,
	Boolean $permit_root_login = false,
	Integer $port              = 22,
) {
	class { '::ssh::install': } 
	class { '::ssh::config': }
	class { '::ssh::service': }

	Class['::ssh::install']
	-> Class['::ssh::config']
	~> Class['::ssh::service']
	-> Class['ssh']

}

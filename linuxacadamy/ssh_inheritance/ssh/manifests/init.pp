class ssh (
	Boolean $permit_root_login = $::ssh::params::permit_root_login,
	Integer $port 		   = $::ssh::params::port,
	String $package_name       = $::ssh::params::package_name,
	String $service_name       = $::ssh::params::service_name,
)inherits ::ssh::params{
	class { '::ssh::install': } 
	class { '::ssh::config': }
	class { '::ssh::service': }

	Class['::ssh::install']
	-> Class['::ssh::config']
	~> Class['::ssh::service']
	-> Class['ssh']

}

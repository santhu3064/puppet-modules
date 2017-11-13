class ssh::install (
	$package_name = $::ssh::package_name) {

	package { 'sshpackage':
		name => $package_name,
		ensure => present,
	}
}
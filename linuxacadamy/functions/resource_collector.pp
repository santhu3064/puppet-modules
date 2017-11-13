group { 'admin1':
ensure => present,
}

user { 'admin1':
	ensure => present,
	home => '/home/admin1',
	managehome => true,
	gid => 'admin1',
	shell => '/bin/bash',
}

group { 'admin':
ensure => present,
}

user { 'admin':
	ensure => present,
	home => '/home/admin',
	managehome => true,
	gid => 'admin',
	shell => '/bin/bash',
}
file { '/home/admin1/test1.txt':
	ensure => file,
	mode => '0600',
	owner => 'root',
	group => 'admin1',
	content => 'this is a test',
	}

file { '/home/admin1/test2.txt':
	ensure => file,
	mode => '0600',
	owner => 'admin',
	group => 'admin1',
	content => 'this is a test1',
	}


file { '/tmp/test3.txt':
	ensure => file,
	mode => '0755',
	owner => 'root',
	group => 'root',
	content => 'this is a test',
	}



	File <| group == 'admin1' |> {
		owner => 'admin1'
	}
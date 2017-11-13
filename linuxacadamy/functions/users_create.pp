$users = {
	'dream' => {
		home => '/home/dream',
	},

	'suprava' => {
		home => '/home/suprava',
	},
	'santhosh' => {
		home => '/home/santhosh',
	},
	'love' => {
		home => '/home/love',
	},
	'life' => {
		home => '/home/life',
	}
}


$defaults = {
	ensure => present,
	managehome => true,
	gid => 'admin',
	shell => '/bin/bash',
}

create_resources(user, $users, $defaults)
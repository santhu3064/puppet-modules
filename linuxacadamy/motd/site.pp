node puppet-server{
	include motd
# ensure santhosh has username passwords for all
	user { 'santhosh_user':
		name  		=> 'santhosh',
		groups		=> 'wheel',
		managehome	=> true,
		password 	=> '$1$UGz1Jiuu$Pdm4hzdm/y/pt0w2PWvq5/',
		ensure 		=> present
	}

}

node 'puppet-lamp-ubuntu-client.local' {
        include motd
# ensure santhosh has username passwords for all

}


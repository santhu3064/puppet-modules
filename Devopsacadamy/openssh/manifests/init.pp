class openssh {
$ssh_portnumber				=	22
$ssh_Protocolid				= 	2
$ssh_host_rsa_key			=	'/etc/ssh/ssh_host_rsa_key' 
$ssh_dsa_key 				=	'/etc/ssh/ssh_host_dsa_key'
$ssh_ecdsa_key 				=	'/etc/ssh/ssh_host_ecdsa_key'
$ssh_host_key 				=	'/etc/ssh/ssh_host_ed25519_key'
$ssh_UsePrivilegeSeparation 		=	yes
$ssh_KeyRegenerationInterval		=	3600
$ssh_ServerKeyBits			=	1024
$ssh_SyslogFacility			=	'AUTH'
$ssh_LogLevel				= 	'INFO'
$ssh_LoginGraceTime			=	120
$ssh_PermitRootLogin			=	yes
$ssh_RSAAuthentication			=	yes
$ssh_IgnoreRhosts			=	yes
$ssh_HostbasedAuthentication		=	no
$ssh_PermitEmptyPasswords		=	no
$ssh_ChallengeResponseAuthentication	=	no
$ssh_PasswordAuthentication		=	yes
$ssh_X11Forwarding			=	yes
$ssh_X11DisplayOffset			=	10
$ssh_PrintMotd				=	no
$ssh_PrintLastLog			=	yes
$ssh_TCPKeepAlive			=	yes
$ssh_UsePAM				= 	yes

	exec {'apt-update':
		command	=> '/usr/bin/apt-get update -y'
	}

	package {'openssh-server':
		require => Exec['apt-update'],
		ensure => installed,
	}
	service {'sshd':
		ensure => running,
		}

	file {'/etc/ssh/sshd_config':
		ensure	=> file,
		content => template('openssh/sshd_config.erb'),
		require => Package['openssh-server'],
	}	
}

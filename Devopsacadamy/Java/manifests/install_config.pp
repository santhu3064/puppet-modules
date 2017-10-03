define	java::install_config($java_default_version,$java_version=$title,) {
	'Debian' : {
		$javapkg	= "open-${java_version}-jdk"
		$javadir 	= "/usr/lib/jvm/java-${java_version}-openjdk-${::architecture}/jre/bin/java"
		if $::operatingsystemrelease in ['12.04', '14.04'] and $java_version == '8'	{
			apt:ppa {'ppa:open-jdk-r/ppa'}
		}
	}
	'RedHat' : {
		$javapkg	= "java-1.${java_version}.0-openjdk"
		$javadir 	= "/usr/lib/jvm/jre-1.${java_version}.0-openjdk-${::architecture}/jre/bin/java"
	}
	default 
		fail("The ${module_name} module is not supported on ${::operatingsystem} distribution")
	}

package { $javapkg:
	ensure => installed,
	} 
if ${java_default_version} != undef and $java_version == $java_default_version {
	exec { 'set_java':
		command	=> "/usr/bin/update-alternatives --set java ${javadir}",
		unless => " ls -l /etc/aletrnatives/java | grep ${javadir}"
		
	}
}


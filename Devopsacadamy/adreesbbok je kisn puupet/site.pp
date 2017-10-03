node 'puppet-lamp-ubuntu-client.local' {
       class {'java':
                package => 'openjdk-8-jdk'
        }
	tomcat::install {'/opt/tomcat':
		source_url => 'http://www-eu.apache.org/dist/tomcat/tomcat-8/v8.0.46/bin/apache-tomcat-8.0.46.tar.gz'	
	}
	tomcat::instance {'default':
		catalina_home	=> '/opt/tomcat'
	}
	tomcat::war{'addressbook.war':
		catalina_base	=> '/opt/tomcat',
		war_source	=> 'puppet:///modules/tomcat/addressbook.war'}
}

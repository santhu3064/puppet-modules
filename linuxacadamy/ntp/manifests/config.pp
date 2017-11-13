class ntp::config(
	String $ntp_config_name = $ntp::ntp_config_name,
	String $ntp_config_mode = $ntp::ntp_config_mode,
	Array[String] $servers  = $ntp::servers){

	file {"/etc/{$config_name}":
		ensure  => file,
		owner   => 0,
		group   => 0,
		mode    => $ntp_config_mode,
		content => template("$module_name/ntp.conf.erb")

}
}
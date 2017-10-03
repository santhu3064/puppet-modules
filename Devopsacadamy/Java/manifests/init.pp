define java (
	$java_version	= $title,
	java::install_config { $java_version:
		java_default_version  = $java_default_version,

	}
	)
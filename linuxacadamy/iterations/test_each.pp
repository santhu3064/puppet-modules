$facts['os'].each |$values| {
	notify { $values[0]:
		message => " the values are : $values[1]",
	}
}
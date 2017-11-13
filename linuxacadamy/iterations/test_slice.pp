notice $facts['os']

$facts['os'].slice(2) |$values| {
	notice "Value: ${values}"
}
$hash = {a => 1, b => 2, c => 3}
$results =  $hash.reduce |$memo, $value| {
	notice "String: memo : ${memo[0]}  value : ${value[0]}"
	$string = "${memo[0]}${value[0]}"

	notice "Number: memo : ${memo[1]}  value : ${value[1]}"
	$num = $memo[1] + $value[1]

	[$string, $num]

}
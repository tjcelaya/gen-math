<?php 

$PARENS_FIRST = '(x{op}y){op}z';
$PARENS_SECOND = 'x{op}(y{op}z)';
$OPS = explode(' ', '+ - *');
$ns = explode(' ', '0 1 2 3 4 5 6 7 8 9 10');

$string = ( mt_rand(0, 1) == 0 ? $PARENS_FIRST : $PARENS_SECOND );

$string = preg_replace('/(.+)(\{op\})(.+)(\{op\})(.+)/',
	'$1' . $OPS[array_rand($OPS)] . '$3' . $OPS[array_rand($OPS)] . '$5', 
	$string);

$string = str_replace(
	'x',
	$ns[array_rand($ns)],
	str_replace(
		'y',
		$ns[array_rand($ns)],
		str_replace(
			'z',
			$ns[array_rand($ns)],
			$string)
		)
	);


echo $string;

?>

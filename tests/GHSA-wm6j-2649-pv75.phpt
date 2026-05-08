--TEST--
GHSA-wm6j-2649-pv75
--EXTENSIONS--
mbstring
--SKIPIF--
<?php
if (!function_exists('mb_regex_encoding')) die('skip mb_regex_encoding() not available');
?>
--FILE--
<?php
try {
	mb_regex_encoding('iso-8859-11');
} catch (ValueError $v) {
	var_dump($v->getMessage());
}
?>
--EXPECTF--
string(%d) "mb_regex_encoding(): Argument #1 ($encoding) must be a valid encoding, "iso-8859-11" given"

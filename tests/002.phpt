--TEST--
test1() Basic test
--EXTENSIONS--
mb_onig
--FILE--
<?php
$ret = test1();

var_dump($ret);
?>
--EXPECT--
The extension mb_onig is loaded and working!
NULL

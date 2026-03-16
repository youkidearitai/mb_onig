--TEST--
Check if mb_onig is loaded
--EXTENSIONS--
mb_onig
--FILE--
<?php
echo 'The extension "mb_onig" is available';
?>
--EXPECT--
The extension "mb_onig" is available

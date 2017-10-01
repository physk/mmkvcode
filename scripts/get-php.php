<?php

$forumurl = "https://www.makemkv.com/forum2/viewtopic.php?f=5&t=1053";

$html = file_get_contents($forumurl);
//echo $html;
preg_match("'<div class=\"codecontent\">(.*?)</div>'si", $html, $matches);

if(is_array($matches))
{
	$fp = fopen("tmpcode", "w");
	fwrite($fp, $matches[1]);
	fclose($fp);
}
?>

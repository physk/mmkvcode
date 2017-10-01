<?php

//Enter Forum Post URL here
$forumurl = "https://www.makemkv.com/forum2/viewtopic.php?f=5&t=1053";

//Grabs the HTML Content from the server
$html = file_get_contents($forumurl);

//Finds the new app code
preg_match("'<div class=\"codecontent\">(.*?)</div>'si", $html, $matches);

//If app code exists write to tmpcode
if(is_array($matches))
{
	$fp = fopen("/tmp/tmpcode", "w");
	fwrite($fp, $matches[1]);
	fclose($fp);
}
?>

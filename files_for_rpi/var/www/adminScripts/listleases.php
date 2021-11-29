<?php
echo "Wireless client list:";
$output = shell_exec('bash listleases.sh');
echo "<pre>$output</pre>";
?>

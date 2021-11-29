<?php
echo "Access log:";
$output = shell_exec('cat /var/log/nginx/access.log');
echo "<pre>$output</pre>";
?>
<?php
echo "<p><font size = '32pt'>Password Hint:</font></p>";
$output = shell_exec('cat /var/www/pwhint/pwhint.txt');
echo "<p><font size = '32pt'><pre>$output</pre></font></p>";
?>

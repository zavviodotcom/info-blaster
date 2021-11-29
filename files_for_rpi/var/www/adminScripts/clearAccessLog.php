<?php
exec("cat /dev/null > /var/log/nginx/access.log");
echo "<p><font = '+2'>Access log has been cleared</font></p>";
?>
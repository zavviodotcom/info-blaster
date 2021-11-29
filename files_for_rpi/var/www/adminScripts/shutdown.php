<?php
  echo "<p><font = '+2'>Wait until shutdown is complete before removing power</font></p>";
  $cmd = "sudo shutdown -h 0"; 
  system($cmd);
?>

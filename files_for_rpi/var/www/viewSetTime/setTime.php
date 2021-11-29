<?php
  $date_time = $_POST['dt'];
  $div = stripos($date_time, "T");
  $date = substr($date_time, 0, $div);
  $time = substr($date_time, $div+1);
  $cmd = "sudo date -s \"" . $date . " " . $time . ":00\""; 
  system($cmd);
//  $today = date("d M Y h:i:i A");
//  echo "current date/time: ", $today
?>

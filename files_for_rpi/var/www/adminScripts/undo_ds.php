<?php
  if (file_exists("/var/ds/past")) {
    //system("cp /var/ds/past/.htaccess /var/ds/current");
    system("mv /var/ds/past /var/ds/temp");
    system("mv /var/ds/current /var/ds/past");
    system("mv /var/ds/temp /var/ds/current");
    //system("rm /var/ds/current/.htaccess");
    echo "Success<br>";
    echo "Current picture(s):<br>";

    $handle = opendir('../../ds/current');
    while (false !== ($file = readdir($handle))){
      $extension = strtolower(substr(strrchr($file, '.'), 1)); 
      if($extension == 'jpg'){ 
         echo ($file . "<br>");
      }
    }
  } else {
     echo "no history file available to use for undo";
  }
?>

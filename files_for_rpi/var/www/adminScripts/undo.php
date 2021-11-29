<?php
  if (file_exists("/var/www/past")) {
    system("cp /var/www/past/.htaccess /var/www/_");
    system("mv /var/www/past /var/www/temp");
    system("mv /var/www/_ /var/www/past");
    system("mv /var/www/temp /var/www/_");
    system("rm /var/www/_/.htaccess");
    echo "Success<br>";
    echo "Current webpage(s):<br>";

    $handle = opendir('../_');
    while (false !== ($file = readdir($handle))){
      $extension = strtolower(substr(strrchr($file, '.'), 1)); 
      if($extension == 'htm' || $extension == 'html' || $extension == 'shtml'){ 
         echo ($file . "<br>");
      }
    }
  } else {
     echo "no history file available to use for undo";
  }
?>

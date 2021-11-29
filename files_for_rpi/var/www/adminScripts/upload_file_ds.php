<?php
//ini_set('display_errors', 'On');
//error_reporting(E_ALL);
$allowedExts = array("zip", "rar", "jpeg", "jpg");
$temp = explode(".", $_FILES["file"]["name"]);
$extension = end($temp);
//echo "Type: " . $_FILES["file"]["type"] . "<br>";
//echo "Size: " . ($_FILES["file"]["size"] / 1024) . " kB<br>";
if ((($_FILES["file"]["type"] == "application/zip")
|| ($_FILES["file"]["type"] == "application/octet-stream")
|| ($_FILES["file"]["type"] == "application/x-rar-compressed")
|| ($_FILES["file"]["type"] == "image/jpeg")
|| ($_FILES["file"]["type"] == "image/jpg")
|| ($_FILES["file"]["type"] == "application/x-zip-compressed"))
&& ($_FILES["file"]["size"] < 1000000000)
&& in_array($extension, $allowedExts))
{
  if ($_FILES["file"]["error"] > 0)
  {
    echo "Return Code: " . $_FILES["file"]["error"] . "<br>";
  }
  else
  {
//    echo "Upload: " . $_FILES["file"]["name"] . "<br>";
//    echo "Type: " . $_FILES["file"]["type"] . "<br>";
//    echo "Size: " . ($_FILES["file"]["size"] / 1024) . " kB<br>";
//    echo "Temp file: " . $_FILES["file"]["tmp_name"] . "<br>";

    system("rm -rf /var/ds/past");
    system("mv /var/ds/current /var/ds/past");
//    system("cp /var/ds/admin/.htaccess /var/ds/past");
    mkdir("/var/ds/current", 0777);
    move_uploaded_file($_FILES["file"]["tmp_name"],
      "/var/ds/current/" . $_FILES["file"]["name"]);
//    echo "Stored in: " . "/var/ds/current/" . $_FILES["file"]["name"];

    if (($_FILES["file"]["type"] <> "image/jpeg") && ($_FILES["file"]["type"] <> "image/jpg"))
    {
        $zip = new ZipArchive;
        $zip->open("/var/ds/current/" . $_FILES["file"]["name"]);
        $zip->extractTo("/var/ds/current");
        $zip->close();
    }
    echo "Success<br>";
  }
}
else
{
  echo "Invalid file<br>";
  echo "Type: " . $_FILES["file"]["type"] . "<br>";
  echo "Size: " . ($_FILES["file"]["size"] / 1024) . " kB<br>";
}
?>


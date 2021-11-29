<?php
$fn = "/home/pi/infoBlasterDS.sh";
if (isset($_POST['content']))
{
    $content = stripslashes($_POST['content']);
    $fp = fopen($fn,"wb") or die ("Error opening file in write mode!");
    $content = str_replace("\r\n", "\n", $content);
    fputs($fp,$content);
    fclose($fp) or die ("Error closing file!");
    echo("File has been saved. Reboot required for changes to take effect.");
}

?>

<form action="<?php echo $_SERVER["PHP_SELF"] ?>" method="post">
    <textarea rows="40" cols="100" name="content"><?php readfile($fn); ?></textarea>
    <input type="submit" value="Save"> 
</form>

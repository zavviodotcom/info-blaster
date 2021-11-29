<?php
// Jump to the only html file if there is only 1, otherwise jump
// to the folder so the directory will be displayed
// Jump to index.php or index.html if it exists, regardless of file count
$handle = opendir('./_');
$filecnt = 0;
$foundIndexPhp = 0;
$foundIndexHtm = 0; 
while (false !== ($file = readdir($handle))){
  $filelow = strtolower($file);
  if($filelow == 'index.php') {
    $foundIndexPhp = 1;
    $topFile = $file;
    break 1;
  } 
  $extension = substr(strrchr($filelow, '.'), 1); 
  if($extension == 'htm' || $extension == 'html' || $extension == 'shtml'){ 
    if($filelow == 'index.htm' || $filelow == 'index.html' || $filelow == 'index.shtml'){ 
      $foundIndexHtm = 1;
      $topFile = $file;
    }
    elseif($foundIndexHtm == 0) {
      $topFile = $file;
    }
    $filecnt = $filecnt + 1;
  }
}
if ($foundIndexPhp == 1 || $foundIndexHtm == 1 || $filecnt == 1){
  header("Location:_/" . $topFile); }
else {header("Location:_");}
?>

<?php 

$htpasswd = "/etc/nginx/passwd/.htpasswd"; 

function crypt_apr1_md5($plainpasswd)
{
    $tmp = '';
    $salt = substr(str_shuffle("abcdefghijklmnopqrstuvwxyz0123456789"), 0, 8);
    $len = strlen($plainpasswd);
    $text = $plainpasswd.'$apr1$'.$salt;
    $bin = pack("H32", md5($plainpasswd.$salt.$plainpasswd));
    for($i = $len; $i > 0; $i -= 16) { $text .= substr($bin, 0, min(16, $i)); }
    for($i = $len; $i > 0; $i >>= 1) { $text .= ($i & 1) ? chr(0) : $plainpasswd{0}; }
    $bin = pack("H32", md5($text));
    for($i = 0; $i < 1000; $i++)
    {
        $new = ($i & 1) ? $plainpasswd : $bin;
        if ($i % 3) $new .= $salt;
        if ($i % 7) $new .= $plainpasswd;
        $new .= ($i & 1) ? $bin : $plainpasswd;
        $bin = pack("H32", md5($new));
    }
    for ($i = 0; $i < 5; $i++)
    {
        $k = $i + 6;
        $j = $i + 12;
        if ($j == 16) $j = 5;
        $tmp = $bin[$i].$bin[$k].$bin[$j].$tmp;
    }
    $tmp = chr(0).chr(0).$bin[11].$tmp;
    $tmp = strtr(strrev(substr(base64_encode($tmp), 2)),
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/",
    "./0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");
 
    return "$"."apr1"."$".$salt."$".$tmp;
}

function generateRandomString($length = 10) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()+=';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

if (($_POST[p] == "random") and ($_POST[p2] == "password"))
{
   $randomPw = generateRandomString(12);
   echo "Password is now set as:", $randomPw, "<br>";
   $insString = crypt_apr1_md5($randomPw);
   $newHtpasswd = "info-blaster:" . $insString . "\n"; 

   $Handle = fopen($htpasswd, "w"); 
   if (!fputs($Handle, $newHtpasswd)) 
   { 
        echo "Could not write new password<br>"; 
   } else 
   { 
       $Handle2 = fopen('../pwhint/pwhint.txt', "w"); 
       if (!fputs($Handle2, $_POST[ph])) 

       { 
           echo "Could not write password hint<br>"; 
       } else 
       { 
           echo "Password hint written successfully. It can be read by entering http://10.0.0.1:81/pwhint in browser.<br>"; 
       } 
       fclose($Handle2); 

       echo "New password written successfully<br>"; 
    } 
    fclose($Handle); 
}
elseif ($_POST[p] !== $_POST[p2])
{
   echo "input passwords need to be identical<br>";
}
else
{
    $insString = crypt_apr1_md5($_POST[p]);
    $newHtpasswd = "info-blaster:" . $insString . "\n"; 

    $Handle = fopen($htpasswd, "w"); 
    if (!fputs($Handle, $newHtpasswd)) 

    { 
        echo "Could not write new password<br>"; 
    } else 
    { 
       $Handle2 = fopen('../pwhint/pwhint.txt', "w"); 
       if (!fputs($Handle2, $_POST[ph])) 

       { 
           echo "Could not write password hint<br>"; 
       } else 
       { 
           echo "Password hint written successfully. It can be read by entering http://10.0.0.1:81/pwhint in browser.<br>"; 
       } 
       fclose($Handle2); 

       echo "New password written successfully<br>"; 
    } 
    fclose($Handle); 
}


?>

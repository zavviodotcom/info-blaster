<html>
<head>
<meta http-equiv="cache-control" content="no-cache"> <!-- tells browser not to cache -->
<meta http-equiv="expires" content="0"> <!-- says that the cache expires 'now' -->
<meta http-equiv="pragma" content="no-cache"> <!-- says not to use cached stuff, if there is any -->
</head>
<body>
  <?php
    header("Cache-Control: no-cache, must-revalidate"); // HTTP/1.1
    header("Expires: Sat, 26 Jul 1967 05:00:00 GMT"); // Date in the past
    $today = date("d M Y h:i:i A");
    echo "current date/time: ", $today
  ?>

  <p>Note: time should only be set for applications that need valid timestamps (e.g., camera recording). Server does not keep time when unpowered so time would need to be set each time it is powered (for applications that need clock).</p>
  <FORM method="post" ACTION="setTime.php">
  <INPUT TYPE="datetime-local" name="dt" value="">
  <input type="Submit" name="Set Time" value="Set Time">
  </FORM>

</body>
</html>

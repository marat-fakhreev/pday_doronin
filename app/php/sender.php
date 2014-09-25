<?php
  $to = 'marat.fakhreev@gmail.com';
  $subject = $_GET['subject'];
  $message = $_GET['data'];
  mail($to, $subject, $message);
  echo($message);
?>

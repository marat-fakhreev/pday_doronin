<?php
  $to = 'davlet@praktikabs.ru';
  $subject = $_GET['subject'];
  $message = $_GET['data'];
  mail($to, $subject, $message);
  echo($message);
?>

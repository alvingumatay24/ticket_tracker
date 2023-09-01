<?php 

include 'connect.php';
$id = $_POST['id'];
$conn->query("DELETE FROM data WHERE id='".$id."'");

?>
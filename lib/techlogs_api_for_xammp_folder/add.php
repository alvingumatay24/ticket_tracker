<?php 

include 'connect.php';
$raised_by = $_POST["raised_by"];
$date_raised = $_POST["date_raised"];
$school = $_POST["school"];
$issue_concerns = $_POST["issue_concerns"];
$type_of_concern = $_POST["type_of_concern"];
$image = $_FILES['image']['name'];
$imagePath = 'uploads/'.$image;
$tmp_name = $_FILES['image']['tmp_name'];
move_uploaded_file($tmp_name, $imagePath);
$nature_of_concern = $_POST["nature_of_concern"];
$root_cause = $_POST["root_cause"];
$resolution = $_POST["resolution"];
$report = $_POST["report"];
$conn->query("INSERT INTO process_ticket  VALUES(NULL,'".$raised_by."', '".$date_raised."','".$school."','".$issue_concerns."','".$type_of_concern."','".$image."','".$nature_of_concern."','".$root_cause."','".$resolution."','".$report."')");

?>
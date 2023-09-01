<?php 

include 'connect.php';
$issue_id = $_POST["issue_id"];
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

$conn->query("update `process_ticket`  set  `raised_by`='".$raised_by."', `date_raised`='".$date_raised."',  `school`='".$school."',  `issue_concerns`='".$issue_concerns."',  `type_of_concern`='".$type_of_concern."', `image`='".$image."', `nature_of_concern`='".$nature_of_concern."',  `root_cause`='".$root_cause."',  `resolution`='".$resolution."',  `report`='".$report."'  where  `issue_id`='".$issue_id."'");

?>
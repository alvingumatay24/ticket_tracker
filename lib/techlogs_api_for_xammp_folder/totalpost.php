<?php

include 'connect.php';

$sql=$conn->query('SELECT Count(issued_id) FROM process_ticket');

$result=$sql;
$totalValue = mysqli_num_rows($result);

echo json_encode($totalValue);

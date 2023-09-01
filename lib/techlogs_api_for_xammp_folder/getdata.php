<?php 

include 'connect.php';

$sql=$conn->query('SELECT * FROM  process_ticket');

$res=array();

while($row=$sql->fetch_assoc())
{
    $res[]=$row;
}

echo json_encode($res);

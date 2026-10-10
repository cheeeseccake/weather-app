<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../src/classes/Points.php';

$points = new Points();
$data = $points->getPointsAndStreak();
echo json_encode($data);
?>
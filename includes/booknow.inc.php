<?php
include_once 'dbh.inc.php';

$query = "SELECT MAX(B_Id) AS max_value FROM booking";
$result = mysqli_query($conn, $query);

if ($result === false) {
    die("Error executing the query: " . mysqli_error($conn));
}

$row = mysqli_fetch_assoc($result);

if ($row === null) {
    $maxValue = 0;
} else {
    $maxValue = $row['max_value'];
}

$nextValue = $maxValue + 1;

$vehicle = $_POST['vehicle'];
$date = $_POST['date'];
$time = $_POST['time'];
$start = $_POST['start'];
$destination = $_POST['destination'];

// Insert the data into the 'booking' table
$sql = "INSERT INTO booking (B_Id, Start, Destination, Date, Time)
        VALUES ('$nextValue', '$start', '$destination', '$date', '$time')";

if (mysqli_query($conn, $sql)) {
    mysqli_close($conn);
    header("Location: ../Payment01.html");
    exit();
} else {
    die("Error inserting data: " . mysqli_error($conn));
}
?>























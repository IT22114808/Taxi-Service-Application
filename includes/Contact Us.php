<?php
include_once 'dbh.inc.php';

$query = "SELECT MAX(R_Id) AS max_value FROM Review";
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

$email = $_POST['email'];
$msg = $_POST['msg'];


// Retrieve the M_Id from the member table based on the email
$memberQuery = "SELECT M_Id FROM member WHERE M_email = '$email'";
$memberResult = mysqli_query($conn, $memberQuery);

if ($memberResult === false) {
    die("Error executing the query: " . mysqli_error($conn));
}

$memberRow = mysqli_fetch_assoc($memberResult);

if ($memberRow === null) {
    die("Error: Member with email '$email' not found.");
}

$memberId = $memberRow['M_Id'];

// Insert the data into the 'Review' table
$sql = "INSERT INTO Review (R_Id, Ratting, M_Id)
        VALUES ('$nextValue', '$msg', '$memberId')";

if (mysqli_query($conn, $sql)) {
    mysqli_close($conn);
    header("Location: ../index.html");
    exit();
} else {
    die("Error inserting data: " . mysqli_error($conn));
}







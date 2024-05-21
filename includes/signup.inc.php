




<?php
include_once 'dbh.inc.php';

$query = "SELECT MAX(M_Id) AS max_value FROM member";
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

$query = "SELECT MAX(Acc_ID) AS max_value FROM Account";
$result = mysqli_query($conn, $query);

if ($result === false) {
    die("Error executing the query: " . mysqli_error($conn));
}

$row = mysqli_fetch_assoc($result);

if ($row === null) {
    $maxValue = 0;
} else {
    $maxValue1 = $row['max_value'];
}

$nextValue1 = $maxValue1 + 1;

$first = $_POST['first'];
$last = $_POST['last'];
$dob = $_POST['dob'];
$email = $_POST['email'];
$pw = $_POST['pw'];

$insertAccountStmt = $conn->prepare("INSERT INTO Account (Acc_Id, username, password, Acc_Type, A_Id) VALUES (?, ?, ?, 'Member', '006')");
$insertMemberStmt = $conn->prepare("INSERT INTO Member (M_Id, Firstname, Lastname, M_dob, M_email, A_Id, Acc_Id) VALUES (?, ?, ?, ?, ?, '002', ?)");

// Bind parameters to the statements
$insertAccountStmt->bind_param("iss", $nextValue1, $email, $pw);
$insertMemberStmt->bind_param("issssi", $nextValue, $first, $last, $dob, $email, $nextValue1);

// Execute the statements
if ($insertAccountStmt->execute() && $insertMemberStmt->execute()) {
    mysqli_close($conn);
    header("Location: ../bookNow.html");
    exit();
} else {
    die("Error inserting data: " . $conn->error);
}


?>




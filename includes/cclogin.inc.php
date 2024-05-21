<?php
include_once 'dbh.inc.php';

// Process the login form
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Prepare and execute a database query
    $query = "SELECT * FROM Account WHERE username='$username'";
    $result = mysqli_query($conn, $query);

    // Check if the query returned any rows
    if (mysqli_num_rows($result) > 0) {
        // User exists, check password
        $user = mysqli_fetch_assoc($result);
        if ($password == $user["password"]) {
            // Login successful
            if($query = "SELECT * FROM Account WHERE Acc_type='Customer Service'")
    {
            header("Location: ../CustomerCare.php"); // Redirect to the bookNow.html page
            exit();}
            else {
                echo "Invalid user.";
            }
        } else {
            // Login failed - Incorrect password
            echo "Invalid password.";
        }
    } else {
        // Login failed - User not found
        echo "Invalid username.";
    }
}
?>

   
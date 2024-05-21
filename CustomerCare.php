<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="DriverInterface.css">
    <script src="script.js"></script>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            font-size: 15px;
            padding: 12px;
            text-align: left;
            border-bottom: 5px solid #ddd;
        }

        th {
            background-color: rgba(255, 221, 0, 0.788);
        }
        td{
            background-attachment: fixed;
            background-color:rgba(255, 255, 255, 0.788);
        }

        tr:hover {
            background-color: #ffffff;
            
        }
    </style>
</head>

<body>
    <div class="main-container">
        <header class="header">
            <a href="#" id="logo"><img src="images/yellow-logo.jpg" alt="" width="20%" height="20%"></a>
            <nav class="navbar">
            <a href="index.html">Home</a>
                    <a href="review.php">Reviews</a>
                    <a href="index.html #About">About</a>
                    <a href="Contact Us.html">Contact Us</a>
            </nav>
            <nav class="Login">
                <a href="Login.html">Sign In</a> /
                <a href="Sign up.html">Sign Up</a>
            </nav>
        </header>
    </div>

    <div class="drivertable">
        <div class="driverInterface">
            <h2>Ongoing Bookigs...</h2>
            <br>
            <?php
            
                include_once 'includes/dbh.inc.php';

        
            
            
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
            
            
            $sql = "SELECT * FROM booking";
            $result = $conn->query($sql);
        
            
            if ($result->num_rows > 0) {
                echo "<table>";
                echo "<tr><th>B_Id</th><th>Start</th><th>Destination</th><th>Date</th><th>Time</th><th>Action</th></tr>";
                
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row["B_Id"] . "</td>";
                    echo "<td>" . $row["Start"] . "</td>";
                    echo "<td>" . $row["Destination"] . "</td>";
                    echo "<td>" . $row["Date"] . "</td>";
                    echo "<td>" . $row["Time"] . "</td>";
                    echo "<td><button>Confirm</button>                     <button>cancel</buttio></td>"; // Button added in the new column
                    echo "</tr>";
                }
                
                echo "</table>";
            } else {
                echo "No trips found.";
            }
        
            // Close the database connection
            $conn->close();
            ?>
    
        </div>
    </div>

    <footer>
        <div id="footer-content">
            <p>&copy; 2023 Your Taxi Company. All rights reserved.</p>
        </div>

        <p>&copy; <span id="curYear"></span> AllWay Transport Service</p>
        <p>Powered By: <a rel="nofollow noopener" href="#"><em>AllWay Transport Service.lk</em></a></p>
    </footer>

    <script>
        var date = new Date();
        var year = date.getFullYear();
        document.getElementById('curYear').innerHTML = year;
    </script>
</body>
</html>


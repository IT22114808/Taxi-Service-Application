<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="DriverInterface.css">
    <script src="script.js"></script>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            font: 1em sans-serif;
            padding: 12px;
            text-align: left;
            border-bottom: 5px solid #ddd;
        }

        th {
            background-color: rgb(255, 221, 0);
        }
        td{
            background-attachment: fixed;
            background-color: #f2f2f2;
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
                <a href="#">Blog</a>
                <a href="#">About</a>
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
            <h2>Happy Clients & Reviews...</h2>
            <br>
            <?php
            
                include_once 'includes/dbh.inc.php';

        
            
            
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
            
            
            $sql = "SELECT * FROM Review";
            $result = $conn->query($sql);
        
            
            if ($result->num_rows > 0) {
                echo "<table>";
                echo "<tr><th>R_Id</th><th>Ratting</th><</tr>";
                
                while ($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . $row["R_Id"] . "</td>";
                    echo "<td>" . $row["Ratting"] . "</td>";
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


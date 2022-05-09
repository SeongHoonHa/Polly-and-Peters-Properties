<?php
$servername = "db.luddy.indiana.edu";
$username = "i308s22_team85";
$password = "my+sql=i308s22_team85";
$dbname = "i308s22_team85";


$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connnect_error) {
  die("connnection failed: " . $conn->connnect_error);
}

$lname = mysqli_real_escape_string($conn, $_POST['form_lname']);

$sql = "SELECT COUNT(rp.Property_ID) as Num_Of_Properties, pm.Lname as Last_Name
FROM Rental_Properties as rp
JOIN Property_Managers_Rental_Properties as pmrp ON pmrp.mProperty_ID = rp.Property_ID
JOIN Property_Managers as pm ON pm.SSN = pmrp.managerSSN
WHERE pm.Lname = '$lname'
GROUP BY Last_Name";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  echo "<table><tr><th>Number of Properties</th><th>Last Name</th></tr>";

  while($row = $result->fetch_assoc()) {
    echo "<tr><td>".$row["Num_Of_Properties"]."</td><td>".$row["Last_Name"]."</td></tr>";
  }
  echo "</table>";
} else {
  echo "0 results";
}
$conn->close();
?>




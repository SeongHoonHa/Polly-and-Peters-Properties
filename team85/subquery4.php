<?php
$servername = "db.luddy.indiana.edu";
$username = "i308s22_team85";
$password = "my+sql=i308s22_team85";
$dbname = "i308s22_team85";


$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT MAX(l.price) as Highest_rent, pm.SSN as Manager_SSN
FROM Lease as l
JOIN Tenants as t ON l.Tenant_id = t.Tenant_id
JOIN Property_Managers as pm ON pm.SSN = t.SSN";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  echo "<table><tr><th>Highest Rent</th><th>Manager SSN</th></tr>";

  while($row = $result->fetch_assoc()) {
    echo "<tr><td>".$row["Highest_rent"]."</td><td>".$row["Manager_SSN"]."</td></tr>";
  }
  echo "</table>";
} else {
  echo "0 results";
}
$conn->close();
?>




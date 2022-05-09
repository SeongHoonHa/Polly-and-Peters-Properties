<?php
$servername = "db.luddy.indiana.edu";
$username = "i308s22_team85";
$password = "my+sql=i308s22_team85";
$dbname = "i308s22_team85";


$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

else

  { echo "Established Database Connection";}

$apartment_number = mysqli_real_escape_string($conn, $_POST['form_apartment_number']);

$sql = "SELECT l.Cosigner as cosigner, ht.Apartment_number as apartment_number
FROM Lease as l
JOIN Tenants as t ON l.Tenant_id = t.Tenant_id
JOIN House_type as ht ON ht.House_Tenant_id = t.Tenant_id
WHERE apartment_number = $apartment_number
ORDER BY apartment_number";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  echo "<table><tr><th>cosigner</th><th>apartment_number</th></tr>";

  while($row = $result->fetch_assoc()) {
    echo "<tr><td>".$row["cosigner"]."</td><td>".$row["apartment_number"]."</td></tr>";
  }
  echo "</table>";
} else {
  echo "0 Results";
}
$conn->close();
?>




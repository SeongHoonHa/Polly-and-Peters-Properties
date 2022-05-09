<?php
$servername = "db.luddy.indiana.edu";
$username = "i308s22_team85";
$password = "my+sql=i308s22_team85";
$dbname = "i308s22_team85";


$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$higher_number = mysqli_real_escape_string($conn, $_POST['form_higher_number']);

$lower_number = mysqli_real_escape_string($conn, $_POST['form_lower_number']);

echo $higher_number;
echo $lower_number;

$sql = "SELECT CONCAT(t.first_name,' ', t.last_name) as full_name, d.Damage_Type as Damage_Type, d.Damage_Cost as Damage_Cost
FROM Tenants as t
JOIN Damages as d ON t.Tenant_id = d.dTenant_id
WHERE d.Damage_Cost < '$higher_number' AND d.dTenant_id NOT IN
( SELECT d1.dTenant_id  FROM Damages as d1 WHERE d1.Damage_cost < '$lower_number')
GROUP BY full_name";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  echo "<table><tr><th>Full Name</th><th>Damage Type</th><th>Damage Cost</th></tr>";

  while($row = $result->fetch_assoc()) {
    echo "<tr><td>".$row["full_name"]."</td><td>".$row["Damage_Type"]."</td><td>".$row["Damage_Cost"]."</td></tr>";
  }
  echo "</table>";
} else {
  echo "0 results";
}
$conn->close();
?>




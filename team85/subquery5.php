<?php
$servername = "db.luddy.indiana.edu";
$username = "i308s22_team85";
$password = "my+sql=i308s22_team85";
$dbname = "i308s22_team85";


$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$tenant_id = mysqli_real_escape_string($conn, $_POST['form_tenantid']);

$sql = "SELECT t.Tenant_id as Tenant_id, d.One_month_rent as Deposit_price
FROM Tenants as t
JOIN Deposits as d ON t.Tenant_id = d.Tenant_id
WHERE t.Tenant_id = $tenant_id
";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  echo "<table><tr><th>Tenant ID</th><th>Deposit Price</th></tr>";

  while($row = $result->fetch_assoc()) {
    echo "<tr><td>".$row["Tenant_id"]."</td><td>".$row["Deposit_price"]."</td></tr>";
  }
  echo "</table>";
} else {
  echo "0 results";
}
$conn->close();
?>




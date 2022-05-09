<html>

<body>
<h1>Query Display</h1>
<br>



<h2>First Query</h2>
<h4>Returns the cosigner of the apartment number you input</h4>
    <form action = "subquery1.php" method="POST">
    Apartment Number (1-20):<input type="number" min="0" max="20" name="form_apartment_number">
    <input type="submit" value = "Show Query 1">
    </form>

<h2>Second Query</h2>
<h4>Returns name, damage type, and damage cost between 2 limits you input </h4>
    <form action = "subquery2.php" method="POST">
    Upper Limit: <input type="number" name="form_higher_number">
    Lower Limit: <input type="number" name="form_lower_number">
    <input type="submit" value = "Show Query 2">
    </form>

<h2>Third Query</h2>
<h4>Returns the number of properties that a property manager that you input manages</h4>
    <form action = "subquery3.php" method="POST">
        Property Manager's Last Name: <select name="form_lname">
            <?php
            $con = mysqli_connect("db.luddy.indiana.edu","i308s22_team85","my+sql=i308s22_team85","i308s22_team85");

            if (!$con) {
                die("Connection failed: " . mysqli_connect_error() . "<br>");
            }

            $result = mysqli_query($con, "SELECT distinct Lname FROM Property_Managers");
            while ($row = mysqli_fetch_assoc($result)) {
                unset($id, $name);
                $id = $row['Lname'];
                $name = $row['Lname'];
                echo '<option value="'.$id.'">'.$name.'</option>';
            }
            ?>
        </select>
        <input type="submit" value = "Show Query 3">
    </form>

<h2>Fourth Query</h2>
<h4>Returns the current highest rent</h4>
    <form action = "subquery4.php">
    <input type="submit" value = "Show Query 4">
    </form>

<h2>Fifth Query</h2>
<h4>Returns how much a tenant has to put down for a deposit</h4>
    <form action = "subquery5.php" method="POST">
    Tenant ID: <input type="number" name="form_tenantid" min="0" max="20">
    <input type="submit" value = "Show Query 5">
    </form>


</body>

</html>
<?php
    $name = "";
    $hid = "";
    if(isset($_POST["edit-request-patient"])){ //checks if click was from patient's request
        echo 'Edit ' . $_POST["name"] . "'s information";
        $name = $_POST["name"];
        $hid = $_POST["hid"];
?>
<br>
Please enter patient's new location:
<form name="edit-patient" method="post">
<input type="hidden" name="name" value="<?php echo $name ?>" > <br>
<input type="hidden" name="hid" value="<?php echo $hid ?>"> <br>
New Name: <input type="text" name="newname"> <br>
New Phone Number: <input type="text" name="pn"> <br>
New Address: <input type="text" name="address"> <br>
New City: <input type="text" name="city"> <br>
New Province: <input type="text" name="province"> <br>
New Postal Code: <input type="text" name="postal_code"> <br>
<input type="submit" name="edit-patient" value="Change"> <br>
</form>
<?php
    } else if(isset($_POST["edit-request-staff"])){
        echo 'Edit ' . $_POST["name"] . "'s information";
        $name = $_POST["name"];
        $sin= $_POST["sin"];
?>
<br>
Please enter staff's new location:
<form name="edit-staff" method="post">
<input type="hidden" name="sin" value="<?php echo $sin ?>"> <br>
New Name: <input type="text" name="newname"> <br>
New Phone Number: <input type="text" name="pn"> <br>
New Address: <input type="text" name="address"> <br>
New City: <input type="text" name="city"> <br>
New Province: <input type="text" name="province"> <br>
New Postal Code: <input type="text" name="postal_code"> <br>
<input type="submit" name="edit-staff" value="Change"> <br>
</form>   
<?php
    } else if(isset($_POST["edit-request-physician"])){
        echo 'Edit ' . $_POST["name"] . "'s information";
        $name = $_POST["name"];
        $sin= $_POST["sin"];
?>
<br>
Please enter physician's new location:
<form name="edit-physician" method="post">
<input type="hidden" name="sin" value="<?php echo $sin ?>"> <br>
New Name: <input type="text" name="newname"> <br>
New Phone Number: <input type="text" name="pn"> <br>
New Address: <input type="text" name="address"> <br>
New City: <input type="text" name="city"> <br>
New Province: <input type="text" name="province"> <br>
New Postal Code: <input type="text" name="postal_code"> <br>
New Specialty: <input type="text" name="specialty"> <br>
New Hospital Name: <input type="text" name="office_name"> <br>
New Hospital City: <input type="text" name="office_city"> <br>
New Office Room: <input type="text" name="office_room"> <br>
New Office Level: <input type="text" name="office_level"> <br>
<input type="submit" name="edit-physician" value="Change"> <br>
</form>   
<?php
    }
?>
  
<?php
  
    if (isset($_POST["edit-patient"])) {
          
        if(!empty($_POST["newname"]) and !empty($_POST["address"]) and !empty($_POST["city"]) and !empty($_POST["province"]) and !empty($_POST["postal_code"]) and !empty($_POST["pn"])){
            $newname = $_POST["newname"];
			$address = $_POST["address"];
            $city = $_POST["city"];
            $province = $_POST["province"];
            $postal_code = $_POST["postal_code"];
            $pn = $_POST["pn"];
            $hid = $_POST["hid"];
            
            $newname = mysql_real_escape_string($newname);
            $address = mysql_real_escape_string($address);
            $city = mysql_real_escape_string($city);
            $province = mysql_real_escape_string($province);
            $postal_code = mysql_real_escape_string($postal_code);
            $pn = mysql_real_escape_string($pn);
            $hid = mysql_real_escape_string($hid);

            $query = "UPDATE patient
                        SET name = '$newname', address = '$address', city = '$city', province = '$province', postal_code = '$postal_code', phonenum = '$pn'
                        WHERE healthid = $hid;";
              
            $result = mysql_query($query);
              
            if (!$result) {
?>
            <a href="javascript:history.go(-1)">Try Again</a> <br>
<?php
                die('Invalid query: ' . mysql_error());
            } else {
                echo $_POST["newname"] . '\'s information changed. Continue navigating top.' . "<br>";
            }
              
        } else {
            echo 'Not all fields were filled in.  Try again. ';
?>
        <a href="javascript:history.go(-1)">Try Again</a>
<?php
        }
          
    } else if (isset($_POST["edit-staff"])){
        if(!empty($_POST["newname"]) and !empty($_POST["address"]) and !empty($_POST["city"]) and !empty($_POST["province"]) and !empty($_POST["postal_code"]) and !empty($_POST["pn"])){
            $newname = $_POST["newname"];
			$address = $_POST["address"];
            $city = $_POST["city"];
            $province = $_POST["province"];
            $postal_code = $_POST["postal_code"];
            $pn = $_POST["pn"];
            $sin = $_POST["sin"];

            $newname = mysql_real_escape_string($newname);
            $address = mysql_real_escape_string($address);
            $city = mysql_real_escape_string($city);
            $province = mysql_real_escape_string($province);
            $postal_code = mysql_real_escape_string($postal_code);
            $pn = mysql_real_escape_string($pn);
            $sin = mysql_real_escape_string($sin);
              
            $query = "UPDATE staff
                        SET name = '$newname', address = '$address', city = '$city', province = '$province', postal_code = '$postal_code', phonenum = '$pn'
                        WHERE sin = $sin;";
              
            $result = mysql_query($query);
              
            if (!$result) {
?>
            <a href="javascript:history.go(-1)">Try Again</a> <br>
<?php
                die('Invalid query: ' . mysql_error());
            } else {
                echo $_POST["newname"] . '\'s information changed. Continue navigating top.' . "<br>";
            }
              
        } else {
            echo 'Not all fields were filled in.  Try again. ';
?>
        <a href="javascript:history.go(-1)">Try Again</a>
<?php        
		}
    } else if (isset($_POST["edit-physician"])){
        if(!empty($_POST["newname"]) and !empty($_POST["address"]) and !empty($_POST["city"]) and !empty($_POST["province"]) and !empty($_POST["postal_code"]) and !empty($_POST["pn"])
			and !empty($_POST["specialty"]) and !empty($_POST["office_name"]) and !empty($_POST["office_city"]) and !empty($_POST["office_room"]) and !empty($_POST["office_level"])){
            $newname = $_POST["newname"];
			$address = $_POST["address"];
            $city = $_POST["city"];
            $province = $_POST["province"];
            $postal_code = $_POST["postal_code"];
            $pn = $_POST["pn"];
			$specialty = $_POST["specialty"];
			$office_name = $_POST["office_name"];
			$office_city = $_POST["office_city"];
			$office_room = intval($_POST["office_room"]);
			$office_level = intval($_POST["office_level"]);
            $sin = $_POST["sin"];

            $newname = mysql_real_escape_string($newname);
            $address = mysql_real_escape_string($address);
            $city = mysql_real_escape_string($city);
            $province = mysql_real_escape_string($province);
            $postal_code = mysql_real_escape_string($postal_code);
            $pn = mysql_real_escape_string($pn);
            $specialty = mysql_real_escape_string($specialty);
            $office_name = mysql_real_escape_string($office_name);
            $office_city = mysql_real_escape_string($office_city);
            $office_room = mysql_real_escape_string($office_room);
            $office_level = mysql_real_escape_string($office_level);
            $sin = mysql_real_escape_string($sin);
              
            $query1 = "UPDATE staff
                        SET name = '$newname', address = '$address', city = '$city', province = '$province', postal_code = '$postal_code', phonenum = '$pn'
                        WHERE sin = $sin;";
			$query2 = "UPDATE physician
						SET specialty = '$specialty', office_room = $office_room, office_name = '$office_name', office_level = $office_level, office_city = '$office_city'
						WHERE sin = $sin;";
              
            $result1 = mysql_query($query1);
			$result2 = mysql_query($query2);
              
            if (!$result1 or !$result2) {
?>
            <a href="javascript:history.go(-1)">Try Again</a> <br>
<?php
                die('Invalid query: ' . mysql_error());
            } else {
                echo $_POST["newname"] . '\'s information changed. Continue navigating top.' . "<br>";
            }
              
        } else {
            echo 'Not all fields were filled in.  Try again. ';
?>
        <a href="javascript:history.go(-1)">Try Again</a>
<?php        
		}
    }
?>
<br>
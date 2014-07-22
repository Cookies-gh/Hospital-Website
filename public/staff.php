<?php
$staff_group = "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  	if (isset($_POST["Staff"])) {
  		$staff_group = $_POST["Staff"];
  	}
  	
  	
}

?>
<h2>Staff</h2>
<br>
<form method="post" action="" style ="display:none;">
	Enter Group:
	<input type="radio" name="Staff" value="All">All Staff
	<input type="radio" name="Staff" value="Nurses">Nurses
	<input type="radio" name="Staff" value="Receptionist">Receptionist
	<input type="radio" name="Staff" value="Physicians">Physicians
	<input type="radio" name="Staff" value="Janitors">Janitors
	<br>
	<input type="submit" name="single" value="Submit"> 
	<br><br><br>
</form>

Enter Current Position:
<form method="post" action="">
	<input type="checkbox" name="Staff[]" value="Nurse">Nurses
	<input type="checkbox" name="Staff[]" value="Receptionist">Receptionist
	<input type="checkbox" name="Staff[]" value="Physician">Physicians
	<input type="checkbox" name="Staff[]" value="Janitor">Janitors
	<input type="checkbox" name="Staff[]" value="Security">Security
	<br>
	<input type="submit" name="division" value="Submit"> 
	<br><br><br>
</form>
<?php
	$query_staff = "SELECT * FROM staff;";
	if (isset($_POST["single"])) {
		if($staff_group == "Nurses"){
			echo 'Only Nurses' . "<br>";
			$query_staff = "
				SELECT s.sin, s.name, s.phonenum, s.address, s.city, s.postal_code, s.province 
				FROM staff s, nurse n
				WHERE s.sin = n.sin;";
		} else if ($staff_group == "Physicians"){
			$query_staff = "
				SELECT s.sin, s.name, s.phonenum, s.address, s.city, s.postal_code, s.province 
				FROM staff s, physician p
				WHERE s.sin = p.sin;";
			echo 'Only Physicians' . "<br>";
		} else if ($staff_group == "Janitors"){
			$query_staff = "
				SELECT s.sin, s.name, s.phonenum, s.address, s.city, s.postal_code, s.province 
				FROM staff s, janitor j
				WHERE s.sin = j.sin;";
			echo 'Only Janitors' . "<br>";
		} else if ($staff_group == "Receptionist"){
			$query_staff = "
				SELECT s.sin, s.name, s.phonenum, s.address, s.city, s.postal_code, s.province 
				FROM staff s, receptionist r
				WHERE s.sin = r.sin;";
			echo 'Only Receptionists' . "<br>";
		} else {
			echo 'All Staff Members' . "<br>";
		}
	}
	else if (isset($_POST["division"])) {
		if(empty($staff_group)) 
		  {
		    echo("Staff with no positions");
		  }
		else
		{
			$maxLen = count($staff_group);
			
			$query_staff = "SELECT s.sin, s.name, s.phonenum, s.address, s.city, s.postal_code, s.province 
							FROM staff s ";

		    echo("You selected $maxLen position(s) :");
		    for($i=0; $i < $maxLen; $i++)
		    {
		    	if ($i== 0) {
		    		$query_staff .= "WHERE ";
		    	}
		    	else{
		    		$query_staff .= "AND ";	
		    	}

		    	$query_staff .= " EXISTS( SELECT sin FROM $staff_group[$i] s$i WHERE s.sin=s$i.sin ";
		    	echo($staff_group[$i] . " ");
		    }
		    for($i=0; $i < $maxLen; $i++)
		    {
		    	$query_staff .= ")";
		    }
		    $query_staff.= ";";
		}

		//echo "<br>". $query_staff;
	}
?>

<table align="center" border="1">
          <tr>
          <td>sin</td>
          <td>Name</td>
          <td>Phone Number</td>
          <td>Address</td>
          <td>City</td>
          <td>Postal Code</td>
          <td>Province</td>
		  <td>Edit</td>
          <td>Delete</td>
          </tr>

          <?php 
            //use return Database
          $result = mysql_query($query_staff);
          while ($subject = mysql_fetch_assoc($result)) {
          ?>
          <tr>
          <td><?php  echo $subject["sin"]."<br/>";?></td>
          <td><?php  echo $subject["name"]."<br/>";?></td>
          <td><?php  echo $subject["phonenum"]."<br/>";?></td>
          <td><?php  echo $subject["address"]."<br/>";?></td>
          <td><?php  echo $subject["city"]."<br/>";?></td>
          <td><?php  echo $subject["postal_code"]."<br/>";?></td>
          <td><?php  echo $subject["province"]."<br/>";?></td>
		  <td><form method="post" action="?page=pedit">
			<input type="hidden" name="sin" value="<?php echo $subject["sin"]?>">
			<input type="hidden" name="name" value="<?php echo $subject["name"]?>">
			<input type="submit" name="edit-request-staff" value="Edit">  
			</form></td>
          <td><a href="private/delete.php?class=staff&sin=<?php echo $subject["sin"]; ?>">Delete</a> </td>
          </tr>

          <?php
          }
           ?>
        </table> 

        <?php 
        mysql_free_result($result);  
          ?>
        <br>
</table>
<a href="javascript:history.go(-1)">Back</a>
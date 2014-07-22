<table align="center" border="1">
          <tr>
          <td>Health ID</td>
          <td>Name</td>
          <td>Phone Number</td>
          <td>Address</td>
          <td>City</td>
          <td>Postal Code</td>
          <td>Province</td>
		  <td>Appointments</td>
		  <td>Edit Info</td>
          <td>Delete</td>
          </tr>

          <?php 
            //use return Database
          $result = mysql_query("SELECT * FROM patient;");
          while ($subject = mysql_fetch_assoc($result)) {
          ?>
          <tr>
          <td><?php  echo $subject["healthid"]."<br/>";?></td>
          <td><?php  echo $subject["name"]."<br/>";?></td>
          <td><?php  echo $subject["phonenum"]."<br/>";?></td>
          <td><?php  echo $subject["address"]."<br/>";?></td>
          <td><?php  echo $subject["city"]."<br/>";?></td>
          <td><?php  echo $subject["postal_code"]."<br/>";?></td>
          <td><?php  echo $subject["province"]."<br/>";?></td>
		  <td><form method="post" action="?page=pappointments">
			<input type="hidden" name="sin" value="<?php echo $subject["healthid"]?>">
			<input type="hidden" name="name" value="<?php echo $subject["name"]?>">
			<input type="submit" name="patient-appts" value="Appointments">  
			</form></td>
		  <td><form method="post" action="?page=pedit">
			<input type="hidden" name="hid" value="<?php echo $subject["healthid"]?>">
			<input type="hidden" name="name" value="<?php echo $subject["name"]?>">
			<input type="submit" name="edit-request-patient" value="Edit">  
			</form></td>
          <td><a href="private/delete.php?class=patient&healthid=<?php echo $subject["healthid"]; ?>">Delete</a> </td>
          </tr>

          <?php
          }
           ?>
</table>
<?php 
	mysql_free_result($result);  
?>
<br>
<a href="javascript:history.go(-1)">Back</a>
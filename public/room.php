<?php
if(isset($_POST["hospital-room"])){
?>
	<table align="center" border="1">
          <tr>
          <td>Hospital Name</td>
          <td>Room Number</td>
          <td>Level</td>
		  <td>Type</td>
          </tr>

          <?php 
            //get all rooms associated with hospital
			$hname = $_POST["name"];
			$hcity = $_POST["city"];
			
			echo "Rooms in $hname, $hcity <br>";
			
			$query = "SELECT r.name as hname, r.roomnum as roomnum, r.level as level
				FROM Room r
				WHERE r.city = '$hcity' and r.name = '$hname';";
			$result = mysql_query($query);
			
			while ($subject = mysql_fetch_assoc($result)) {
		  
          ?>
			  <tr>
			  <td><?php  echo $subject["hname"]."<br/>";?></td>
			  <td><?php  echo $subject["roomnum"]."<br/>";?></td>
			  <td><?php  echo $subject["level"]."<br/>";?></td>
			  <td><?php //Checks type of room by checking if hospital room exists in Office or SurgeryRoom tables.
				$rn = $subject["roomnum"];
				$l = $subject["level"];
				
				$insurgery = "SELECT * FROM SurgeryRoom WHERE roomnum = $rn and level = $l and name = '$hname' and city = '$hcity'";
				$qinsurgery = mysql_query($insurgery);
				
				$inoffice = "SELECT * FROM Office WHERE roomnum = $rn and level = $l and name = '$hname' and city = '$hcity'";
				$qinoffice = mysql_query($inoffice);
				
				if(mysql_num_rows($qinsurgery) > 0){
					echo 'Surgery Room';
				} else if(mysql_num_rows($qinoffice)){
					echo 'Office';
				} else {
			  ?>
			  <form method="post" action="?page=roomstay"> 
			<input type="hidden" name="name" value="<?php echo $hname ?>">
			<input type="hidden" name="city" value="<?php echo $hcity ?>">
			<input type="hidden" name="level" value="<?php echo $l ?>">
			<input type="hidden" name="rn" value="<?php echo $rn?>">
			<input type="submit" name="roomstay" value="Occupied By">  
			</form></td></td>
			  <?php
				}
			  ?></td>
			  </tr>

          <?php
			} 
			mysql_free_result($result); 
           ?>
        <br>
</table>
<?php
	}
?>
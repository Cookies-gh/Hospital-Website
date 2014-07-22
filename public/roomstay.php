<?php
if(isset($_POST["roomstay"])){
?>
	<table align="center" border="1">
          <tr>
          <td>Patient Name</td>
          <td>Patient Health ID</td>
          <td>Room</td>
		  <td>Level</td>
		  <td>Delete</td>
          </tr>

          <?php 
            //get all rooms associated with hospital
			$hname = $_POST["name"];
			$hcity = $_POST["city"];
			$l = $_POST["level"];
			$rn = $_POST["rn"];
			
			echo "Room $rn, Level $l at $hname, $hcity occupied by: <br>";
			
			$query = "SELECT p.name as name, p.healthid as hid, psi.roomnum as rn, psi.level as level
				FROM PatientStaysIn psi, Patient p
				WHERE p.healthid = psi.healthid and psi.roomnum = $rn and psi.level = $l and psi.city = '$hcity' and psi.name = '$hname';";
			$result = mysql_query($query);
			
			while ($subject = mysql_fetch_assoc($result)) {
		  
          ?>
			  <tr>
			  <td><?php  echo $subject["name"]."<br/>";?></td>
			  <td><?php  echo $subject["hid"]."<br/>";?></td>
			  <td><?php  echo $subject["rn"]."<br/>";?></td>
			  <td><?php  echo $subject["level"]."<br/>";?></td>
			  <td> <a href="private/delete.php?class=roomstay&hcity=<?php echo $hcity; ?>&hname=<?php echo $hname; ?>&rn=<?php echo $rn; ?>&level=<?php echo $l; ?>">
			  Delete</a></td>
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
<?php
	echo 'Appointments for ' . $_POST["name"] . ':';
?>
<br>

<div>
<table align="center" border="1">
          <tr>
		  <td>Proid</td>
          <td>Date</td>
          <td>Time</td>
          <td>Description</td>
		  <td>Room</td>
		  <td>Level</td>
		  <td>Hospital Name</td>
		  <td>Hospital City</td>
		  <td>Physician</td>
		  <td>Delete</td>
          </tr>

          <?php 
            //use return Database
          $sin = $_POST["sin"];
		  
		  $query_appoint = "SELECT pr.proid as proid, pr.date, pr.time, pr.description, pir.level, pir.roomnum, pir.name, pir.city, s.name as pname
							from procedures pr, ProcedureInRoom pir, staff s
							where pr.healthid = $sin and pir.proid = pr.proid and s.sin = pr.sin";
		  
		  $result = mysql_query($query_appoint);
          while ($subject = mysql_fetch_assoc($result)) {
          ?>
          <tr>
		  <td><?php  echo $subject["proid"]."<br/>";?></td>
          <td><?php  echo $subject["date"]."<br/>";?></td>
          <td><?php  echo $subject["time"]."<br/>";?></td>
          <td><?php  echo $subject["description"]."<br/>";?></td>
		  <td><?php  echo $subject["level"]."<br/>";?></td>
		  <td><?php  echo $subject["roomnum"]."<br/>";?></td>
		  <td><?php  echo $subject["name"]."<br/>";?></td>
		  <td><?php  echo $subject["city"]."<br/>";?></td>
		  <td><?php  echo $subject["pname"]."<br/>";?></td>
		  <td><a href="private/delete.php?class=pappointments&proid=<?php echo $subject["proid"]; ?>">Delete</a></td>
          </tr>

          <?php
          }
           ?>
        </table> 
		</div>
        <?php
        mysql_free_result($result);  
          ?>
        <br>

<a href="javascript:history.go(-1)">Back</a>
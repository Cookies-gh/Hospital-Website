All Available Physicians
  
<table align="center" border="1">
          <tr>
          <td>sin</td>
          <td>Name</td>
          <td>Specialty</td>
          <td>Hospital</td>
          <td>Office Room</td>
          <td>Office Level</td>
          <td>Phone Number</td>
          <td>Address</td>
          <td>City</td>
          <td>Postal Code</td>
          <td>Province</td>
          <td>Modify</td>
          </tr>
  
          <?php 
            //use return Database
          $result = mysql_query("SELECT DISTINCT * FROM physician inner join staff where physician.sin = staff.sin;");
          while ($subject = mysql_fetch_assoc($result)) {
          ?>
          <tr>
          <td><?php  echo $subject["sin"]."<br/>";?></td>
          <td><?php  echo $subject["name"]."<br/>";?></td>
          <td><?php  echo $subject["specialty"]."<br/>";?></td>
          <td><?php  echo $subject["office_name"]."<br/>";?></td>
          <td><?php  echo $subject["office_room"]."<br/>";?></td>
          <td><?php  echo $subject["office_level"]."<br/>";?></td>
          <td><?php  echo $subject["phonenum"]."<br/>";?></td>
          <td><?php  echo $subject["address"]."<br/>";?></td>
          <td><?php  echo $subject["city"]."<br/>";?></td>
          <td><?php  echo $subject["postal_code"]."<br/>";?></td>
          <td><?php  echo $subject["province"]."<br/>";?></td>         
		  <td><form method="post" action="?page=pedit">
            <input type="hidden" name="sin" value="<?php echo $subject["sin"]?>">
            <input type="hidden" name="name" value="<?php echo $subject["name"]?>">
            <input type="submit" name="edit-request-physician" value="Edit">  
            </form></td>
          <td><a href="private/delete.php?class=physician&sin=<?php echo $subject["sin"]; ?>">Delete</a> </td>
  
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
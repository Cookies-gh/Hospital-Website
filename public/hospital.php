All Available Hospitals
<?php 
$result = mysql_query("SELECT h.name, h.address, h.city, h.postal_code, h.province, count(*) as cnt
        FROM hospital h, WorksAt w
        WHERE h.city = w.city and h.name = w.name
        GROUP BY h.name, h.city");
 ?>
<!-- Make table for available hospitals -->
<table align="center" border="1">
<tr>
  <td>Hospital</td>
  <td>Address</td>
  <td>City</td>
  <td>Postal Code</td>
  <td>Province</td>
  <td>Number of Staff</td>
  <td>Rooms</td>
  <td>Modify</td>
      </tr>

      <?php 
        //use return Database
      while ($subject = mysql_fetch_assoc($result)) {
      ?>
    <tr>
        <td><?php  echo $subject["name"]."<br/>";?></td>
        <td><?php  echo $subject["address"]."<br/>";?></td>
        <td><?php  echo $subject["city"]."<br/>";?></td>
        <td><?php  echo $subject["postal_code"]."<br/>";?></td>
        <td><?php  echo $subject["province"]."<br/>";?></td>
		<td><?php  echo $subject["cnt"]."<br/>";?></td>
		<td><form method="post" action="?page=room"> 
			<input type="hidden" name="name" value="<?php echo $subject["name"]?>">
			<input type="hidden" name="city" value="<?php echo $subject["city"]?>">
			<input type="submit" name="hospital-room" value="Rooms">  
			</form></td>
		<td><form method="post" action="?page=pedit">
            <input type="hidden" name="name" value="<?php echo $subject["name"]?>">
			<input type="hidden" name="city" value="<?php echo $subject["city"]?>">
            <input type="submit" name="edit-request-hospital" value="Edit">  
            </form></td>
        <td><a href="private/delete.php?class=hospital&name=<?php echo $subject["name"]; ?>&city=<?php echo $subject["city"]; ?>">Delete</a> </td>
    </tr>
  <?php } ?>
</table> 

    <?php 
    mysql_free_result($result);  
      ?>
    <br>
</table>


<form method="post" action="">
  <p>Working Area with
  <select name="amount">
    <option  value="max">Maximum</option>
    <option  value="min" selected>Minimum</option>
  </select>
  staffs
  </p>
  <input type="submit" value="Refresh">
</form>

<?php //Get nested aggregation.  Very very large query.  Gets min or max of an area of workers in an area.
if ($_SERVER["REQUEST_METHOD"] == "POST") {
	$query = "select t.wcity as tCity, t.wProvince as tProvince, t.cnt as tcnt from (select w.city as wCity, h.province as wProvince, count(*) as cnt
				from worksat w, hospital h
				where h.city = w.city and h.name = w.name
				group by w.city, h.province) as t
				where t.cnt ";
	
	if($_POST["amount"] == "max"){
		$query .= ">= ";
	} else {
		$query .= "<= ";
	}
	
	$query .= "ALL(select c.cnt from (select w.city as wCity, h.province as wProvince, count(*) as cnt
				from worksat w, hospital h
				where h.city = w.city and h.name = w.name
				group by w.city, h.province) as c);";
	$result = mysql_query($query);
 ?>

<table align="center" border="1">
  <tr>
    <td>City</td>
    <td>Province</td>
    <td>Number of Staff</td>
  </tr>
  <?php 
    while ($subject = mysql_fetch_assoc($result)) {
  ?>
  <tr>
    <td><?php  echo $subject["tCity"];?></td>
    <td><?php  echo $subject["tProvince"];?></td>
    <td><?php  echo $subject["tcnt"];?></td>
  </tr>
<?php } ?>
  <br>
</table>
<?php 
    mysql_free_result($result);  
?>

<?php } ?>
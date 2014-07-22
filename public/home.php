<div style="text-align: center;">Welcome to Hospital</div>
<div>
  <p>Enter the Information that you look for</p>

</div>



 <form action="" method="post">
          Search hospital member directory by name: <input type="text" name="name"><br>
          <input type="submit">
 </form>



<?php
if(isset($_POST["name"])){
$psin = $_POST["name"];
$drawtable = true;

if($psin!=""){
 $result = mysql_query("SELECT DISTINCT * FROM staff where staff.name LIKE '%$psin%'");
 while($subject = mysql_fetch_assoc($result)){
 		 	if($drawtable){
 				$drawtable = false;
?>
		 		<table align="center" border="1">
		          <tr>
		          <td>Type of Member</td>
		          <td>Health ID</td>
		          <td>Name</td>
		          <td>Phone Number</td>
		          <td>Address</td>
		          <td>City</td>
		          <td>Postal Code</td>
		          <td>Province</td>
		          </tr>


			    <?php
			 	}
			    ?>

          <tr>
          <td><?php echo "Staff Member<br/>";?></td>
          <td><?php  echo "n/a<br/>";?></td>
          <td><?php  echo $subject["name"]."<br/>";?></td>
          <td><?php  echo $subject["phonenum"]."<br/>";?></td>
          <td><?php  echo $subject["address"]."<br/>";?></td>
          <td><?php  echo $subject["city"]."<br/>";?></td>
          <td><?php  echo $subject["postal_code"]."<br/>";?></td>
          <td><?php  echo $subject["province"]."<br/>";?></td>  

          </tr>
        
    <?php
	}

	mysql_free_result($result); 
	?>


<?php
 $result = mysql_query("SELECT DISTINCT * FROM patient where patient.name LIKE '%$psin%'");
 while($subject = mysql_fetch_assoc($result)){
 		 	if($drawtable){
 				$drawtable = false;
 				?>
		 		<table align="center" border="1">
		          <tr>
		          <td>Type of Member</td>
		          <td>Health ID</td>
		          <td>Name</td>
		          <td>Specialty</td>
		          <td>Address</td>
		          <td>City</td>
		          <td>Postal Code</td>
		          <td>Province</td>
		          </tr>


			    <?php
			 	}
			    ?>

          <tr>
          <td><?php echo "Patient<br/>";?></td>
          <td><?php  echo $subject["healthid"]."<br/>";?></td>
          <td><?php  echo $subject["name"]."<br/>";?></td>
          <td><?php  echo $subject["phonenum"]."<br/>";?></td>
          <td><?php  echo $subject["address"]."<br/>";?></td>
          <td><?php  echo $subject["city"]."<br/>";?></td>
          <td><?php  echo $subject["postal_code"]."<br/>";?></td>
          <td><?php  echo $subject["province"]."<br/>";?></td>  

          </tr>
        
    <?php
    	}
	}
	
}
	?>
</table>

<?php
if(isset($_POST["name"]) === true){
	if($drawtable){
		echo "No results were found<br/><br/>";
	}
}
?>


 <form action="" method="post">
          Find patients requiring specific procedures by procedure ID: <input type="text" name="hid"><br>
          <input type="submit">
 </form>



<?php
$drawanothertable = true;
if(isset($_POST["hid"]) && is_numeric($_POST["hid"])){
$hid = $_POST["hid"];
$drawanothertable = true;

 $resulto = mysql_query("SELECT P.healthid, P.name, PR.proid, PR.description FROM patient P, procedures PR where PR.proid = $hid AND P.healthid = PR.healthid");
 while($subject = mysql_fetch_assoc($resulto)){
 		 	if($drawanothertable){
 				$drawanothertable = false;
 				?>
		 		<table align="center" border="1">
		          <tr>
		          <td>Procedure ID</td>
		          <td>Procedure Name</td>
		          <td>Health ID</td>
		          <td>Name</td>
		          </tr>


			    <?php
			 	}
			    ?>

          <tr>
          <td><?php  echo $subject["proid"]."<br/>";?></td> 
          <td><?php  echo $subject["description"]."<br/>";?></td> 	
          <td><?php  echo $subject["healthid"]."<br/>";?></td> 
          <td><?php  echo $subject["name"]."<br/>";?></td> 

          </tr>
        
    <?php
    	
	}
		
	mysql_free_result($resulto);


}
	?>
</table>

<?php
if(isset($_POST["hid"]) === true){
	if($drawanothertable){
		echo "No results were found<br/><br/>";
	}
}
?>


 <form action="" method="post">
          Enter a city name to find the number of rooms in each hospital within: <input type="text" name="city"><br>
          <input type="submit">
 </form>




<?php
if(isset($_POST["city"])){
$cityid = $_POST["city"];
$drawantable = true;
 $result = mysql_query("SELECT R.name,count(*),R.city FROM room R where R.city LIKE '%$cityid%' GROUP BY R.name");
 while($subject = mysql_fetch_assoc($result)){
 		 	if($drawantable){
 				$drawantable = false;
 				?>
		 		<table align="center" border="1">
		          <tr>
		          <td>Number of rooms</td>
		          <td>Hospital</td>
		          <td>City</td>
		          </tr>


			    <?php
			 	}
			    ?>

          <tr>

          <td><?php  echo $subject["count(*)"]."<br/>";?></td>
          <td><?php  echo $subject["name"]."<br/>";?></td>
          <td><?php  echo $subject["city"]."<br/>";?></td>
          </tr>
        
    <?php
    	
	}
		
	mysql_free_result($result);
}
	?>
</table>

<?php
if(isset($_POST["city"])===true){
	if($drawantable){
		echo "No results were found in $cityid<br/><br/>";
	}
}
?>
<a href="javascript:history.go(-1)">Back</a>


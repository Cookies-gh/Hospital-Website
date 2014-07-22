<!-- login into MySQL database -->
<?php 
$dbhost="localhost";
$dbuser="root";
$dbpass="root";
$dbname="hospital";
mysql_connect($dbhost, $dbuser, $dbpass, $dbname);
 if (mysql_error()) {
  die(
    "Database connection failed:".
    mysql_error().
    "(" . mysql_error() . ")"
    );
 }
 mysql_select_db("hospital");
  ?>
  
 <!-- Template for GUI.  This provides GUI for the website and gives selected page with GUI to user. 
 GUI is from bootstrap builder and uses those files. --> 
  
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    

    <title>Starter Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="public/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="public/css/starter-template.css" rel="stylesheet">

  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="?page=home">Hospital</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav"> <!-- Provides links above -->
            <li <?php if(!isset($_GET["page"]) || $_GET["page"]=="home") echo 'class="active"'; ?>><a href="?page=home">Home</a></li>
			<li <?php if(isset($_GET["page"]) && $_GET["page"]=="hospital") echo 'class="active"'; ?>><a href="?page=hospital">Hospitals</a></li>
            <li <?php if(isset($_GET["page"]) && $_GET["page"]=="staff") echo 'class="active"'; ?>><a href="?page=staff">General Staff</a></li>
            <li <?php if(isset($_GET["page"]) && $_GET["page"]=="patient") echo 'class="active"'; ?>><a href="?page=patient">Patient</a></li>
            <li <?php if(isset($_GET["page"]) && $_GET["page"]=="physician") echo 'class="active"'; ?>><a href="?page=physician">Physician</a></li>
            <li <?php if(isset($_GET["page"]) && $_GET["page"]=="register") echo 'class="active"'; ?>><a href="?page=register">Register</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

    <div class="container">

      <div class="starter-template">
        <?php //Grabs PHP file for certain requests from where user is nagivating
        if (isset($_GET["page"]) && $_GET["page"]=="physician" )
          {include_once("public/physician.php");}
        elseif (isset($_GET["page"]) && $_GET["page"]=="staff")
          {include_once("public/staff.php");}
        elseif (isset($_GET["page"]) && $_GET["page"]=="patient")
          {include_once("public/patient.php");}
        elseif (isset($_GET["page"]) && $_GET["page"]=="register")
          {include_once("public/register.php");}
		elseif (isset($_GET["page"]) && $_GET["page"]=="hospital")
          {include_once("public/hospital.php");}
		elseif (isset($_GET["page"]) && $_GET["page"]=="pedit")
          {include_once("public/pedit.php");}
		elseif (isset($_GET["page"]) && $_GET["page"]=="pappointments")
          {include_once("public/pappointments.php");}
		elseif (isset($_GET["page"]) && $_GET["page"]=="roomstay")
          {include_once("public/roomstay.php");}
		elseif (isset($_GET["page"]) && $_GET["page"]=="room")
          {include_once("public/room.php");}
        else
          {include_once("public/home.php");}
        ?>
      </div>

    </div><!-- /.container -->
  </body>
</html>

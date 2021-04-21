<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
</script>

<link rel="stylesheet" type="text/css" href="css/MySavingAppOther.css">

<meta charset="ISO-8859-1">

<title>MySavingApp</title>
</head>
<body>

	<section id="body">
		<section id = "meny">

        	<div class="home">
        	<a href="http://localhost:8080/SavingAppWebProject/home.jsp" id="home"><img src="https://i.postimg.cc/QC7MrG23/Sk-rmavbild-2021-04-20-kl-23-00-10.jpg" ></a>
        	</div>
        	<div class="savingschedules">
        	<a href="http://localhost:8080/SavingAppWebProject/home.jsp" id="savingschedules"><img src="https://i.postimg.cc/SQf5Dt22/Sk-rmavbild-2021-04-20-kl-23-00-10-1.jpg" ></a>
        	</div>
        	<div class="new">
			<a href="http://localhost:8080/SavingAppWebProject/new.jsp" id="new"><img src="https://i.postimg.cc/Prf7czY6/Sk-rmavbild-2021-04-20-kl-23-00-10-2.jpg" ></a>
        	</div>
        	<div class="settings">
			<a href="http://localhost:8080/SavingAppWebProject/settings.jsp" id="settings"><img src="https://i.postimg.cc/kgzhB0ZZ/Sk-rmavbild-2021-04-20-kl-23-00-10-3.jpg" ></a>
        	</div>
      	</section>
      	
      	<div class="header">
     		<p>What do you dream about?</p>
     	</div>
     	<section id="underheader">
     		<p>Make a saving schedule to achieve your dreams</p>
     	</section>
     		
     	<section id = "mainbodyNew">
			<div class="newBox">
			
			<br>
			<div class="textBoxStyle">
			<p>Saving schedule name</p>
			<input type="text" name="savingScheduleNameTextBox" id="savingScheduleNameTextBox" value="">
			</div>
			<br>
			<div class="textBoxStyle">
			<p>Saving goal</p>
			<input type="text" name="savingGoalTextBox" id="savingGoalTextBox" value="">
			</div>
			<br>
			<div class="textBoxStyle">
			<p>Saving duration</p>
			<input type="text" name="savingDurationTextBox" id="savingDurationTextBox" value="">
			</div>
			<br><br><br>
			<section id="buttonSettings">
			<input type="button" name="submitBtn" value="Make a saving schedule" id="saveSavingSchedule">
			</section>
			
			
			</div>
		</section>
			
	</section>


	<footer> 
        <section id = "footer">
        	<div class="leftdiv">
        	<br>
        	© 2021 MySavingApp Company
        	</div>
        	<div class="leftcenterdiv">
        	<br>
        	<b>Contact</b>
			<br><br>
        	<p>contact@mySavingApp.com</p>
        	<p>Stora Tomegatan 32B</p>
        	<p>223 51, Lund</p>
        	</div>
        	<div class="rightcenterdiv">
        	<br>
        	<b>Social</b>
			<br><br>
        	<p>Facebook</p>
        	<p>LinkedIn</p>
        	<p>Instagram</p>
        	</div>
        	<div class="rightdiv">
        	<br>
        	<b>About</b>
			<br><br>
        	<p>Our story</p>
        	</div>
      	</section> 
	</footer>   
	
</body>
</html>
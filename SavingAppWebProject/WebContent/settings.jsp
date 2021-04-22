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
        	<a href="http://localhost:8080/SavingAppWebProject/savingschedules.jsp" id="savingschedules"><img src="https://i.postimg.cc/SQf5Dt22/Sk-rmavbild-2021-04-20-kl-23-00-10-1.jpg" ></a>
        	</div>
        	<div class="new">
			<a href="http://localhost:8080/SavingAppWebProject/new.jsp" id="new"><img src="https://i.postimg.cc/Prf7czY6/Sk-rmavbild-2021-04-20-kl-23-00-10-2.jpg" onmouseover="this.src='https://i.postimg.cc/V6qM52hB/Namnl-s-2.jpg'" onmouseout="this.src='https://i.postimg.cc/Prf7czY6/Sk-rmavbild-2021-04-20-kl-23-00-10-2.jpg'"/></a>
        	</div>
        	<div class="settings">
			<a href="http://localhost:8080/SavingAppWebProject/settings.jsp" id="settings"><img src="https://i.postimg.cc/QMc2wPc2/Sk-rmavbild-2021-04-20-kl-23-00-10-5.jpg" ></a>
        	</div>
      	</section>
      	  	
      	    <div class="header">
     		<p>User settings</p>
     		</div>
     	
		<section id = "mainbodySettings">
     	
			<div class="settingsBox">
			<br>
			<div class="textBoxStyle">
			<p>Username</p>
			<input type="text" name="usernameTextBox" id="usernameTextBox" value="">
			</div>
			<br>
			<div class="textBoxStyle">
			<p>First name</p>
			<input type="text" name="firstnameTextBox" id="firstnameTextBox" value="">
			</div>
			<br>
			<div class="textBoxStyle">
			<p>Surname</p>
			<input type="text" name="surnameTextBox" id="surnameTextBox" value="">
			</div>
			<br>
			<div class="textBoxStyle">
			<p>Income</p>
			<input type="text" name="incomeTextBox" id="incomeTextBox" value="">
			</div>
			<br>
			<div class="textBoxStyle">
			<p>Fixed cost</p>
			<input type="text" name="fixedCostTextBox" id="fixedCostTextBox" value="">
			</div>
			<br>
			<div class="textBoxStyle">
			<p>Variable cost</p>
			<input type="text" name="variableCostTextBox" id="variableCostTextBox" value="">
			</div>
			<br><br><br>
			<section id="buttonSettings">
			<input type="button" name="submitBtn" value="Save settings" id="saveUserSettings">
			<input type="button" name="submitBtn" value="Delete user" id="deleteUser">
			</section>
			</div>
			
			
			
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

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script

	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">

</script>

<link rel="stylesheet" type="text/css" href="css/MySavingApp.css">

<meta charset="ISO-8859-1">


<title>MySavingApp</title>
</head>
<body>

	<section id="body">

			<h1>
				<p>Welcome to MySavingApp</p>
			</h1>
			
		<section id = "underHeader">
			<h2>
				<p>Achieve your dreams</p>
			</h2>
		</section>

		<section id="logInBox">
			<aside id="logInBox">
				<div class="login">
					<form action ="/SavingAppWebProject/SavingAppControllerServlet" method="get" accept-charset=utf-8> 
					<input type="text" name="userNameTextField" id="userNameTextField" value="Username"><br>
					<input name="username" id="username" value="" type = "hidden">
					<p></p>
					<p></p> 
					<input type="submit" name="submit" value="Log in"> 
					<input name="operation"  value="findAccount"  type="hidden">
					</form>
				</div>
				<div class="create"> 
				<input type="button" name="submitBtn" value="Register" id="CreateBtn">
				</div>
			</aside>
		</section>
		
	</section>
			
    <footer> 
        <section id = "footer">
        	<div class="leftdiv">
        	© 2021 MySavingApp Company
        	</div>
        	<div class="leftcenterdiv">
	        	<b>Contact</b>
	        	<p> </p>
	        	<p></p>
	        	<p>contact@mySavingApp.com</p>
	        	<p>Stora Tomegatan 32B</p>
	        	<p>223 51, Lund</p>
        	</div>
        	<div class="rightcenterdiv">
	        	<b>Social</b>
	        	<p> </p>
	        	<p></p>
	        	<p>Facebook</p>
	        	<p>LinkedIn</p>
	        	<p>Instagram</p>
        	</div>
        	<div class="rightdiv">
	        	<b>About</b>
	        	<p></p>
	        	<p></p>
	        	<p>Our story</p>
        	</div>
      	</section> 
	</footer>	
<script>

</script>
</body>
</html>
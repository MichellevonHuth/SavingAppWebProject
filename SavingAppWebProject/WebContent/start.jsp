
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
		

		
			<div class="logInBox">
				
					<form action ="/SavingAppWebProject/SavingAppControllerServlet" method="get" accept-charset=utf-8> 
						<input type="text" name="userNameTextField" id="userNameTextField" value="Username"><br>
						<br><br> 
						<input type="submit" name="submit" value="Log in" id="findBtn"> 
						<input name="operation"  value="findAccount"  type="hidden">
					</form>
					<br><br>
					<a href="/SavingAppWebProject/register.jsp">
					<input type="button" name="submitBtn" value="Register" id="createBtn">
					</a>
				
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
<script>

</script>
</body>
</html>
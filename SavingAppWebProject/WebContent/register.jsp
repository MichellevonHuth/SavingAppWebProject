<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
</script>

<script src="js/SavingApp.js"></script>

<link rel="stylesheet" type="text/css" href="css/MySavingAppOther.css">

<meta charset="ISO-8859-1">

<title>MySavingApp</title>
</head>
<body>
  <header> 
  		<img src ="https://i.postimg.cc/7YJC3N9j/MY-SAVING-APP.png"  width="120" height="120"><br><br>
  </header>    	  	
    	<div class="header">
     		<p>Register new user</p>
     	</div>
     	
     	<%String error =(String)request.getSession().getAttribute("errorMessage");
			if(error==null){
			error = "";
		}%>
		<section id = "mainbodySettings">
     		<form action ="/SavingAppWebProject/SavingAppControllerServlet" method="post" accept-charset=utf-8 onsubmit="return checkRegisterFields()"> 
				<div class="settingsBox"><br>
					<div class="textBoxStyle">
						<p>Username *</p>	
						<input type="text" name="usernameTextBox" id="usernameTextBox" value="">
					</div><br>
					<div class="textBoxStyle">
						<p>First name *</p>
						<input type="text" name="firstnameTextBox" id="firstnameTextBox" value="">
					</div><br>
					<div class="textBoxStyle">
						<p>Surname *</p>
						<input type="text" name="surnameTextBox" id="surnameTextBox" value="">
					</div><br>
					<div class="textBoxStyle">
						<p>Income (SEK) *</p>
						<input type="text" name="incomeTextBox" id="incomeTextBox" value="">
					</div><br>
					<div class="textBoxStyle">
						<p>Fixed cost (SEK) *</p>
						<input type="text" name="fixedCostTextBox" id="fixedCostTextBox" value="">
					</div><br>
					<div class="textBoxStyle">
						<p>Variable cost (SEK) *</p>
						<input type="text" name="variableCostTextBox" id="variableCostTextBox" value="">
					</div>
					
					<br><br>
					<section id="buttonSettings">
						<input type="submit" name="submit" value="Register" id="registerBtn"> 
						<input name="operation"  value="addAccount"  type="hidden">
					</section>
					<p id = "errorLbl"><%=error%></p>
				</div>	
			</form>		
		</section>	
    <footer> 
        <section id = "footer">
        	<div class="leftdiv"><br>
        		© 2021 MySavingApp Company
        	</div>
        	<div class="leftcenterdiv">
        		<br><b>Contact</b><br><br>
        		<p>contact@mySavingApp.com</p>
        		<p>Stora Tomegatan 32B</p>
        		<p>223 51, Lund</p>
        	</div>
        	<div class="rightcenterdiv"><br>
        		<b>Social</b><br><br>
        		<p>Facebook</p>
        		<p>LinkedIn</p>
        		<p>Instagram</p>
        	</div>
        	<div class="rightdiv"><br>
        		<b>About</b><br><br>
        		<p>Our story</p>
        	</div>
      	</section> 
	</footer>   

</body>
</html>
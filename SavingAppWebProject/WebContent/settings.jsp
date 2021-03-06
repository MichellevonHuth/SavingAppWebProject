<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="org.ics.ejb.Account" %>
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
		 
		 <%String error =(String)request.getSession().getAttribute("errorMessage");
			if(error==null){
			error = "";
			}%>
		<%String message =(String)request.getSession().getAttribute("message");
			if(message==null){
			message = "";
			}%>	
			
		<%Account account = (Account)request.getSession().getAttribute("account");%>
		
		<input name="username" id="username" value="" type = "hidden">
	
	        <section id = "meny">
	        	<div class="home">
	        		<a href="http://localhost:8080/SavingAppWebProject/home.jsp" id="home"><img src="https://i.postimg.cc/QC7MrG23/Sk-rmavbild-2021-04-20-kl-23-00-10.jpg" onmouseover="this.src='https://i.postimg.cc/0jxzf6tc/Sk-rmavbild-2021-04-20-kl-23-00-10-7.jpg'" onmouseout="this.src='https://i.postimg.cc/QC7MrG23/Sk-rmavbild-2021-04-20-kl-23-00-10.jpg'"/></a>
	        	</div>
	        	<div class="savingschedules">
	        		<a href="SavingAppControllerServlet?operation=getSavingSchedules" id="savingschedules"><img src="https://i.postimg.cc/SQf5Dt22/Sk-rmavbild-2021-04-20-kl-23-00-10-1.jpg" onmouseover="this.src='https://i.postimg.cc/bvXzcSSN/Sk-rmavbild-2021-04-20-kl-23-00-10-1-6.jpg'" onmouseout="this.src='https://i.postimg.cc/SQf5Dt22/Sk-rmavbild-2021-04-20-kl-23-00-10-1.jpg'"/></a>
	        	</div>
	        	<div class="new">
	        		<form action="/SavingAppWebProject/SavingAppControllerServlet" method="get">
						 <input type=image src="https://i.postimg.cc/Prf7czY6/Sk-rmavbild-2021-04-20-kl-23-00-10-2.jpg" onmouseover="this.src='https://i.postimg.cc/pTmcn7nX/Namnl-s-7.jpg'" onmouseout="this.src='https://i.postimg.cc/Prf7czY6/Sk-rmavbild-2021-04-20-kl-23-00-10-2.jpg'"/>
	        		     <input name="operation" value="toNew" type="hidden">
	        		</form>
	        	</div>
	        	<div class="settings">   	
	        	    <form action="/SavingAppWebProject/SavingAppControllerServlet" method="get">
						<input type=image src="https://i.postimg.cc/QMc2wPc2/Sk-rmavbild-2021-04-20-kl-23-00-10-5.jpg">
	        			<input name="operation" value="toSettings" type="hidden">
	        		</form>
	        	</div>
	      	</section>
	 </header>  	  	
      	    
	<div class="header">
		<p>User settings</p>
	</div>

	<br>
	
	<section id = "mainbodySettings">
		<form action ="/SavingAppWebProject/SavingAppControllerServlet" method="get" accept-charset=utf-8 onsubmit="return checkRegisterFields()">
			<div class="settingsBox">
				<br>
				<div class="textBoxStyle">
					<p>Username *</p>
					<input type="text" name="usernameTextBox" id="usernameTextBox" value="<%=account.getUsername()%>" disabled>	
				</div>
				<br>
				<div class="textBoxStyle">
					<p>First name *</p>
					<input type="text" name="firstnameTextBox" id="firstnameTextBox" value="<%=account.getFirstName()%>">
				</div>
				<br>
				<div class="textBoxStyle">
					<p>Surname *</p>
					<input type="text" name="surnameTextBox" id="surnameTextBox" value="<%=account.getSurname()%>">
				</div>
				<br>
				<div class="textBoxStyle">
					<p>Income (SEK) *</p>
					<input type="text" name="incomeTextBox" id="incomeTextBox" value="<%=account.getTotalIncome()%>">
				</div>
				<br>
				<div class="textBoxStyle">
					<p>Fixed cost (SEK) *</p>
					<input type="text" name="fixedCostTextBox" id="fixedCostTextBox" value="<%=account.getFixedCost()%>">
				</div>
				<br>
				<div class="textBoxStyle">
					<p>Variable cost (SEK) *</p>
					<input type="text" name="variableCostTextBox" id="variableCostTextBox" value="<%=account.getVariableCost()%>">
				</div>
				<br><br><br>
			
				<section id="buttonSettings">
					<input type="submit"  name="operation" value="Delete user" id="deleteUserBtn">
					<input value="deleteAccount" type = "hidden">	
					<input type="submit"  name="operation" value="Save changes" id="saveUserSettingsBtn"> 
					<input value="updateAccount" type = "hidden">									
					<a href="/SavingAppWebProject/start.jsp">
					<input type="button" name="submitBtn" value="Log out" id="logOut">
					</a>			 
				</section>				 		

				<p id = "errorLbl"><%=error%></p>
				<p id = "messageLbl"><%=message%></p>	
			</div>
		</form>		
	</section>
	
			
	<footer> 
        <section id = "footer">
        	<div class="leftdiv"><br>
        		? 2021 MySavingApp Company
        	</div>
        	<div class="leftcenterdiv"><br>
        		<b>Contact</b><br><br>
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
				<p><a href="http://localhost:8080/SavingAppWebProject/about.jsp" id="codeLink">Our story</a></p>
        		<p><a href="http://localhost:8080/SavingAppWebProject/test.jsp" id="codeLink">Test our code</a></p>
        	</div>
      	</section> 
	</footer>   

</body>
</html>
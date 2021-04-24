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

<link rel="stylesheet" type="text/css" href="css/MySavingAppOther.css">

<meta charset="ISO-8859-1">

<title>MySavingApp</title>
</head>
<body>
<input name="username" id="username" value="" type = "hidden">
	<section id="body">
        <section id = "meny">

        	<div class="home">
        	<a href="http://localhost:8080/SavingAppWebProject/home.jsp" id="home"><img src="https://i.postimg.cc/QC7MrG23/Sk-rmavbild-2021-04-20-kl-23-00-10.jpg" onmouseover="this.src='https://i.postimg.cc/0jxzf6tc/Sk-rmavbild-2021-04-20-kl-23-00-10-7.jpg'" onmouseout="this.src='https://i.postimg.cc/QC7MrG23/Sk-rmavbild-2021-04-20-kl-23-00-10.jpg'"/></a>
        	</div>
        	<div class="savingschedules">
        	<a href="SavingAppControllerServlet?operation=getSavingSchedules" id="savingschedules"><img src="https://i.postimg.cc/SQf5Dt22/Sk-rmavbild-2021-04-20-kl-23-00-10-1.jpg" onmouseover="this.src='https://i.postimg.cc/bvXzcSSN/Sk-rmavbild-2021-04-20-kl-23-00-10-1-6.jpg'" onmouseout="this.src='https://i.postimg.cc/SQf5Dt22/Sk-rmavbild-2021-04-20-kl-23-00-10-1.jpg'"/></a>
        	</div>
        	<div class="new">
			<a href="http://localhost:8080/SavingAppWebProject/new.jsp" id="new"><img src="https://i.postimg.cc/Prf7czY6/Sk-rmavbild-2021-04-20-kl-23-00-10-2.jpg" onmouseover="this.src='https://i.postimg.cc/pTmcn7nX/Namnl-s-7.jpg'" onmouseout="this.src='https://i.postimg.cc/Prf7czY6/Sk-rmavbild-2021-04-20-kl-23-00-10-2.jpg'"/></a>
        	</div>
        	<div class="settings">
			<a href="http://localhost:8080/SavingAppWebProject/settings.jsp" id="settings"><img src="https://i.postimg.cc/QMc2wPc2/Sk-rmavbild-2021-04-20-kl-23-00-10-5.jpg" ></a>
        	</div>
      	</section>
     	  	
      	    <div class="header">
     		<p>User settings</p>
     		</div>
		<section id = "mainbodySettings">
		 <form action ="/SavingAppWebProject/SavingAppControllerServlet" method="get" accept-charset=utf-8>
		  
			
			<div class="settingsBox">
			<br>
			<div class="textBoxStyle">
				
				<%String username = (String)request.getSession().getAttribute("getUsername");%>
				<%String firstname = (String)request.getSession().getAttribute("getFirstname");%>
				<%String surname = (String)request.getSession().getAttribute("getSurname");%>
				<%String totalIncome = (String)request.getSession().getAttribute("getTotalIncome");%>
				<%String variableCost = (String)request.getSession().getAttribute("getVariableCost");%>
				<%String fixedCost = (String)request.getSession().getAttribute("getFixedCost");%>
				<p>Username </p>
				<label><b> <%=username%></b></label>
			
			</div>
			<br>
			<div class="textBoxStyle">
				<p>First name</p>
				<input type="text" name="firstnameTextBox" id="firstnameTextBox" value="<%=firstname%>">
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
				 <input type="submit"  name="operation" value="Save changes"> 
						<input value="updateAccount" type = "hidden">

			<input type="submit"  name="operation" value="Delete user">
						<input value="deleteAccount" type = "hidden">
						 
			</section>
			</div>
			</form>
			
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

$(function () {
	var x = document.getElementById("username").value;
	console.log(x);
	
});
</script>
</body>
</html>
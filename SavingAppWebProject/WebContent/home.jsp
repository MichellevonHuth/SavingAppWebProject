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

	<header>
		<img src ="https://i.postimg.cc/7YJC3N9j/MY-SAVING-APP.png"  width="120" height="120"><br><br>
        <section id = "meny">
        	<div class="home">
        		<a href="http://localhost:8080/SavingAppWebProject/home.jsp" id="home"><img src="https://i.postimg.cc/BQxwqDjF/Sk-rmavbild-2021-04-20-kl-23-00-10-4.jpg" ></a>
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
					<input type=image src="https://i.postimg.cc/kgzhB0ZZ/Sk-rmavbild-2021-04-20-kl-23-00-10-3.jpg" onmouseover="this.src='https://i.postimg.cc/Hkdk9N9j/Sk-rmavbild-2021-04-20-kl-23-00-10-3-1.jpg'" onmouseout="this.src='https://i.postimg.cc/kgzhB0ZZ/Sk-rmavbild-2021-04-20-kl-23-00-10-3.jpg'"/>
        			<input name="operation" value="toSettings" type="hidden">
        		</form>
        	</div>
      	</section>     	
	</header>
	
      	<%Account account = (Account)request.getSession().getAttribute("account");%>
      	<div class="welcomeHeader">
			<p>Hello  <%=account.getFirstName()%>!</p>
		</div>
		<section id = "mainbody">
			<div class="welcomeBox">	
				We are so happy to see you. Here you can see your saving goals that you want to reach and check them out so that you can keep track that you are following your saving schedules so you can achieve your dreams. Or even better - you can register new goals to always challenge yourself.				
			</div>
		</section>
		
	<footer> 
        <section id = "footer">
        	<div class="leftdiv"><br>
        		?? 2021 MySavingApp Company
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
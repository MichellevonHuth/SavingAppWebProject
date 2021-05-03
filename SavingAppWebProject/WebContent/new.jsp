<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
</script>

<script src="js/SavingApp.js"></script>


<link rel="stylesheet" type="text/css" href="css/MySavingAppOther.css">

<meta charset=ISO-8859-1>

<title>MySavingApp</title>
</head>
<body>
<header>
<img src ="https://i.postimg.cc/7YJC3N9j/MY-SAVING-APP.png"  width="120" height="120"><br><br>
 
 	<%String error =(String)request.getSession().getAttribute("errorMessage");
	if(error==null){
	error = "";
	}%>
		<section id = "meny">
		<input name="username" id="username" value="" type = "hidden">
        	<div class="home">
        	<a href="http://localhost:8080/SavingAppWebProject/home.jsp" id="home"><img src="https://i.postimg.cc/QC7MrG23/Sk-rmavbild-2021-04-20-kl-23-00-10.jpg" onmouseover="this.src='https://i.postimg.cc/0jxzf6tc/Sk-rmavbild-2021-04-20-kl-23-00-10-7.jpg'" onmouseout="this.src='https://i.postimg.cc/QC7MrG23/Sk-rmavbild-2021-04-20-kl-23-00-10.jpg'"/></a>
        	</div>
        	<div class="savingschedules">
        	<a href="SavingAppControllerServlet?operation=getSavingSchedules" id="savingschedules"><img src="https://i.postimg.cc/SQf5Dt22/Sk-rmavbild-2021-04-20-kl-23-00-10-1.jpg" onmouseover="this.src='https://i.postimg.cc/bvXzcSSN/Sk-rmavbild-2021-04-20-kl-23-00-10-1-6.jpg'" onmouseout="this.src='https://i.postimg.cc/SQf5Dt22/Sk-rmavbild-2021-04-20-kl-23-00-10-1.jpg'"/></a>
        	</div>
        	<div class="new">
			<a href="http://localhost:8080/SavingAppWebProject/new.jsp" id="new"><img src="https://i.postimg.cc/B6VBgZX4/Sk-rmavbild-2021-04-20-kl-23-00-10-2-1.jpg" ></a>
        	</div>
        	<div class="settings">
			<a href="http://localhost:8080/SavingAppWebProject/settings.jsp" id="settings"><img src="https://i.postimg.cc/kgzhB0ZZ/Sk-rmavbild-2021-04-20-kl-23-00-10-3.jpg" onmouseover="this.src='https://i.postimg.cc/Hkdk9N9j/Sk-rmavbild-2021-04-20-kl-23-00-10-3-1.jpg'" onmouseout="this.src='https://i.postimg.cc/kgzhB0ZZ/Sk-rmavbild-2021-04-20-kl-23-00-10-3.jpg'"/></a>
        	</div>
      	</section>
</header>      	
      	<div class="header">
     		<p>What do you dream about?</p>
     	</div>
     	<section id="underheader">
     		<p>Make a saving schedule to achieve your dreams</p>
     	</section>
     
     	<section id = "mainbodyNew">
     	
			<div class="newBox">
			<form action ="/SavingAppWebProject/SavingAppControllerServlet" method="get" accept-charset=utf-8 onsubmit="return checkGoal()">
			
			<br>
			<div class="textBoxStyle">
			<p>Saving schedule name *</p>
			<input type="text" name="savingScheduleNameTextBox" id="savingScheduleNameTextBox" value="">
			</div>
			<br>
			<div class="textBoxStyle">
			<p>Saving goal (SEK) *</p>
			<input type="text" name="savingGoalTextBox" id="savingGoalTextBox" value="">
			</div>
			<br>
			<div class="textBoxStyle">
			<p>Saving duration year (Number) *</p>
			<input type="text" name="savingDurationYearTextBox" id="savingDurationYearTextBox" value="">
			</div>
			<br>
			<div class="textBoxStyle">
			<p>Saving duration month (Number) *</p>
			<input type="text" name="savingDurationMonthTextBox" id="savingDurationMonthTextBox" value="">
			</div>
			<br><br><br>
			<section id="buttonSettings">
			<input type="submit" name="submit" value="Make a saving schedule" id="saveSavingScheduleBtn"> 
			<input name="operation"  value="createAnSavingSchedule"  type="hidden">		
			</section>
			<p id = "errorLbl"><%=error%></p>
			</form>		
			</div>
					
		</section>

	<footer> 
        <section id = "footer">
        	<div class="leftdiv"><br>
        		© 2021 MySavingApp Company
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
				<a href="http://localhost:8080/SavingAppWebProject/about.jsp" id="codeLink"><p>Our story</p></a>
        		<a href="http://localhost:8080/SavingAppWebProject/test.jsp" id="codeLink"><p>Test our code</p></a>
        	</div>
      	</section> 
	</footer>  
	
</body>
</html>


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

<link rel="stylesheet" type="text/css" href="css/MySavingAppOther.css">

<meta charset=ISO-8859-1>

<title>MySavingApp</title>
</head>
<body>
<header>
	<img src ="https://i.postimg.cc/7YJC3N9j/MY-SAVING-APP.png"  width="120" height="120"><br><br>
	
	<section id="body">
		<section id = "meny">
			<input name="username" id="username" value="" type = "hidden">
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
        		<form action="/SavingAppWebProject/SavingAppControllerServlet" method="get">
					<input type=image src="https://i.postimg.cc/kgzhB0ZZ/Sk-rmavbild-2021-04-20-kl-23-00-10-3.jpg" onmouseover="this.src='https://i.postimg.cc/Hkdk9N9j/Sk-rmavbild-2021-04-20-kl-23-00-10-3-1.jpg'" onmouseout="this.src='https://i.postimg.cc/kgzhB0ZZ/Sk-rmavbild-2021-04-20-kl-23-00-10-3.jpg'"/>
        			<input name="operation" value="toSettings" type="hidden">
        		</form></div>
      	</section>
      </section>
  </header>  
    
  <section id="aboutSection">
   
		<aside id="leftdiv">
			<h3 style="font-size: 35px; font-family: Arial;">
				Our story
			</h3>
		
			<p>We are four girls who has made this app just because we want YOU to achieve your dreams. The first idea of this app came to us when we were saving for our exchange semester in Australia. Then we realized that there is no good saving apps out there... Until now! Call us dreamers if you like, but we want to help people feel good about money.
			In a world of overspending and easy credit, it is no surprise that money is the number one source of stress for millions of people.
			We created Dreams to level the playing field. To give people a better chance of achieving their goals, and a simple way to take control of their finances.</p>
		
		</aside>


		<div id="rightdiv">		
			<div id= "portraits1">
				<img src ="https://i.postimg.cc/XvL6LCjn/Ska-rmavbild-2021-04-29-kl-21-27-07-5.jpg"  width="160" height="200" style="border-radius: 10px;">
				<img src ="https://i.postimg.cc/R04zwRzP/Ska-rmavbild-2021-04-29-kl-21-27-07-3.jpg" width="160" height="200" style="border-radius: 10px;">
			</div>
		
			<div id= "portraits2">
				<img src ="https://i.postimg.cc/mgQscnKz/Ska-rmavbild-2021-04-29-kl-21-27-07-2.jpg"  width="160" height="200" style="border-radius: 10px;">
				<img src ="https://i.postimg.cc/Y9SKsC0Y/Ska-rmavbild-2021-04-29-kl-21-27-07.jpg"  width="160" height="200" style="border-radius: 10px;">	
			</div>
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
				<p><a href="http://localhost:8080/SavingAppWebProject/about.jsp" id="codeLink">Our story</a></p>
        		<p><a href="http://localhost:8080/SavingAppWebProject/test.jsp" id="codeLink">Test our code</a></p>
        	</div>
      	</section> 
	</footer> 
	
	 
</body>
</html>
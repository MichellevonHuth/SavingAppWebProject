<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.ics.ejb.SavingSchedule" %>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="css/MySavingAppOther.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
</script>



<meta charset="ISO-8859-1">

<title>MySavingApp</title>
</head>
<body>

<section id="body">
<header>
	<img src ="https://i.postimg.cc/7YJC3N9j/MY-SAVING-APP.png"  width="120" height="120"><br><br>
		<section id = "meny">

        	<div class="home">
        		<a href="http://localhost:8080/SavingAppWebProject/home.jsp" id="home"><img src="https://i.postimg.cc/QC7MrG23/Sk-rmavbild-2021-04-20-kl-23-00-10.jpg" onmouseover="this.src='https://i.postimg.cc/0jxzf6tc/Sk-rmavbild-2021-04-20-kl-23-00-10-7.jpg'" onmouseout="this.src='https://i.postimg.cc/QC7MrG23/Sk-rmavbild-2021-04-20-kl-23-00-10.jpg'"/></a>
        	</div>
        	<div class="savingschedules">
        		<a href="" id="savingschedules"><img src="https://i.postimg.cc/1zZm8DBZ/Sk-rmavbild-2021-04-20-kl-23-00-10-1-1.jpg" ></a>
        	</div>
        	<div class="new">
				<a href="http://localhost:8080/SavingAppWebProject/new.jsp" id="new"><img src="https://i.postimg.cc/Prf7czY6/Sk-rmavbild-2021-04-20-kl-23-00-10-2.jpg" onmouseover="this.src='https://i.postimg.cc/pTmcn7nX/Namnl-s-7.jpg'" onmouseout="this.src='https://i.postimg.cc/Prf7czY6/Sk-rmavbild-2021-04-20-kl-23-00-10-2.jpg'"/></a>
        	</div>
        	<div class="settings">
        	    <form action="/SavingAppWebProject/SavingAppControllerServlet" method="get">
					<input type=image src="https://i.postimg.cc/kgzhB0ZZ/Sk-rmavbild-2021-04-20-kl-23-00-10-3.jpg" onmouseover="this.src='https://i.postimg.cc/Hkdk9N9j/Sk-rmavbild-2021-04-20-kl-23-00-10-3-1.jpg'" onmouseout="this.src='https://i.postimg.cc/kgzhB0ZZ/Sk-rmavbild-2021-04-20-kl-23-00-10-3.jpg'"/>
        			<input name="operation" value="toSettings" type="hidden">
        		</form>
        	</div>
      	</section>
</header>

<div class="content">
      	<%ArrayList<SavingSchedule> s = (ArrayList<SavingSchedule>) request.getAttribute("getSavingSchedules"); %>
     
				<%if(s.isEmpty()){ %>
				<div class="errorNoSavings">
					You do not have any saving goals yet, go ahead and make one!
				</div>
				<%} %>
      	
      		<%for(int i = 0 ; i < s.size() ; i+=1) { %>
			
				<% if (i % 6 == 0) {%>
 					<div class="savingschedulecontainer1">	
 						<div class="textContainer">
			 				Name : <%=s.get(i).getSavingScheduleName()%><br>
      						Goal: <%=s.get(i).getSavingGoal()%> kr<br>
      						<%double budget = s.get(i).getBudget();%>
      						Budget: <%=Math.round(budget)%> kr each month
 						</div>
					</div>
				
				<%} else if (i % 5 == 0) {%> 		
					<div class="savingschedulecontainer2">
						<div class="textContainer">
							Name : <%=s.get(i).getSavingScheduleName()%><br>
      						Goal: <%=s.get(i).getSavingGoal()%> kr<br>
      						<%double budget = s.get(i).getBudget();%>
      						Budget: <%=Math.round(budget)%> kr each month
 						</div>
					</div>		
				<%} else if (i % 4 == 0) {%> 
					<div class="savingschedulecontainer3">
						<div class="textContainer">
							Name : <%=s.get(i).getSavingScheduleName()%><br>
      						Goal: <%=s.get(i).getSavingGoal()%> kr<br>
      						<%double budget = s.get(i).getBudget();%>
      						Budget: <%=Math.round(budget)%> kr each month 				
						</div>
					</div>
				<%} else if (i %  3 == 0) {%> 
					<div class="savingschedulecontainer4">
						<div class="textContainer">
							Name : <%=s.get(i).getSavingScheduleName()%><br>
      						Goal: <%=s.get(i).getSavingGoal()%> kr<br>
      						<%double budget = s.get(i).getBudget();%>
      						Budget: <%=Math.round(budget)%> kr each month
 						</div>
 					</div>
				<%} else if (i % 2  == 0) {%> 
					<div class="savingschedulecontainer5">
						<div class="textContainer">
							Name : <%=s.get(i).getSavingScheduleName()%><br>
      						Goal: <%=s.get(i).getSavingGoal()%> kr<br>
      						<%double budget = s.get(i).getBudget();%>
      						Budget: <%=Math.round(budget)%> kr each month
 						</div>
					</div>
				<%} else {%> 
					<div class="savingschedulecontainer6">
						<div class="textContainer">
							Name : <%=s.get(i).getSavingScheduleName()%><br>
      						Goal: <%=s.get(i).getSavingGoal()%> kr<br>
      						<%double budget = s.get(i).getBudget();%>
      						Budget: <%=Math.round(budget)%> kr each month
 						</div>
					</div>
				<%} %>		
      		<%} %>      		
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<head>
<link rel = "stylesheet" type="text/css" href="css/SavingApp.css">
<meta charset="ISO-8859-1">
<title>SavingApp</title>
</head>
<body>
	<header>
		<p>Welcome to your saving app!</p>
	</header>
	<section id="row">
	<nav>
	<ul>
	<li class="active">
	<a>menu1</a></li>
	<li><a>menu2</a></li>
	<li><a>menu3</a></li>
	</ul>
	</nav>
	
	<section id="main">
	<section id="content">
	<article>
	<fieldset id="PersonalFS">
	<legend>Create saving schedule :</legend><br>
	
	Username:*<br>
	<input type="text" name="username" id="username" value="">
	<br>
		
	Saving schedule name:*<br>
	<input type="text" name="name" id="name" value="">
	<br>
	
	Saving goal:*<br>
	<input type="text" name="goal" id="goal" value="">
	<br>
	
	Saving duration (year):<br>
	<input type="text" name="year" id="year" value="">
	<br>
	
	Saving duration (month):<br>
	<input type="text" name="month" id="month" value="">
	<br><br>

	<input type="button" name="submitBtn" value="Create" id="CreateBtn">
	<input type="button" name="submitBtn" value="Delete" id="DeleteBtn">
	<input type="button" name="submitBtn" value="Update" id="UpdateBtn">
	<input type="button" name="submitBtn" value="Log in" id="LogInBtn">
	
	</fieldset>
	</article>
	</section>
	</section>
	</section>
	<footer>
	<p>&copy; Grupp12</p>
	</footer>
 <script>
 document.getElementById("DeleteBtn").onclick = function() {
	console.log("Nu deletar en person");
	}

 $(document).ready(function(){
	alert("hej");
	
	$("#LogInBtn").click( function() { 
		var strValue = $("#username").val();
		
		if(strValue != "") {
			$.ajax({method: "DELETE",
				url: "http://localhost:8080/SavingAppWebProject/SavingAppServlet/", 
				error: ajaxDelReturnError, 
				success: ajaxDelReturnSuccess
			})
		
			
		function ajaxDelReturnSuccess(result, status, xhr) {
				$("#username").attr("placeholder", "Account has been deleted"); 
				console.log(strValue);
		}
		
		function ajaxDelReturnError(result, status, xhr) {
			alert("Error");
			console.log("Ajax-find account: "+status);
		}	
	  }
	})	
 }); 
 </script>	
</body>
</html>
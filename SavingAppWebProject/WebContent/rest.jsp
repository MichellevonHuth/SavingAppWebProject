<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/rest.css">

<title>SavingApp</title>
</head>
<body>
		<aside>

			<table id="asideTable">

				<tbody><tr>

					<th><span id="city"></span></th>

					<th><span></span></th>

					<th><span></span></th>

					<th><span id="ipNbr"></span></th>

				</tr>

				<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>

				<tr>

					<td><span id="degree"></span></td>

					<td><span id="weather"></span></td>

					<td><span></span></td>

					<td><span></span></td>

				</tr>

				<tr>

					<td colspan="4"><span id="sunrise"></span></td>

				</tr>

				<tr>

					<td colspan="4"><span id="sunset"></span></td>

				</tr>

			</tbody></table>

		</aside>

	

		<article class="dot"></article>

		<section id="CreateAccountBox"> 

			<div>

						
						<strong id="text">Create new account</strong><br>
							
						<br> <input type="text" name="username" id="username" value="" placeholder="Username:"><br>

						<br> <input type="text" name="firstName" id="firstName" value="" placeholder="First name:"> <br> 
							
						<br> <input type="text" name="surname" id="surname" value="" placeholder="Surname:"> <br> 

						<br> <input type="text" name="totalIncome" id="totalIncome" value="" placeholder="Total income:"> <br>
						
						<br> <input type="text" name="fixedCost" id="fixedCost" value="" placeholder="Fixed costs:"> <br>
						
						<br> <input type="text" name="variableCost" id="variableCost" value="" placeholder="Variable costs:"> <br>
						
						<br> <br>
						<input type="button" name="submitBtn" value="Create" id="AddBtn">				

			</div>			

		</section>

		<section id="DeleteAccountBox">
			<div>

				<strong id="text">Delete account</strong><br>
							
						<br> <input type="text" name="usernameDelete" id="usernameDelete" value="" placeholder="Username:"><br>

						<br>

						<input type="button" name="submitBtn" value="Delete" id="DeleteBtn"><br>

			</div>
		</section>
		         
			<section id="SavingScheduleBox">

				<div>

				<strong id="text">Create new saving schedule</strong><br><br>

					
						
						<br> <input type="text" name="username" id="username" value="" placeholder="Your username:"><br>

						<br> <input type="text" name="name" id="name" value="" placeholder="Saving schedule name:"><br>

					 	<br> <input type="text" name="goal" id="goal" value="" placeholder="Saving goal (SEK):"> <br> 
							
						<br> <input type="text" name="year" id="year" value="" placeholder="Saving duration (years):"> 
						<br> 
						<br> <input type="text" name="month" id="month" value="" placeholder="Saving duration (months):"> <br>
						
						<br> <br><br>
						 <input type="button" name="submitBtn" value="Create" id="AddBtnSavingSchedule">

					</div>

			</section>

			<section id="FindSavingsBox">
			<div>

				<strong id="text">Show saving schedules for:</strong><br>
							
						<br> <input type="text" name="id" id="id" value="" placeholder="Username:"><br>

						<br>

						<input type="button" name="submitBtn" value="Show" id="ShowBtn"><br>

			</div>
			</section>


			<article class="dot2">
				<article class="Container Flipped">
				<article class="Content">
				<ul>
				
					<li></li><br>
					<li>Bali - 40.0000kr</li><br>
					<li>Hallooooo - 40.0000kr</li><br>
					<li>Best - 40.0000kr</li><br>
					<li>LOL - 40.0000kr</li><br>
					<li>Australiaa - 40.0000kr</li><br>
					<li>whohooo - 40.0000kr</li>
					<li>YEEEEESSSSS - 40.0000kr</li>
					<li>YEEEEESSSSS - 40.0000kr</li>
					<li>YEEEEESSSSS - 40.0000kr</li>
					<li>Bali - 40.0000kr</li>
					<li>Hallooooo - 40.0000kr</li>
					<li>Best - 40.0000kr</li>
					<li>LOL - 40.0000kr</li>
				</ul>
			</article>
		</article>

				<input type="button" name="clearBtn" value="Clear" id="ClearBtn"><br>
			</article>

	<footer> 
        	© 2021 MySavingApp Company
   
	</footer>   

	<script>
	$(document).ready(function(){

		$.ajax({
		 method: "GET",
		 url: "http://api.ipstack.com/check?access_key=f0d0b90bbdec884d69ecc77b49fc274c",
		 error: ajaxReturn_Error,
		 success: ajaxReturn_Success

	})

	function ajaxReturn_Success(result, status, xhr) {
		ParseJsonFile(result);
	}

	function ajaxReturn_Error(result, status, xhr) {
		console.log("Ajax-find weather: "+status);

	}

	$("#ShowBtn").click(function() {
	  var strValue = $("#id").val();
	  if (strValue != "") {
		$.ajax({
		 method: "GET",
		 url: "http://localhost:8080/SavingAppWebProject/SavingAppServlet/"+strValue,
		 error: ajaxFindReturnError,
		 success: ajaxFindReturnSuccess

	})

	function ajaxFindReturnSuccess(result, status, xhr) {
		ParseJsonFileAccount(result);
	}

	function ajaxFindReturnError(result, status, xhr) {
		alert("Error");
		console.log("Ajax-find account: "+status);

	 	}

	 }

	})//btn find accounts savingschedules

	$("#AddBtn").click( function() {
		var strId = $("#username").val();
		var strFirstName = $("#firstName").val();
		var strSurname = $("#surname").val();
		var strFixedCost = $("#fixedCost").val();
		var strTotalIncome = $("#totalIncome").val();
		var strVariableCost = $("#variableCost").val();
		var obj = { id: strId, firstName: strFirstName, surname: strSurname, fixedCost: strFixedCost, totalIncome: strTotalIncome, variableCost: strVariableCost};

		var jsonString = JSON.stringify(obj);
		if (strId != "") {
			$.ajax({

				method: "POST",
				url: "http://localhost:8080/SavingAppWebProject/SavingAppServlet/",
				data: jsonString,
				dataType:'json',
				error: ajaxAddReturnError,
				success: ajaxAddReturnSuccess

	})

	function ajaxAddReturnSuccess(result, status, xhr) {
		clearFieldsCreateAccount();
		$("#username").attr("placeholder","Account added" );

	}

	function ajaxAddReturnError(result, status, xhr) {
	alert("Username already exists");
	console.log("Ajax-find account: "+status);

	}
	}
	})//btn add account 

	$("#AddBtnSavingSchedule").click( function() {
		var strId = $("#username").val();
		var strName = $("#name").val();
		var strGoal = $("#goal").val();
		var strYear = $("#year").val();
		var strMonth = $("#month").val();
		
		var budget 
		
		var obj = {username: strId, name: strName, goal: strGoal, year: strYear, month: strMonth};
		var jsonString = JSON.stringify(obj);

		if (strId != "") {
			$.ajax({

				method: "POST",
				url: "http://localhost:8080/SavingAppWebProject/SavingAppServlet",
				data: jsonString,
				dataType:'json',
				error: ajaxAddReturnError,
				success: ajaxAddReturnSuccess

	})

	function ajaxAddReturnSuccess(result, status, xhr) {
		clearFields();
		$("#id").attr("placeholder","Savingschedule added" );

	}

	function ajaxAddReturnError(result, status, xhr) {
	alert("Error Add");
	console.log("Ajax-find account: "+status);

	}

	}

	})//btn add Savingschedule

	$("#DeleteBtn").click( function() {
		var strValue = $("#usernameDelete").val();
		if (strValue != "") {
			
		$.ajax({
			method: "DELETE",
			url: "http://localhost:8080/SavingAppWebProject/SavingAppServlet/"+strValue,
			error: ajaxDelReturnError,
			success: ajaxDelReturnSuccess

	})



	function ajaxDelReturnSuccess(result, status, xhr) {
		alert("Account deleted");
		clearFieldAccountDeleted();
	
	}

	function ajaxDelReturnError(result, status, xhr) {
		alert("Error: The account you are trying to delete does not exist");
		console.log("Ajax-find account: "+status);

	}

	}

	})//Delete button account 
	});//End ready function


	function ParseJsonFileAccount(result) {
		console.log(result);
		$("<p>" + result + "</p>").insertAfter("#id");

	}

	function ParseJsonFile(result) {

	  var lat = result.latitude;
	  var long = result.longitude;
	  var city = result.city;
	  var ipNbr = result.ip

	  $("#city").text(city);
	  $("#ipNbr").text(ipNbr);
	  
	  $.ajax({
	 		method: "GET",
	 		url: "http://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+ long +"&units=metric"+ "&APPID=0aebca8155519cd776fe771d32a41872",
	  		error: ajaxWeatherReturn_Error,
	  		success: ajaxWeatherReturn_Success
	})



	function ajaxWeatherReturn_Success(result, status, xhr) {

	  var sunrise = result.sys.sunrise;
	  var sunset = result.sys.sunset;
	  var sunriseDate = new Date(sunrise*1000);
	  var timeStrSunrise = sunriseDate.toLocaleTimeString();
	  var sunsetDate = new Date(sunset*1000);
	  var timeStrSunset = sunsetDate.toLocaleTimeString();

	  $("#sunrise").text("Sunrise: "+timeStrSunrise);
	  $("#sunset").text("Sunset: "+timeStrSunset);
	  $("#weather").text(result.weather[0].main);
	  $("#degree").text(result.main.temp+" \u2103");

	}//ajaxWeatherReturn_Success



	function ajaxWeatherReturn_Error(result, status, xhr) {
		alert("Error i OpenWeaterMap Ajax");
		console.log("Ajax-find movie: "+status);
		}

	}//End of document ready

	function clearFieldsCreateAccount() {

		$("#username").val("");
		$("#firstName").val("");
		$("#surname").val("");
		$("#fixedCost").val("");
		$("#totalIncome").val("");
		$("#variableCost").val("");

	}
	
	function clearFieldAccountDeleted() {
		$("#usernameDelete").val("");
	}
	

	</script>
</body>
</html>
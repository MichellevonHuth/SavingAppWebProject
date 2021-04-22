<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
</script>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/SavingApp.css">

<!--  <script src="js/SavingApp.js"></script>   -->

<title>SavingApp</title>
</head>
<body>

	<header>

		<p>Welcome to your SavingApp :)</p>

	</header>
	
		<section id="row">

		<nav>

			<ul>

				<li class="active"><a>SavingSchedules</a></li>

				<li><a>a</a></li>

				<li><a>b</a></li>

			</ul>

		</nav> 

		<aside>

			<table id="asideTable">

				<tr>

					<th><span id="city"></span></th>

					<th><span></span></th>

					<th><span></span></th>

					<th><span id="ipNbr"></span></th>

				</tr>

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

			</table>

		</aside>
		
		<section id="main">
		
		<section id="content">
 			
				<article>
 		                      
					<fieldset id="PersonalFS">

						<legend>SavingSchedule:</legend>
						
						Nbr:<br> <input type="text" name="Nbr" id="nbr" value=""><br>
						
						Username:<br> <input type="text" name="username" id="username" value=""><br>

						Name:<br> <input type="text" name="name" id="name" value=""><br>

					 	Goal:<br> <input type="text" name="goal" id="goal" value=""> <br> 
							
						Saving duration year:<br> <input type="text" name="year" id="year" value=""> 
						<br> 
						Saving duration month :<br> <input type="text" name="month" id="month" value=""> <br>
						
						<br> 
						 <input type="button" name="submitBtn" value="add" id="AddBtnSavingSchedule">
						 <input type="button" name="submitBtn" value="Delete" id="DeleteBtnSavingSchedule"> 
						<input type="button" name="submitBtn" value="Update" id="UpdateBtnSavingSchedule"> 
					</fieldset>

				</article>
		
		<section id="main">
			
			<section id="content">
				<article>
		

					<fieldset id="PersonalFS">
						<legend>Account:</legend>
							
						Username:<br> <input type="text" name="id" id="id" value=""><br>

						First name:<br> <input type="text" name="firstName" id="firstName" value=""> <br> 
							
						Surname:<br> <input type="text" name="surname" id="surname" value=""> <br> 
						
						FixedCost:<br> <input type="text" name="fixedCost" id="fixedCost" value=""> <br>
						
						Total income:<br> <input type="text" name="totalIncome" id="totalIncome" value=""> <br>
						
						Variable cost:<br> <input type="text" name="variableCost" id="variableCost" value=""> <br>
						
						<br> 
						<input type="button" name="submitBtn" value="Log in" id="FindBtn">
						<input type="button" name="submitBtn" value="Add" id="AddBtn">
						<input type="button" name="submitBtn" value="Delete" id="DeleteBtn"> 
						<input type="button" name="submitBtn" value="Update" id="UpdateBtn">
					</fieldset>
					
				</article>
			
	
			</section>

		</section>

	</section>
	
	</section>
	</section>

	<footer>
		<p>&copy; Grupp12</p>
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

	$("#FindBtn").click(function() {
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

		var strId = $("#id").val();
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
		clearFields();
		$("#id").attr("placeholder","Account added" );

	}

	function ajaxAddReturnError(result, status, xhr) {
	alert("Error Add");
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

	$("#UpdateBtn").click( function() {

		var strId = $("#id").val();
		var strFirstName = $("#firstName").val();
		var strSurname = $("#surname").val();
		var strFixedCost = $("#fixedCost").val();
		var strTotalIncome = $("#totalIncome").val();
		var strVariableCost = $("#variableCost").val();
		
		var obj = { id: strId, firstName: strFirstName, surname: strSurname, fixedCost: strFixedCost, totalIncome: strTotalIncome, variableCost: strVariableCost};
		var jsonString = JSON.stringify(obj);

		if (strId != "") {
			$.ajax({

				method: "PUT",
				url: "http://localhost:8080/SavingAppWebProject/SavingAppServlet/"+strId,
				data: jsonString,
				dataType:'json',
				error: ajaxUpdateReturnError,
				success: ajaxUpdateReturnSuccess

	})

	function ajaxUpdateReturnSuccess(result, status, xhr) {
	clearFields();
	$("#id").attr("placeholder","Account updated" );
	}

	function ajaxUpdateReturnError(result, status, xhr) {
	alert("Error Update");
	console.log("Ajax-find account: "+status);

	}

	}

	})//Update button Account 

	$("#UpdateBtnSavingSchedule").click( function() {

		var strId = $("#nbr").val();
		var strUsername = $("#username").val();
		var strName = $("#name").val();
		var strGoal = $("#goal").val();
		var strYear = $("#year").val();
		var strMonth = $("#month").val();

		
		var obj = {nbr: strId, username: strUsername, name: strName, goal: strGoal, year: strYear, month: strMonth};
		var jsonString = JSON.stringify(obj);

		if (strId != "") {
			$.ajax({
				method: "PUT",
				url: "http://localhost:8080/SavingAppWebProject/SavingAppServlet/"+strId,
				data: jsonString,
				dataType:'json',
				error: ajaxUpdateReturnError,
				success: ajaxUpdateReturnSuccess

	})

	function ajaxUpdateReturnSuccess(result, status, xhr) {
	clearFields();
	$("#id").attr("placeholder","SavingSchedule updated" );
	}

	function ajaxUpdateReturnError(result, status, xhr) {
	alert("Error Update");
	console.log("Ajax-find savingSchedule: "+status);

	}

	}

	})//Update button Savingschedule 


	$("#DeleteBtn").click( function() {

		var strValue = $("#id").val();
		if (strValue != "") {
			
		$.ajax({
			method: "DELETE",
			url: "http://localhost:8080/SavingAppWebProject/SavingAppServlet/"+strValue,
			error: ajaxDelReturnError,
			success: ajaxDelReturnSuccess

	})



	function ajaxDelReturnSuccess(result, status, xhr) {
		clearFields();
		$("#id").attr("placeholder","Account deleted" );

	}

	function ajaxDelReturnError(result, status, xhr) {
		alert("Error");
		console.log("Ajax-find account: "+status);

	}

	}

	})//Delete button account 

	$("#DeleteBtnSavingSchedule").click( function() {
		var strValue = $("#username").val();
		if (strValue != "") {
			
		$.ajax({
			method: "DELETE",
			url: "http://localhost:8080/SavingAppWebProject/SavingAppServlet/"+strValue,
			error: ajaxDelReturnError,
			success: ajaxDelReturnSuccess

	})

	function ajaxDelReturnSuccess(result, status, xhr) {
		clearFields();
		$("#username").attr("placeholder","SavingSchedule deleted" );

	}

	function ajaxDelReturnError(result, status, xhr) {
		alert("Error");
		console.log("Ajax-find savingSchedule: "+status);

	}

	}

	})// Delete button savingschedule
	});//End ready function


	function ParseJsonFileAccount(result) {

		var number = result.number;
		var name = result.name;
		$("#id").val(result.id);
		console.log(result);
		var res = JSON.stringify(result);
		$("<br>" + res + "</br>").insertAfter("#id");

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
	 		url: "http://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+ long+"&units=metric"+ "&APPID=0aebca8155519cd776fe771d32a41872",
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

	function clearFields() {

		$("#id").val("");
		$("#firstName").val("");
		$("#surname").val("");
		$("#fixedCost").val("");
		$("#totalIncome").val("");
		$("#variableCost").val("");

	}

	</script>
 </body>
</html>
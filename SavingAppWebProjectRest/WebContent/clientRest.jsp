<%@ page language="java" contentType="text/html; charset=ISO-8859-1 accept-charset=UTF-8"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<meta charset="ISO-8859-1" accept-charset=UTF-8>
<link rel="stylesheet" type="text/css" href="css/clientRest.css">

<title>SavingApp</title>
</head>
<body>
	<header> 
		<img src ="https://i.postimg.cc/7YJC3N9j/MY-SAVING-APP.png"  width="70" height="70">
	
	</header>
		<aside>
			<table id="asideTable">
				<tbody>			
					<tr><td><span id="city"></span></td>
					<td><span id="ipNbr"></span></td>				
					</tr> 
					<tr><td></td></tr>
					<tr><td></td></tr>
					<tr><td></td></tr>
					<tr><td></td></tr>
					<tr><td></td></tr>					
					<tr><td><span id="degree"></span></td>
					<td><span id="weather"></span></td>					
					<td><span></span></td>
					<td><span></span></td>
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
				<label id ="accountAdded" class="errormessageGreen"> </label>	
				<label id = "accountError" class ="errormessageRed"> </label>	
				<br> 
				<input type="button" name="submitBtn" value="Create" id="AddBtn">
							
			</div>			
		</section>

		<section id="DeleteAccountBox">
			<div>
				<strong id="text">Delete account</strong><br>							
						<br> <input type="text" name="usernameDelete" id="usernameDelete" value="" placeholder="Username:"><br>
						<label id="delete" class ="errormessageGreen"> </label>
						<label id="errorDelete" class ="errormessageRed"> </label>
						<br>
						<input type="button" name="submitBtn" value="Delete" id="DeleteBtn"><br>
			</div>
		</section>
		         
		<section id="SavingScheduleBox">

			<div>
				<strong id="text">Create new <br> saving schedule</strong><br><br>
				<input type="text" name="usernameS" id="usernameS" value="" placeholder="Your username:"><br>
				<br> <input type="text" name="name" id="name" value="" placeholder="Saving schedule name:"><br>
				<br> <input type="text" name="goal" id="goal" value="" placeholder="Saving goal (SEK):"> <br> 
				<br> <input type="text" name="year" id="year" value="" placeholder="Saving duration (years):"> 
				<br> 
				<br> <input type="text" name="month" id="month" value="" placeholder="Saving duration (months):"> <br>
				<label id="saving" class="errormessageGreen"> </label>
				<label id="errorSaving" class="errormessageRed"> </label>
				<br> <br>
				<input type="button" name="submitBtn" value="Create" id="AddBtnSavingSchedule">
			</div>

		</section>

			<section id="FindSavingsBox">
				<div>

					<strong id="text">Show schedules:</strong><br>
					<br> <input type="text" name="findUsername" id="findUsername" value="" placeholder="Username:"><br>
					<label id="errorFind" class="errormessageRed"></label>
					<br><input type="button" name="submitBtn" value="Show" id="ShowBtn"><br>
				</div>
			</section>


			<article class="dot2">
				<article id="clear" class="Container Flipped">
					<article class="Content">
						<ul  id= "list">	
						</ul>
					</article>
				</article>
				<input type="button" name="ClearBtn" value="Clear" id="ClearBtn"><br>
			</article>

	<footer> 
		<div>
        	© 2021 MySavingApp Company
    	</div>
   
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
	
	//btn find accounts savingschedules
	$("#ShowBtn").click(function() {
		$("#errorFind").empty();
		
	  var strValue = $("#findUsername").val();
	  
	  if(strValue == ""){
		 $("#errorFind").append("Please fill in the field")
	  }
	  
	  if (strValue != "") {
		$.ajax({
		 method: "GET",
		 url: "http://localhost:8080/SavingAppWebProjectRest/Accounts/"+strValue,
		 error: ajaxFindReturnError,
		 success: ajaxFindReturnSuccess

	})

	function ajaxFindReturnSuccess(result, status, xhr) {
		ParseJsonFileAccount(result);
		clearFieldShow();
	}

	function ajaxFindReturnError(result, status, xhr) {
		$("#errorFind").append("This user doesn't exist")

	 		}
		 }
	})
	
	//clear btn
	$("#ClearBtn").click(function() {
		$('#list').empty();	
	})

	//Add account btn
	$("#AddBtn").click( function() {
		$("#accountAdded").empty();
		$("#accountError").empty();
		
		var strId = $("#username").val();
		var strFirstName = $("#firstName").val();
		var strSurname = $("#surname").val();
		var strFixedCost = $("#fixedCost").val();
		var strTotalIncome = $("#totalIncome").val();
		var strVariableCost = $("#variableCost").val();
	
		if(strId == "" ||strFirstName == "" || strSurname == "" ||strFixedCost == "" ||strTotalIncome == "" || strTotalIncome == "" ||strVariableCost == "" ){
			$("#accountError").append("Please fill in all the fields")
		}
		
		
		var obj = { id: strId, firstName: strFirstName, surname: strSurname, fixedCost: strFixedCost, totalIncome: strTotalIncome, variableCost: strVariableCost};
		var jsonString = JSON.stringify(obj);
		
		
		if (strId != "" && strFirstName != "" && strSurname != "" && strFixedCost !="" && strTotalIncome !="" && strVariableCost!= "") {
			$.ajax({

				method: "POST",
				url: "http://localhost:8080/SavingAppWebProjectRest/Accounts/",
				data: jsonString,
				dataType:'json',
				error: ajaxAddReturnError,
				success: ajaxAddReturnSuccess

	})

	function ajaxAddReturnSuccess(result, status, xhr) {
		var message = result;
		$("#accountAdded").append(result)
		clearFieldsCreateAccount();
		
		}

	function ajaxAddReturnError(result, status, xhr) {
		var message = result;
		$("#accountError").append("The user you are trying to add already exists")

			}
		}
				
	})
	
	// btn add savingSchedule
	$("#AddBtnSavingSchedule").click( function() {
		$("#errorSaving").empty();
		$("#saving").empty();
		
		var strUsername = $("#usernameS").val();
		var strName = $("#name").val();
		var strGoal = $("#goal").val();
		var strYear = $("#year").val();
		var strMonth = $("#month").val();
		
		if(strUsername == "" ||strName == "" || strGoal == "" ||strYear == "" ||strMonth == "" ){
			$("#errorSaving").append("Please fill in all the fields")
		}
		
		
		var obj = {usernameS: strUsername, name: strName, goal: strGoal, year: strYear, month: strMonth};
		var jsonString = JSON.stringify(obj);
			

		if (strUsername != "" && strName !="" && strGoal !="" && strYear !="" && strMonth !="") {
			$.ajax({

				method: "POST",
				url: "http://localhost:8080/SavingAppWebProjectRest/SavingSchedules/",
				data: jsonString,
				dataType:'json',
				error: ajaxAddReturnError,
				success: ajaxAddReturnSuccess

	})

	function ajaxAddReturnSuccess(result, status, xhr) {
		var message = result;
		$("#saving").append(result);
		clearCreateSchedule();

	}

	function ajaxAddReturnError(result, status, xhr) {
		var message = result;
		$("#errorSaving").append(result);

				}

			}
	})

	// btn delete account
	$("#DeleteBtn").click( function() {
		$("#delete").empty()
		$("#errorDelete").empty()
		
		var strValue = $("#usernameDelete").val();
		
		if(strValue == ""){
			$("#errorDelete").append("Please fill in the field")
		}
		
		else {	
		
		if (strValue != "") {
			
		$.ajax({
			method: "DELETE",
			url: "http://localhost:8080/SavingAppWebProjectRest/Accounts/"+strValue,
			error: ajaxDelReturnError,
			success: ajaxDelReturnSuccess

	})

	function ajaxDelReturnSuccess(result, status, xhr) {
		$("#delete").append("Account deleted")
		clearFieldAccountDeleted();
	
	}

	function ajaxDelReturnError(result, status, xhr) {
		$("#errorDelete").append("This account doesn't exist")

			}

		}
	}

	})
	});
	
	//End ready function

	// print out result in list
	function ParseJsonFileAccount(result) {
		for(var i=0; i<result.length; i++){
			$("#list").append("<li>" + result[i].Name + ": " + result[i].SavingGoal + "kr" + "</li>")
		}
	
	}
	
	// weather api
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

	}



	function ajaxWeatherReturn_Error(result, status, xhr) {
		alert("Error i OpenWeaterMap Ajax");
		}

	}
	
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
	
	function clearFieldShow(){
		$("#findUsername").val("");			
	}
	
	function clearCreateSchedule() {
		$("#usernameS").val("");
		$("#name").val("");
		$("#goal").val("");
		$("#month").val("");
		$("#year").val("");
		
	}
	</script>
</body>
</html>
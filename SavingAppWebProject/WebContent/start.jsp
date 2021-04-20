<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"> </script>
<link rel="stylesheet" type="text/css" href="css/MySavingApp.css">
<meta charset="ISO-8859-1">
<title>MySavingApp</title>
</head>
<body>
	<section id="body">
			<h1>
				<p>Welcome to MySavingApp</p>
			</h1>
		<section id = "underHeader">
			<h2>
				<p>Achieve your dreams</p>
			</h2>
		</section>
		<section id="logInBox">
			<aside id="logInBox">
				<div class="login">
				Username: <input type="text" name="userNameTextField" id="id" value=""><br>
				<p></p>
				<p></p>
				<input type="button" name="submitBtn" value="Log in" id="FindBtn">
					<p></p>
				<p></p>
					<p></p>
				<p></p>
				</div>
				<div class="create"> 
				<input type="button" name="submitBtn" value="Register" id="CreateBtn">
				</div>
			</aside>
		</section>	
	</section>	
    <footer> 
        <section id = "footer">
        	<div class="leftdiv">
        	© 2021 MySavingApp Company
        	<tr>
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
        	</div>
        	<div class="leftcenterdiv">
        	<b>Contact</b>
        	<p> </p>
        	<p></p>
        	<p>contact@mySavingApp.com</p>
        	<p>Stora Tomegatan 32B</p>
        	<p>223 51, Lund</p>
        	</div>
        	<div class="rightcenterdiv">
        	<b>Social</b>
        	<p> </p>
        	<p></p>
        	<p>Facebook</p>
        	<p>LinkedIn</p>
        	<p>Instagram</p>
        	</div>
        	<div class="rightdiv">
        	<b>About</b>
        	<p></p>
        	<p></p>
        	<p>Our story</p>
        	</div>
      	</section> 
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
			clearFields();
		}

		function ajaxFindReturnError(result, status, xhr) {
			alert("Error");
			console.log("Ajax-find account: "+status);
		 		}
		 	}
		})
	});
	
function ParseJsonFileAccount(result) {

	$("#id").val(result.id);

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
	 		url: "http://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+long+"&units=metric"+ "&APPID=0aebca8155519cd776fe771d32a41872",
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
	
	function clearFields() {
		$("#id").val("");
	}

}//End of document ready

</script>
</body>
</html>
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
 			<form action ="SavingAppWebProject/SavingAppController" method="post"> 
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
						<!--   <input type="button" name="submitBtn" value="add" id="AddBtnSavingSchedule">
						 <input type="button" name="submitBtn" value="Delete" id="DeleteBtnSavingSchedule"> 
						<input type="button" name="submitBtn" value="Update" id="UpdateBtnSavingSchedule"> 
						-->
						<input type="submit" name="submit" value="add"> 
						<input name="operation"  value="addSaving"  type="hidden">
					</fieldset>

				</article>
			</form>
		<section id="main">
			
			<section id="content">
				<article>
		

					<fieldset id="PersonalFS">
						<legend>Account:</legend>
							<form action ="SavingAppWebProject/SavingAppController" method="post"> 
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
						
						<input type="submit" name="submit" value="add"> 
						<input name="operation"  value="addAccount"  type="hidden">
	</form>
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
 </body>
</html>
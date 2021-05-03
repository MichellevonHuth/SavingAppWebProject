function checkLogIn(){
	var username = $("#userNameTextField").val();
	if(username == null || username == ""){	
		$("#errorLbl").text("Please fill in username");		
		return false
	}
	return true;
}

function checkRegisterFields(){
	var username = $("#usernameTextBox").val();
	var firstname = $("#firstnameTextBox").val();
	var surname = $("#surnameTextBox").val();
	var income = $("#incomeTextBox").val();
	var fixedCost = $("#fixedCostTextBox").val();
	var variableCost = $("#variableCostTextBox").val();
	
	if(username == null || username == "" || firstname == null || firstname == "" || surname == null || surname == "" || income == null || income == "" || fixedCost == null || fixedCost == "" || variableCost == null || variableCost == ""){	
		$("#errorLbl").text("Please fill in all the fields");		
		return false;
	}else if(!income.match(/^([0-9])/) || !fixedCost.match(/^([0-9])/) || !variableCost.match(/^([0-9])/)){	
		$("#errorLbl").text("Income, fixed cost and variable cost can only be a number");		
		return false;
	}else if(!firstname.match(/[^0-9]/) || !surname.match(/[^0-9]/)){	
		$("#errorLbl").text("First name and surname can only be written with letters");		
		return false;
	}
	return true;
}

function checkGoal(){
	var savingGoal = $("#savingGoalTextBox").val();
	var durationYear = $("#savingDurationYearTextBox").val();
	var durationMonth = $("#savingDurationMonthTextBox").val();
	var savingName = $("#savingScheduleNameTextBox").val();
	
	
	if(savingName == "" || savingName == null || savingGoal == null || savingGoal == "" || durationYear == null || durationYear == "" || durationMonth == null || durationMonth == ""){
		$("#errorLbl").text("Please fill in all fields");		
		return false;
	}	
	else if(!savingGoal.match(/^([0-9])/)){	
		$("#errorLbl").text("Saving goal must be a number");		
		return false;
	}
	else if(!durationYear.match(/^([0-9])/)){	
		$("#errorLbl").text("Saving duration year must be a number");		
		return false;
	}
	else if(!durationMonth.match(/^([0-9])/)){	
		$("#errorLbl").text("Saving duration month must be a number");		
		return false;
	}
	return true;
}














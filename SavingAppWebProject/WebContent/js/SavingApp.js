function checkLogIn(){
	var username = document.getElementById("userNameTextField").value;
	if(username == null || username == ""){	
		document.getElementById("userNameTextField").setAttribute("placeholder","Please fill in username");
		document.getElementById("errorText").style.color="#171717";
	}
	return false;
}

function checkRegister(){



	resetBorders();
	var username = document.getElementById("usernameTextBox").value;
	var firstName = document.getElementById("firstnameTextBox").value;
	var surname = document.getElementById("surnameTextBox").value;
	var income = document.getElementById("incomeTextBox").value;
	var fixedCost = document.getElementById("fixedCostTextBox").value;
	var variableCost = document.getElementById("variableCostTextBox").value;

	let fields = [document.getElementById("usernameTextBox"), document.getElementById("firstnameTextBox"), document.getElementById("surnameTextBox"), document.getElementById("incomeTextBox"), document.getElementById("fixedCostTextBox"), document.getElementById("variableCostTextBox") ];

	let errorMessage =["Only numbers between 0-9", "Write letters only", "Address", "0-9"];

	

	if(ssn == null || ssn == "" || fullName == null || fullName == "" || address == null || address == "" || phoneNumber == null || phoneNumber == "" || !ssn.match(/^([0-9])/) || !fullName.match(/^[a-zA-Z\s]+$/) || !phoneNumber.match(/^([0-9])/)){


		for(let field of fields){

			if(field.value == ssn){

				if(!ssn.match(/^([0-9])/)) {

					var tmp = fields.indexOf(field);

					field.style.border = "1px solid red";

					field.value = "";

					field.placeholder = errorMessage[tmp];

				}

			}

			if(field.value == fullName) {

				if(!fullName.match(/^[a-zA-Z\s]+$/)) {

					var tmp = fields.indexOf(field);

					field.style.border = "1px solid red";

					field.value = "";

					field.placeholder = errorMessage[tmp];

				}

			}			

			if(field.value == phoneNumber){

				if(!phoneNumber.match(/^([0-9])/)){

					var tmp = fields.indexOf(field);

					field.style.border = "1px solid red";

					field.value = "";

					field.placeholder = errorMessage[tmp];

				}			

			}			

			if(field.value == null || field.value == ""){

				var tmp = fields.indexOf(field);

				field.style.border = "1px solid red";			

				field.placeholder = errorMessage[tmp];

			}		

		}

		return false;

	}

	

}
	


function checkLogIn(){
	var username = document.getElementById("userNameTextField").value;
	if(username == null || username == ""){	
		var s = "Please fill in username";
		alert("Please fill in username");
	}
	return false;
}
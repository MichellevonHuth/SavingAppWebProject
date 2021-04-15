
$(document).ready(function(){
	
	$("#DeleteBtn").click( function() { 
		var strValue = $("#username").val();
		
		if(strValue != "") {
			$.ajax({method: "DELETE",
				url: "http://localhost:8080/SavingAppClientProject/"+strValue, 
				error: ajaxFindReturnError, 
				success: ajaxFindReturnSuccess
			})
		
			
		function ajaxDeleteReturnSuccess(result, status, xhr) {
				clearFields();
				$("#username").attr("placeholder", "Account has been deleted"); 
		}
		
		function ajaxDeleteReturnError(result, status, xhr) {
			alert("Error");
			console.log("Ajax-find account: "+status);
		}	
	  }
	})	
}); 

	
	


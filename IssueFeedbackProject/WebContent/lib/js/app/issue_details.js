$(document).ready(function() {

	$("#checkboxResovled").change(function(event){
		var element = event.target;
		if(element.checked){
			$("#checkboxProblem").prop("disabled",true);
		}else{
			$("#checkboxProblem").prop("disabled",false);
		}
	});
	
	$("#checkboxProblem").change(function(event){
		var element = event.target;
		if(element.checked){
			$("#checkboxResovled").prop("disabled",true);
		}else{
			$("#checkboxResovled").prop("disabled",false);
		}
	});
});
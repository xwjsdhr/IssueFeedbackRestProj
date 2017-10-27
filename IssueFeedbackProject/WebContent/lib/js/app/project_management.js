$(document).ready(function(event){
	setListener();
});

function setListener(){
	
	btnAddDept.click(function(event){
		
		$("#exampleModal").modal('show');
	});
}

var btnAddDept = $("#btnAddDept");

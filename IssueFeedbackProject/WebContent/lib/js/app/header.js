$(document).ready(function(event){
	
	$("#btnLogout").click(function(event){
		$.ajax({
			url:"/IssueFeedbackProject/logout",
			method:"post",
			success:function(data){
				window.location.href="/IssueFeedbackProject/login";
			}
		});
	});
});

var progressRoot = $("#progressRoot");
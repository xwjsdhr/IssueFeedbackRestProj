$(document).ready(function(event){
	formUpdatePwd.submit(function(event){
		event.preventDefault();
		console.log(inputNewPassword.val());
		console.log(inputNewPassword2.val());
		if(inputNewPassword.val() !== inputNewPassword2.val()){
			alert("not same");
			return;
		}
		$.ajax({
			url:"/IssueFeedbackProject/updatePwdById",
			method:"post",
			data:{
				password: inputNewPassword.val().trim()
			},
			success:function(data){
				console.log(data);
				if(data.result){
					notification("修改成功","success");
				}
				setTimeout(() => {
					window.location.href="user_info";
				}, 500);
			}
		});
	});
	
});
var inputNewPassword = $("#inputNewPassword");
var inputNewPassword2 = $("#inputNewPassword2");
var btnUpdatePwd = $("#btnUpdatePwd");
var formUpdatePwd = $("#formUpdatePwd");
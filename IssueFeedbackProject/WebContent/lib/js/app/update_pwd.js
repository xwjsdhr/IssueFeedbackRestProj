$(document).ready(function(event){
	btnCheckOldPwd.click(function(){
		progress.css("width","25%");
		progressRoot.attr("hidden",false);
		
		if(inputOldPassword.val().trim().length >0){
			$.ajax({
				url:"/IssueFeedbackProject/checkOldPassword",
				method:"post",
				data:{
					old_password:inputOldPassword.val()
				},
				success:function(data){
					progress.css("width","100%");
					setTimeout(() => {
						progressRoot.attr("hidden",true);
						showAlert(alertOldPwd,btnCheckOldPwd,data.result);
					}, 500);
					
				}
			});
		}
	});
});

function showAlert(alert,btnCheck,result){
	alert.attr("hidden",false);
	if(result){
		alert.removeClass("alert-danger");
		btnCheck.empty();
		var iconDone = $("<i>").addClass("material-icons").text("done");
		btnCheck.append(iconDone);
	}else{
		alert.removeClass("alert-success");
	}
	alert.addClass(result?"alert-success":"alert-danger");
	alert.text(result?"原密码正确":"原密码不正确");
	isOldCorrect = result;
}

var inputOldPassword = $("#inputOldPassword");
var inputNewPassword = $("#inputNewPassword");
var inputNewPassword2 = $("#inputNewPassword2");
var alertOldPwd = $("#alertOldPwd");
var alertNewPwd1 = $("#alertNewPwd1");
var alertNewPwd2 = $("#alertNewPwd2");
var btnUpdatePwd = $("#btnUpdatePwd");
var isOldCorrect = false;
var btnCheckOldPwd = $("#btnCheckOldPwd");
btnUpdatePwd.attr("disabled",true);
progressRoot.attr("hidden",true);
$(document).ready(function(){
	console.log("aaaaa");
	var alertUserSuccess = $("#alertUserSuccess");
	var alertUserFail = $("#alertUserFail");
	
	var alertPwdSuc = $("#alertPwdSuc");
	var alertPwdFail = $("#alertPwdFail");
	
	var alertRealSuc = $("#alertRealSuc");
	var alertRealFail = $("#alertRealFail");
	var a = false;
	var b = false;
	var c = false;
	var submitBtn = $("#submitBtnReg");
	
	alertUserFail.hide();
	alertUserSuccess.hide();
	
	alertPwdSuc.hide();
	alertPwdFail.hide();
	
	alertRealSuc.hide();
	alertRealFail.hide();
	submitBtn.attr("disabled",true);
	setInputListener("#inputUserName",alertUserSuccess,alertUserFail,"用户名不能为空",true,function(data){
		a = data;
		if(a && b && c){
			submitBtn.attr("disabled",false);
		}else{
			submitBtn.attr("disabled",true);
		}
	});
	setInputListener("#inputpassword",alertPwdSuc,alertPwdFail,"密码不能为空",false,function(data){
		b = data;
		if(a && b && c){
			submitBtn.attr("disabled",false);
		}else{
			submitBtn.attr("disabled",true);
		}
	});
	setInputListener("#inputRealName",alertRealSuc,alertRealFail,"姓名不能为空",false,function(data){
		c = data;
		if(a && b && c){
			submitBtn.attr("disabled",false);
		}else{
			submitBtn.attr("disabled",true);
		}
	});
	
});

function setInputListener(controlId,alertSuccessComponent,alertFailComponent ,alertText,isUserName,callback){
	$(controlId).keyup(function(event){
		var username = event.target.value;
		
		if(username.trim().length >0){
			
			if(isUserName){
				alertSuccessComponent.hide();
				alertFailComponent.hide();
				$.ajax({
					url:"/IssueFeedbackProject/CheckUserName",
					method:"get",
					data:{
						userName:username
					},
					success:function(data){
						if(data){
							alertSuccessComponent.show();
							alertFailComponent.hide();
						}else{
							alertSuccessComponent.hide();
							alertFailComponent.show();
							var element = $("<i>").text("用户名已存在");
							alertFailComponent.empty().append(element);
							
						}
						callback(data);
					}
				});
			}else{
				alertSuccessComponent.show();
				alertFailComponent.hide();
				callback(true);
			}
			
		}else{
			
			alertSuccessComponent.hide();
			alertFailComponent.show();
			var element = $("<i>").text(alertText);
			alertFailComponent.empty().append(element).show();
			callback(false);
		}
	});
}
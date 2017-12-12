$(document).ready(function() {
	setListener();
	
});
/**
 * 设置监听
 */
function setListener() {
	$("#loginForm").submit(function(event) {
		event.preventDefault();
		var user_name = usernameInputId.val();
		var password = passwordInputId.val();
		btnLogin.val("正在登录");
		validateFormElement(true);
		$.ajax({
				url : "/IssueFeedbackProject/auth",
				method : "post",
				dataType : "json",
				data : {
					user_name : user_name,
					password : password
				},
				success : function(data) {
					if (data!= null) {
						if(data.status){//启用
							btnLogin.val("登录成功，正在跳转...");
							setTimeout(function(){
								window.location.href = "/IssueFeedbackProject/v2/home_main";
							},1000);
						}else{//禁用
							validateFormElement(true);
							btnLogin.val("用户已被禁用，请联系管理员");
							setTimeout(function(){
								btnLogin.val("登录");
								validateFormElement(false);
								focusPwdInput();
							},1000);	
						}
					}else{//用户名密码错误
						validateFormElement(true);
						btnLogin.val("用户名或密码错误");
						setTimeout(function(){
							btnLogin.val("登录");
							validateFormElement(false);
							focusPwdInput();
						},1000);	
					}
				},
				error : function(error) {
					console.log(error);
				}
			})
		});
}

// ***********variable*************
var btnLogin = $("#btnLogin");
var usernameInputId = $("#usernameInputId");
var passwordInputId = $("#passwordInputId");
function focusPwdInput(){
	passwordInputId.focus();
	passwordInputId.select();
}
function validateFormElement(enable){
	usernameInputId.removeAttr("disabled");
	passwordInputId.removeAttr("disabled");
	btnLogin.prop("disabled",enable);
	usernameInputId.prop("disabled",enable);
	passwordInputId.prop("disabled",enable);
}

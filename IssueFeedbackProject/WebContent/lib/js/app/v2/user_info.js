
var btnUpdateUserInfo =  $("#btnUpdateUserInfo");
var btnSaveUserInfo = $("#btnSaveUserInfo");
var btnUpdateUserInfoCancel = $("#btnUpdateUserInfoCancel");

var inputUserName = $("#inputUserName");
var inputRealName = $("#inputRealName");
var selectDept = $("#selectDept");
var inputTelephone = $("#inputTelephone");
var inputEmail= $("#inputEmail");

var inputPassword1 = $("#inputPassword1");
var inputPassword2 = $("#inputPassword2");
var btnUpdatePwd = $("#btnUpdatePwd");


$(document).ready(function(){
	btnUpdateUserInfo.click(function(event){
		toggleForm(false);
		btnSaveUserInfo.attr("hidden",false);
		btnUpdateUserInfo.attr("hidden",true);
		btnUpdateUserInfoCancel.attr("hidden",false);
		
	});
	
	btnSaveUserInfo.click(function(event){
		toggleForm(true);
		btnUpdateUserInfo.attr("hidden",false);
		btnSaveUserInfo.attr("hidden",true);
		btnUpdateUserInfoCancel.attr("hidden",true);
		
		$.ajax({
			url:"/IssueFeedbackProject/updateUserInfo",
			method:"post",
			data:{
				real_name:inputRealName.val(),
				dept_id:selectDept.val(),
				telephone:inputTelephone.val(),
				email:inputEmail.val(),
			},
			success:function(data){
				console.log(data);
				if(data.result){
					console.log(data);
					notification("修改成功","success");
				}
			}
		});
		
		
	});
	
	btnUpdateUserInfoCancel.click(function(event){
		toggleForm(true);
		btnUpdateUserInfo.attr("hidden",false);
		btnUpdateUserInfoCancel.attr("hidden",true);
		btnSaveUserInfo.attr("hidden",true);
		
		$.ajax({
			url:"/IssueFeedbackProject/getUserBySession",
			method:"post",
			success:function(data){
				if(data!= null){
					console.log(data);	
					inputUserName.val(data.result.username) ;
					 inputRealName.val(data.result.realName) ;
					 selectDept.val(data.result.dept.id) ;
					 inputTelephone.val(data.result.telephone);
					 inputEmail.val(data.result.email);
					
				}
			}
		});
	});
	
	btnUpdatePwd.click(function(event){
		var password1 = inputPassword1.val().trim();
		var password2 = inputPassword2.val().trim();
		if(password1.length == 0 || password2.length ==0){
			return;
		}
		if(password1 != password2){
			return;
		}
		$.ajax({
			url:"/IssueFeedbackProject/updatePwdById",
			method:"post",
			data:{
				password: password1
			},
			success:function(data){
				console.log(data);
				if(data.result){
					notification("修改成功","success");
					inputPassword1.val("");
					inputPassword2.val("");
				}
			}
		});
		
	});
	$.ajax({
		url:"/IssueFeedbackProject/allDepts",
		method:"get",
		success:function(data){
			$.each(data.result,function(index,element){
				if(selectDept.val() != element.id){
					var row = $("<option>").val(element.id).text(element.deptName);
					selectDept.append(row)
				}
			});
		}
	});
	
	
	
});

function toggleForm(b){
	inputRealName.prop("disabled",b);
	selectDept.prop("disabled",b);
	inputTelephone.prop("disabled",b);
	inputEmail.prop("disabled",b);
	
}
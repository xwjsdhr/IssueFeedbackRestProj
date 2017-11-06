$(document).ready(function(){
	getAllDept();
	
	$("#formAddUser").submit(function(event){
		event.preventDefault();
		$.ajax({
			url:"/IssueFeedbackProject/addUser",
			method:"post",
			data:{
				user_name:inputUserName.val(),
				password:inputpassword.val(),
				real_name:inputRealName.val(),
				dept_id:selectDept.val()
			},
			success:function(data){
				if(data.result){
					$('.modal').modal({
						show:true
					});
					 inputUserName.val("");
					 inputpassword.val("");
					 inputRealName.val("");
				}
			}
		})
		
	});
	
	init();
	
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
/**
 * 获取全部部门
 * 
 * @returns
 */
function getAllDept(){

	$.ajax({
		url:"/IssueFeedbackProject/allDepts",
		method:"get",
		success:function(data){
			populateSelect(selectDept,data.result);
		}
	});
}

function setInputListener(controlId,alertSuccessComponent,alertFailComponent ,alertText,isUserName,callback){
	$(controlId).keyup(function(event){
		var username = event.target.value;
		
		if(username.trim().length >0){
			
			if(isUserName){
				alertSuccessComponent.hide();
				alertFailComponent.hide();
				$.ajax({
					url:"/IssueFeedbackProject/checkUserName",
					method:"get",
					data:{
						userName:username
					},
					success:function(data){
						if(data.result){
							alertSuccessComponent.show();
							alertFailComponent.hide();
						}else{
							alertSuccessComponent.hide();
							alertFailComponent.show();
							var element = $("<i>").text("用户名已存在");
							alertFailComponent.empty().append(element);
							
						}
						callback(data.result);
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
function getRow(dept){
	var option = $("<option>").val(dept.id).text(dept.deptName);
	return option;
}
function populateSelect(selectDept,result){
	$.each(result,function(index,element){
		selectDept.append(getRow(element));
	});
	progress.css("width","100%");
	setTimeout(() => {
		progressRoot.attr("hidden",true);
	}, 500);
}
var selectDept = $("#selectDept");

var alertUserSuccess = $("#alertUserSuccess");
var alertUserFail = $("#alertUserFail");

var alertPwdSuc = $("#alertPwdSuc");
var alertPwdFail = $("#alertPwdFail");

var alertRealSuc = $("#alertRealSuc");
var alertRealFail = $("#alertRealFail");
var submitBtn = $("#submitBtnReg");

var a = false;
var b = false;
var c = false;

var inputUserName = $("#inputUserName");
var inputpassword = $("#inputpassword");
var inputRealName = $("#inputRealName");

function init(){
	alertUserFail.hide();
	alertUserSuccess.hide();
	
	alertPwdSuc.hide();
	alertPwdFail.hide();
	
	alertRealSuc.hide();
	alertRealFail.hide();
	submitBtn.attr("disabled",true);
}






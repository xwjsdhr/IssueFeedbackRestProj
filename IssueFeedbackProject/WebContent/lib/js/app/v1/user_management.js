$(document).ready(function(event) {
	
	$.ajax({
		url : "/IssueFeedbackProject/allUser",
		method : "get",
		success : function(data) {
			console.log(data);
			setTimeout(function(){
				toggleProgress(false);
			}, 500);
			//toggleProgress(false);
			progress.css("width","100%");
			if(data.result != null){
				
				setTimeout(() => {
					$.each(data.result, function(index, user) {
						var row = makeRowForUser(user);
						table.append(row);
					});
					progressRoot.attr("hidden",true);
					user_table_root.attr("hidden",false);
					pbUser.attr("hidden",true);
					
					$(".disable-enable-btn").on("click",function(event){
						
						var userId = event.target.id.split("-")[1];
						var userStatus = $(event.target).attr("data-status");
						
						$.ajax({
							url:"/IssueFeedbackProject/disableOrEnableUser",
							method:"get",
							data:{
								userId:userId,
								userStatus:userStatus
							},
							success:function(data){
								console.log(data);
								if(data.result){
									changeBtnAndBadgeStyle(event.target.id,userStatus);
									showDialog("修改状态","修改成功");
								}else{
									alert(data.msg);
								}
							}
						});
						
					});
					
					$(".btnReset").on("click",function(event){
						var id = event.target.id.split("-")[1];
						$.ajax({
							url:"/IssueFeedbackProject/resetPwd",
							method:"post",
							data:{
								user_id:id
							},
							success:function(data){
								if(data.result){
									showDialog("重置密码","重置成功");
								}
							}
						})
						
					});
					$(".btnUpdate").on("click",function(event){
						var user = $(this).data("user");
						$("#update_dialog").modal({
							show:true
						});
						btnUpdateUserInfo.data("user_id",user.id);
						
						inputUpdateUsername.val(user.username);
						inputUpdateRealName.val(user.realName);
					});
					
					btnUpdateUserInfo.click(function(event){
						var id = $(this).data("user_id");
						$.ajax({
							url:"/IssueFeedbackProject/updateUserById",
							method:"get",
							data:{
								username:inputUpdateUsername.val(),
								real_name:inputUpdateRealName.val(),
								id:id,
								dept_id:selectDept.val()
							},
							success:function(data){
								$("#pusername-"+id).text(inputUpdateUsername.val());
								$("#realName-"+id).text(inputUpdateRealName.val());
								$("#deptname-"+id).text($("#selectDept option:selected").text());
							}
						});
					});
				}, 500);
				
			}
			//--------------------------------------------------
			
		}
	});
	btnAddUser.click(function(event){
		$("#add_dialog").modal({
			show:true
		});
	});
	$("#formAddUser").submit(function(event){
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
					 inputUserName.val("");
					 inputpassword.val("");
					 inputRealName.val("");
				}
			}
		});
		
	});
	$.ajax({
		url:"/IssueFeedbackProject/allDepts",
		method:"get",
		success:function(data){
			console.log(data.result);
			$.each(data.result,function(index,element){
				var option = $("<option>").val(element.id).text(element.deptName);
				$("#selectDept").append(option);
				$("#selectDeptUpdate").append(option);
			});
			
		}
	})

	
});


/** ************global function******* */
function changeBtnAndBadgeStyle(btnId,userStatus){
	console.log(btnId+":"+userStatus);
	if(userStatus == "true"){
		$("#"+btnId).removeClass("btn-danger").addClass("btn-success");
		$("#"+btnId).text("启用");
		
		$("#badge-"+btnId.split("-")[1]).removeClass("mdl-chip-sovled").addClass("mdl-chip-problem");
		$("#badge-text-"+btnId.split("-")[1]).text("禁用");
		$("#"+btnId).attr("data-status",false);
		
	}else{
		$("#"+btnId).removeClass("btn-success").addClass("btn-danger");
		$("#"+btnId).text("禁用");
		
		$("#badge-"+btnId.split("-")[1]).removeClass("mdl-chip-problem").addClass("mdl-chip-sovled");
		$("#badge-text-"+btnId.split("-")[1]).text("启用");
		$("#"+btnId).attr("data-status",true);
	}
	
}
function showDialog(title,content){
	$(".modal-title").text(title);
	$("#modal-content").text(content);
	$('#alert_dialog').modal({
		show:true
	});
}

function makeRowForUser(user) {
	
	var pUserName = $("<p>").attr("id","pusername-"+user.id).text(user.username);
	var tdUserName = $("<td>").append(pUserName);
	var tdUserDeptName = $("<td>").attr("id","deptname-"+user.id).text(user.dept.deptName);
	var tdRealName = $("<td>").attr("id","realName-"+user.id).text(user.realName);
	var statusStr = user.status ? "启用" : "禁用";
	var statusClass = user.status ? "mdl-chip mdl-chip-sovled"
			: "mdl-chip mdl-chip-problem";

	var spanParent = $("<span>").addClass(statusClass).attr("id","badge-"+user.id);
	var spanChild = $("<span>").addClass("mdl-chip__text").text(statusStr).attr("id","badge-text-"+user.id);
	spanParent.append(spanChild);
	
	var btnStatusStr = user.status ? "禁用" :"启用" ;
	var btnClass = user.status ? "btn btn-danger" :"btn btn-success" ;
	var btnEnableAndDisable = $("<button>").text(btnStatusStr).addClass(btnClass)
											.addClass("disable-enable-btn")
											.attr("id","disable_enable-"+user.id)
											.attr("data-status",user.status);
	var tdOperation = $("<td>").append(btnEnableAndDisable);

	var tdStatus = $("<td>").append(spanParent);
	
	var btnReset = $("<button>").text("重置").attr("id","reset-"+user.id).addClass("btn btn-primary btnReset");
	var btnUpdate = $("<button>").text("修改").attr("id","btnupdate-"+user.id).addClass("btn btn-success btnUpdate").data("user",user);
	var btnGroup = $("<div class='btn-group'>").append(btnReset).append(btnUpdate);
	var tdResetPwd = $("<td>").append(btnGroup);
	var tr = $("<tr>").append(tdUserName).append(tdUserDeptName)
		.append(tdRealName).append(tdStatus).append(tdOperation).append(tdResetPwd);

	return tr;
}


function toggleProgress(visible) {
	table.attr("hidden", visible);
//	pbUser.attr("hidden", !visible);
}

/** *************variable************* */

var table = $("#user_table");
var pbUser = $("#pbUser");
var btnUpdateUserInfo = $("#btnUpdateUserInfo");
var inputUpdateUsername = $("#inputUpdateUsername");
var inputUpdateRealName = $("#inputUpdateRealName");
var selectDept = $("#selectDeptUpdate");
var user_table_root = $("#user_table_root");
var btnAddUser = $("#btnAddUser");

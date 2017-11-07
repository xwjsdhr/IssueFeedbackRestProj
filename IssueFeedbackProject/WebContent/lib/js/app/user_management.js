$(document).ready(function(event) {
	
	$.ajax({
		url : "/IssueFeedbackProject/allUser",
		method : "get",
		success : function(data) {
			setTimeout(function(){
				toggleProgress(false);
			}, 5000);
			toggleProgress(false);
			progressRoot.css("width","100%");
			if(data.result != null){
				
				setTimeout(() => {
					$.each(data.result, function(index, user) {
						var row = makeRowForUser(user);
						table.append(row);
					});
					progressRoot.attr("hidden",true);
					
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
					
				}, 500);
				
			}
			//--------------------------------------------------
			
		}
	});
	

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
	$('.modal').modal({
		show:true
	});
}

function makeRowForUser(user) {
	var tdUserName = $("<td>").text(user.username);
	var tdUserDeptName = $("<td>").text(user.dept.deptName);
	var tdRealName = $("<td>").text(user.realName);
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
	var tdResetPwd = $("<td>").append(btnReset);
	var tr = $("<tr>").append(tdUserName).append(tdUserDeptName)
		.append(tdRealName).append(tdStatus).append(tdOperation).append(tdResetPwd);

	return tr;
}


function toggleProgress(visible) {
	table.attr("hidden", visible);
	pbUser.attr("hidden", !visible);
}

/** *************variable************* */

var table = $("#user_table");
var pbUser = $("#pbUser");

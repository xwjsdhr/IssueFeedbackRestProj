var inputUserName = $("#inputUserName");
var inputPassword = $("#inputPassword");
var inputRealName = $("#inputRealName");
var selectDept = $("#selectDept");

var inputUpdateUserName = $("#inputUpdateUserName");
var inputUpdateRealName = $("#inputUpdateRealName");
var selectUpdateDept = $("#selectUpdateDept");
var btnUpdateUser = $("#btnUpdateUser");

var addUserModal = $("#addUserModal");
var updateUserModal = $("#updateUserModal");
var btnAddUser = $("#btnAddUser");

var formAddUser = $("#formAddUser");
var formUpdateUser = $("#formUpdateUser");

$(document).ready(function(event){
	btnAddUser.click(function(event){
		addUserModal.modal({
			show:true
		});
	});
	
	formAddUser.validate({
		rules:{
			inputUserName:"required",
			inputPassword:"required",
			inputRealName:"required"
		},
		messages:{
			inputUserName:"<div class='alert alert-danger col-lg-12' style='margin-top:10px' role='alert'>请输入用户名</div>",
			inputPassword:"<div class='alert alert-danger col-lg-12' style='margin-top:10px' role='alert'>请输入密码</div>",
			inputRealName:"<div class='alert alert-danger col-lg-12' style='margin-top:10px' role='alert'>请输入姓名</div>"
		}
	});
	
	//获取部门列表
	$.ajax({
		url:"/IssueFeedbackProject/allDepts",
		method:"get",
		success:function(data){
			if(data.result!= null){
				$.each(data.result,function(index,element){
					var row = $("<option>").val(element.id).text(element.deptName);
					selectUpdateDept.append(row);
					
				});
				$.each(data.result,function(index,element){
					var row = $("<option>").val(element.id).text(element.deptName);
					selectDept.append(row);
				});
			}
		}
	});
	
	formAddUser.submit(function(event){
		event.preventDefault();
		var username = inputUserName.val().trim();
		var password = inputPassword.val().trim();
		var realName = inputRealName.val().trim();
		if(username.length == 0 ||
				password.length == 0 ||
				realName.length == 0){
			return;
		}
		$.ajax({
			url:"/IssueFeedbackProject/addUser",
			method:"post",
			data:{
				user_name:inputUserName.val(),
				password:inputPassword.val(),
				real_name:inputRealName.val(),
				dept_id:selectDept.val()
			},
			success:function(data){
				if(data.result){
					console.log(data);
					addUserModal.modal("hide");
					userTable.ajax.reload();
				}else{
					alert(data.msg);
				}
				inputUserName.val("");
				inputPassword.val("");
				inputRealName.val("");
			}
		});
	});
	
	formUpdateUser.submit(function(event){
		event.preventDefault();
		var userId = btnUpdateUser.attr("id").split("-")[1];
		$.ajax({
			url:"/IssueFeedbackProject/updateUserById",
			method:"get",
			data:{
				username:inputUpdateUserName.val(),
				real_name:inputUpdateRealName.val(),
				id:userId,
				dept_id:selectUpdateDept.val()
			},
			success:function(data){
				console.log(data);
				if(data.result){
					updateUserModal.modal("hide");
					userTable.ajax.reload();
				}
			}
		});
	});
	
	 $('#user_table tbody').on( 'click', '.btnEnable', function () {
	        var data = userTable.row( $(this).parents('tr') ).data();
	        var userId = $(this).attr("id").split("-")[1];
			var userStatus = $(this).attr("data-status");
			console.log(data);
			$.ajax({
				url:"/IssueFeedbackProject/disableOrEnableUser",
				method:"get",
				data:{
					userId:userId,
					userStatus:userStatus
				},
				success:function(data){
					if(data.result){
						userTable.ajax.reload();
					}
				}
			});
	    });
	 
	 $('#user_table tbody').on( 'click', '.btnUpdate', function () {
	        var data = userTable.row( $(this).parents('tr') ).data();
	        var userId = $(this).attr("id").split("-")[1];
			
			inputUpdateUserName.val(data.username);
			inputUpdateRealName.val(data.realName);
			btnUpdateUser.attr("id","btnUpdate-"+data.id);
			
			updateUserModal.modal({
				show:true
			});
	    });
	
});

var userTable = $("#user_table").DataTable({
		ajax : {
			"url" : "/IssueFeedbackProject/allUser",
			"dataSrc" : "result",
			"data":function(){
				notification("加载用户成功","success");
			}
		},
		searching:true,
		paging:true,
		"language": {
            "lengthMenu": "每页显示 _MENU_ 条记录",
            "zeroRecords": "未查询到任何记录",
            "info": "第 _PAGE_ 页 ，共  _PAGES_页",
            "infoEmpty": "无任何问题",
            "infoFiltered": "(filtered from _MAX_ total records)",
            "paginate":{
            	"previous":"上一页",
            	"next":"下一页"
            },
            select:{
            	rows:{
            		 _: "    &nbsp;&nbsp;&nbsp;&nbsp;你已经选择了  %d 行",
                     0: "    &nbsp;&nbsp;&nbsp;&nbsp;点击一行选择",
                     1: "    &nbsp;&nbsp;&nbsp;&nbsp;仅 %d 行被选择 "
            	}
            },
            searchPlaceholder:"请输入查询信息"
        },
		columns : [
			{
				data : "username",
				render : function(data, type, row, meta) {
					return data;
				}
			}, 
			{
				data : "dept.deptName",
				render : function(data, type, row, meta) {
					return data;
				}
			},
			{
				data:"status",
				render : function(data, type, row, meta) {
					var str = "禁用";
					var type = 'badge-danger';
					if(data){
						str = "启用"
						type = 'badge-success';
					}else{
						str = "禁用";
						type = 'badge-danger';
					}
					return "<span class='badge "+type+"'>"+str+"</span>";
				}
			},
			{
				data : "realName",
				render : function(data, type, row, meta) {
					return  data;
				}
			}, 
			{
				data : "id",
				render : function(data, type, row, meta) {
					var str = "禁用";
					if(row.status){
						str = "禁用";
					}else{
						str = "启用";
					}
					return "<button class='btn btn-primary btnEnable' id='btnEnable-"+row.id+"' data-status='"+row.status+"' >"+str+"</button>";
				}
			}, 
			{
				data : "id",
				render : function(data, type, row, meta) {
					return "<button  class='btn btn-primary btnUpdate' id='btnUpdate-"+row.id+"'>修改</button>";
				}
			}
		]
});
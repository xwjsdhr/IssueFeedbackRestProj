var inputUserName = $("#inputUserName");
var inputPassword = $("#inputPassword");
var inputRealName = $("#inputRealName");
var inputTelephone = $("#inputTelephone");
var inputEmail = $("#inputEmail");

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
			show:true,
		});
	});
	
	formAddUser.parsley();
	/*formAddUser.validate({
		rules:{
			inputUserName:"required",
			inputPassword:"required",
			inputRealName:"required",
			inputTelephone:{
				"required":true,
				"digit":true
			},
			inputEmail:{
				"required":true,
				"email":true
			}
		},
		messages:{
			inputUserName:"<div class='alert alert-danger col-lg-12 text-center' style='margin-top:5px;'  role='alert'>请输入用户名</div>",
			inputPassword:"<div class='alert alert-danger col-lg-12' style='margin-top:5px' role='alert'>请输入密码</div>",
			inputRealName:"<div class='alert alert-danger col-lg-12' style='margin-top:5px' role='alert'>请输入姓名</div>",
			inputTelephone:"<div class='alert alert-danger col-lg-12' style='margin-top:5px' role='alert'>请输入电话</div>",
			inputEmail:"<div class='alert alert-danger col-lg-12' style='margin-top:5px' role='alert'>请输入电子邮箱</div>"
		}
	});*/
	
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
		var telephone = inputTelephone.val().trim();
		var email = inputEmail.val().trim();
		if(username.length == 0 ||
				password.length == 0 ||
				realName.length == 0 || telephone.length == 0
	|| email.length == 0){
			return;
		}
		$.ajax({
			url:"/IssueFeedbackProject/addUser",
			method:"post",
			data:{
				user_name:inputUserName.val(),
				password:inputPassword.val(),
				real_name:inputRealName.val(),
				dept_id:selectDept.val(),
				telephone:inputTelephone.val(),
				email:inputEmail.val()
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
	 
	 $('#user_table tbody').on( 'click', '.btnReset', function () {
	        var data = userTable.row($(this).parents('tr') ).data();
	        var userId = $(this).attr("id").split("-")[1];
			
			inputUpdateUserName.val(data.username);
			inputUpdateRealName.val(data.realName);
			
			$.ajax({
				url:"/IssueFeedbackProject/resetPwd",
				method:"post",
				data:{
					user_id:userId,
				},
				success:function(data){
					if(data.result){
						userTable.ajax.reload();
					}
				}
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
		"lengthMenu":[
			[5,20],[5,20]
		],
		searching:true,
		paging:true,
//		paginationType: "input",
		"language": {
            "lengthMenu": "每页显示 _MENU_ 条用户",
            "zeroRecords": "未查询到任何用户",
            "info": "第 _PAGE_ 页 ，共  _PAGES_页",
            "infoEmpty": "无任何用户",
            "infoFiltered": "(共 _MAX_条记录)",
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
            search:"查询",
            searchPlaceholder:"请输入查询用户信息"
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
					var iconStr = "<i class='fa fa-fw fa-lock'></i>";
					
					if(data){
						str = "启用"
						type = 'badge-success';
						iconStr = "<i class='fa fa-fw fa-unlock'></i>";
					}else{
						str = "禁用";
						type = 'badge-danger';
						iconStr = "<i class='fa fa-fw fa-lock'></i>";
					}
					return "<span class='badge "+type+"'>"+iconStr+"&nbsp;"+str+"</span>";
				}
			},
			{
				data : "realName",
				render : function(data, type, row, meta) {
					return  data;
				}
			}, 
			{
				data : "telephone",
				render : function(data, type, row, meta) {
					return  data;
				}
			},
			{
				data : "email",
				render : function(data, type, row, meta) {
					return  data;
				}
			},
			{
				data : "id",
				render : function(data, type, row, meta) {
					var iconStr = "<i class='fa fa-fw fa-lock'></i>";
					var type = 'btn-success';
					var str = "禁用";
					if(row.status){
						str = "禁用";
						type = 'btn-danger';
						iconStr = "<i class='fa fa-fw fa-lock'></i>";
					}else{
						str = "启用";
						type = 'btn-success';
						iconStr = "<i class='fa fa-fw fa-unlock'></i>";
					}
					return "<button class='btn btn-sm "+type+" btnEnable' id='btnEnable-"+row.id+"' data-status='"+row.status+"' >"+iconStr+"&nbsp;"+str+"</button>";
				}
			}, 
			{
				data : "id",
				render : function(data, type, row, meta) {
					return "<button  class='btn btn-sm btn-primary btnUpdate' id='btnUpdate-"+row.id+"'>修改&nbsp;<i class='fa fa-fw fa-pencil'></i></button>";
				}
			}, 
			{
				data : "id",
				render : function(data, type, row, meta) {
					return "<button  class='btn btn-sm btn-primary btnReset' id='btnReset-"+row.id+"'><i class='fa fa-fw fa-refresh'></i>重置</button>";
				}
			}
		]
});


	





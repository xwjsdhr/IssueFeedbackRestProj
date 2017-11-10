$(document).ready(function(event){
	$("#btnAddUser").click(function(event){
		$("#addUserModal").modal({
			show:true
		});
	});
})

$("#user_table").DataTable({
	
		ajax : {
			"url" : "/IssueFeedbackProject/allUser",
			"dataSrc" : "result"
		},
		searching:false,
		paging:false,
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
					if(data){
						str = "启用"
					}else{
						str = "禁用";
					}
					return str;
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
					return "<a href='#' class='btn btn-primary'>禁用</a>";
				}
			}, 
			{
				data : "id",
				render : function(data, type, row, meta) {
					return "<a href='#' class='btn btn-primary'>修改</a>";
				}
			}
		]
	})
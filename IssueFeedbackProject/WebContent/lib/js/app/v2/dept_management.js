var inputDeptName = $("#inputDeptName");
$(document).ready(function(event){
	
	$("#btnAddDept").click(function(){
		$("#addDeptModal").modal({
			show:true
		});
	});
	$("#formAddDept").validate({
		rules:{
			inputDeptName:"required"
		},
		messages:{
			inputDeptName:"<div class='alert alert-danger col-lg-12' style='margin-top:10px' role='alert'>请输入部门名称</div>"
		}
	});
	
	$("#formAddDept").submit(function(event){
		event.preventDefault();
		if(inputDeptName.val().trim().length >0){
			$.ajax({
				url:"/IssueFeedbackProject/addDept",
				method:"get",
				data:{
					dept_name:inputDeptName.val()
				},
				success:function(data){
					console.log(data);
					if(data.result){
						$("#addDeptModal").modal("hide");
						inputDeptName.val("");
						deptTable.ajax.reload();
					}
				}
			});
		}
	});
	
	
	
});
var deptTable = $("#dept_table").DataTable({
		ajax : {
			"url" : "/IssueFeedbackProject/allDepts",
			"dataSrc" : "result"
		},
		searching:false,
		paging:false,
		columns : [
			{
				data : "deptName",
				render : function(data, type, row, meta) {
					return data;
				}
			}
		]
});
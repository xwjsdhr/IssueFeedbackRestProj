$(document).ready(function(event){
	
	$("#btnAddDept").click(function(){
		$("#addDeptModal").modal({
			show:true
		});
	});
	
});
$("#dept_table").DataTable({
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
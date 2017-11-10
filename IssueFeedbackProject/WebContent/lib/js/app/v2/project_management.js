$(document).ready(function(){
	$("#btnAddProject").click(function(){
		$("#addProjectModal").modal({
			show:true
		});
	});
});
$("#project_table").DataTable({
		ajax : {
			"url" : "/IssueFeedbackProject/allProjects",
			"dataSrc" : "result"
		},
		searching:false,
		paging:false,
		columns : [
			{
				data : "projectName",
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
				data : "description",
				render : function(data, type, row, meta) {
					return data;
				}
			},
			 
			{
				data : "id",
				render : function(data, type, row, meta) {
					return "<a href='#' class='btn btn-primary'>修改</a>";
				}
			}
		]
});
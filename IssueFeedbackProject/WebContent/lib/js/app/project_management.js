$(document).ready(function(event){
	setListener();
	getProjects();
});

function setListener(){
	
	btnAddDept.click(function(event){
		
		$("#exampleModal").modal('show');
	});
}
function getProjects(){
	$.ajax({
		url:"/IssueFeedbackProject/allProjects",
		method:"get",
		success:function(data){
			progressBar(data);
		}
	});
}

function getRow(project){
	
	var tr = $("<tr>");
	var tColumnId = $("<td>").text(project.id);
	var tColumnProjectName = $("<td>").text(project.projectName);
	var tColumnDeptName = $("<td>").text(project.dept.deptName);
	tr.append(tColumnId).append(tColumnProjectName).append(tColumnDeptName);
	return tr;
}


function progressBar(data){
	$("#progress").css("width","100%");
	setTimeout(() => {
		$.each(data.result,function(index,element){
			projectTable.append(getRow(element));
		});
		$("#progressRoot").attr("hidden",true);
	}, 500);
}

var btnAddDept = $("#btnAddDept");
var projectTable = $("#project_table");


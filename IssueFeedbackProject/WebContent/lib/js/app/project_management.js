$(document).ready(function(event){
	setListener();
	getProjects();
});

function setListener(){
	
	btnAddProject.click(function(event){
		$("#myModal").modal('show');
	});
	btnSaveProject.click(function(event){
		console.log(inputProjectName.val());
		if(inputProjectName.val().trim().length > 0 ){
			$.ajax({
				url:"/IssueFeedbackProject/addProject",
				method:"get",
				data:{
					project_name:inputProjectName.val()
				},
				success:function(data){
					console.log(data.result);
				}
					
			});
			inputProjectName.val("");
		}
		
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

var btnAddProject = $("#btnAddProject");
var projectTable = $("#project_table");
var btnSaveProject = $("#btnSaveProject");
var inputProjectName = $("#inputProjectName");


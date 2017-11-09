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
					if(data.result){
						
					}
				}
					
			});
			inputProjectName.val("");
		}
	});
	$.ajax({
		url:"/IssueFeedbackProject/allDepts",
		method:"get",
		success:function(data){
			if(data.errorCode == -1){
				
				$.each(data.result,function(index,element){
					var option = $("<option>").attr("id",element.id).text(element.deptName);
					$("#selectorDept").append(option);
				});
				
			}
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
	var tColumnProjectName = $("<td>").text(project.projectName);
	var tColumnDeptName = $("<td>").text(project.dept.deptName);
	var tColumnDesc = $("<td>").text(project.description);
	var buttonUpdate = $("<button>").addClass("btn btn-primary").text("修改");
	var tColumnOperation = $("<td>").append(buttonUpdate);
	tr.append(tColumnProjectName).append(tColumnDeptName).append(tColumnDesc).append(tColumnOperation);
	return tr;
}


function progressBar(data){
	$("#progress").css("width","100%");
	setTimeout(() => {
		$.each(data.result,function(index,element){
			projectTable.append(getRow(element));
		});
		progressRoot.attr("hidden",true);
		projectTableRoot.attr("hidden",false);
		pbProjects.attr("hidden",true);
	}, 500);
}

var btnAddProject = $("#btnAddProject");
var projectTable = $("#project_table");
var btnSaveProject = $("#btnSaveProject");
var inputProjectName = $("#inputProjectName");
var projectTableRoot = $("#project_table_root");
var pbProjects = $("#pbProjects");


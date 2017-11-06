$(document).ready(function(){
	
	getAllDepts();
	
	setSubmitListener();
});


/*******global function*********/
function getAllDepts(){
	$.ajax({
		url:"/IssueFeedbackProject/allDepts",
		method:"get",
		success:function(data){
			progress.css("width","100%");
			if(data.errorCode == -1 ){
				setTimeout(() => {
					$.each(data.result,function(index,element){
						deptTable.append(getRow(element));
					});
					progressRoot.attr("hidden",true);
				}, 500);
				
			}
		}
	});
}

function setSubmitListener(){
	
	formAddDept.submit(function(event){
		event.preventDefault();
		progressRoot.attr("hidden",false);
		progress.css("width","25%");
		$.ajax({
			url:"/IssueFeedbackProject/addDept",
			method:"get",
			data:{
				dept_name:inputDeptName.val()
			},
			success:function(data){
				progress.css("width","100%");
				if(data.result){
					setTimeout(() => {
						insertRow(inputDeptName.val());
						showDialog();
						inputDeptName.val("");
						progressRoot.attr("hidden",true);
					}, 500);
				}	
			}
		})
	});
}

function insertRow(deptName){
	var row = $("<tr>");
	var tColumnDeptName = $("<td>").text(deptName);
	row.append(tColumnDeptName);
	deptTable.append(row);
}

function showDialog(deptName){
	$('.modal').modal({
		show:true
	});
}

function getRow(dept){
	var row = $("<tr>");
	var tColumnDeptName = $("<td>").text(dept.deptName);
	row.append(tColumnDeptName);
	return row;
}
var deptTable = $("#dept_table");
var formAddDept = $("#formAddDept");
var inputDeptName = $("#inputDeptName");

$(document).ready(function(){
	
	getAllDepts();
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

function getRow(dept){
	var row = $("<tr>");
	var tColumnDeptName = $("<td>").text(dept.deptName);
	var tColumnDeptId= $("<td>").text(dept.id);
	row.append(tColumnDeptName).append(tColumnDeptId);
	return row;
}
var deptTable = $("#dept_table");

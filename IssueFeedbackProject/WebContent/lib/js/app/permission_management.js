var curremtDeptId = -1;
$(document).ready(function(){
	
	initDeptDrawer();
	
});
function initDeptDrawer(){
	
	$.ajax({
		url:"/IssueFeedbackProject/AllDeptAjax",
		method:"get",
		success:function(data){
			$.each(data,function(index,element){
				$(".mdl-navigation").append(makeRowForDept(element));	
			});
			
			setListenerForDeptItem();
		}
	});
	$.ajax({
		url:"/IssueFeedbackProject/AllPermissionAjax",
		method:"get",
		success:function(data){
			$.each(data,function(index,element){
				$("#permissionListBody").append(makeRowForPermission(element));	
			});
			setListenerForDeptItem();
			
		}
	});
	

	
}
function makeRowForPermission(per){
	var row = $("<tr>");
	
	var label = $("<label>").addClass("mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect").attr("for","checkbox-"+per.id);
	
	var labelInput = $("<input>").attr("type","checkbox").attr("id","checkbox-"+per.id).addClass("mdl-checkbox__input");
	label.append(labelInput);
	var columnContent = $("<td>").append(label);
	var column = $("<td>").text(per.permissionName);
	row.append(columnContent);
	row.append(column);
	return row;
}

function setListenerForDeptItem(){
	$(".mdl-navigation__link").on("click",function(event){
		
		$.ajax({
			url:"/IssueFeedbackProject/GetDeptByIdAjax",
			method:"get",
			data:{
				id:event.target.id
			},
			success:function(data){
				curremtDeptId = event.target.id;
				
				$(".mdl-checkbox__input").prop("checked",false);
				currentPermission = [];
				$.each(data.permissionsList,function(index,element){
					$("#checkbox-"+element.id).prop("checked",true);
					currentPermission.push(element.id);
				});
				
			}
		});
		
		
	});
}

function makeRowForDept(dept){
	var row = $("<a>").addClass("mdl-navigation__link").attr("href","#").attr("id",dept.id).text(dept.deptName);
	return row;
}
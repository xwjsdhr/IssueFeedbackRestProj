$(document).ready(function(){
	$("#inlineSelectDepts").change(function(event){
		getUserByDeptId(event.target.value);
	});
});


function getUserByDeptId(id ){
	$.ajax({
		url:"/IssueFeedbackProject/DeptUsers",
		data:{
			dept_id:id
		},
		contentType: "application/json;charset=utf-8",
		success:function(data,event){
			$("#selectUsers").empty();
			var defaultElement = $("<option>").text("全部用户").attr("value","-1");
			$("#selectUsers").append(defaultElement);
			$.each(data,function(index,user){
				var element = $("<option>").text(user.realName).attr("value",user.id);
				$("#selectUsers").append(element);
			});
		}
	})
}
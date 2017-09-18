$(document).ready(function(){
	$("#inlineSelectDepts").change(function(event){
		getUserByDeptId(event.target.value);
	});
	
	$("#btnClickShow").on("click",function(event) {
		var arr = $(".selected");
		var idArr = [] ;
		$.each(arr,function(index,element){
			idArr.push($(element).val());
		});
		var strParam = "";
		$.each(idArr,function(index,element){
			if(index != idArr.length-1){
				strParam = strParam.concat(element+",");
			}else{
				strParam = strParam.concat(element);
			}
		});
			
		console.log(strParam);
		$.ajax({
			url:"/IssueFeedbackProject/Export",
			data:{
				arr:strParam
			},
			contentType: "application/json;charset=utf-8",
			success:function(data,event){
				console.log(idArr);
			}
		})
	});
	$(".selectedCheckbox").change(function(event){
		var element = event.target;
		if(element.checked){
			$(this).addClass("selected");
		}else{
			$(this).removeClass("selected");
		}
		
	});
});


function getUserByDeptId(id){
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

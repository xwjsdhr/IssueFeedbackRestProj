$(document).ready(function() {
	moment.locale("zh-cn");
	var tdArr = $(".last_update_time_td");
	
	$.each(tdArr,function(index,element){
		var dateStr = $(element).text();
		var relativeStr = moment(dateStr,"YYYY-MM-DD HH:mm:ss").fromNow();
		$(element).text(relativeStr);
	});
	
	
	$("#btnSearch").click(function(event){
		var input = $("#inputSearch");
		if(input.val().length()==0){
			return;
		}
	});
		
	$("#inlineSelectDepts").change(function(event) {
		getUserByDeptId(event.target.value);
	});

	$(".clickableRow").click(function(event) {
		var issueId = $(this).attr("id");
		if ($("#chb_" + issueId).prop("checked")) {
			$("#chb_" + issueId).prop("checked", false).change();
		} else {
			$("#chb_" + issueId).prop("checked", true).change();
		}

	});
	$("#btnClickShow").on("click", function(event) {
		var arr = $(".selected");
		var idArr = [];
		$.each(arr, function(index, element) {
			idArr.push($(element).val());
		});
		var strParam = "";
		$.each(idArr, function(index, element) {
			if (index != idArr.length - 1) {
				strParam = strParam.concat(element + ",");
			} else {
				strParam = strParam.concat(element);
			}
		});

		$.ajax({
			url : "/IssueFeedbackProject/Export",
			data : {
				arr : strParam
			},
			contentType : "application/json;charset=utf-8",
			success : function(data, event) {
				if (data.errorCode == -1) {
					window.location = "/IssueFeedbackProject/Download";
				}
			}
		})
	});
	
	$(".selectedCheckbox").change(function(event) {
		var element = event.target;
		if (element.checked) {
			$(this).addClass("selected");
		} else {
			$(this).removeClass("selected");
		}
	});
	$("#chb_order_type").change(function(event){
		var element = event.target;
		
		if(element.checked){
			$("#label_order_type").text("倒序");
		}else{
			$("#label_order_type").text("正序");
		}
	});
	
	
	
	
	
});

function getUserByDeptId(id) {
	$
			.ajax({
				url : "/IssueFeedbackProject/DeptUsers",
				data : {
					dept_id : id
				},
				contentType : "application/json;charset=utf-8",
				success : function(data, event) {
					$("#selectUsers").empty();
					var defaultElement = $("<option>").text("全部用户").attr(
							"value", "-1");
					$("#selectUsers").append(defaultElement);
					$.each(data, function(index, user) {
						var element = $("<option>").text(user.realName).attr(
								"value", user.id);
						$("#selectUsers").append(element);
					});
				}
			})
}

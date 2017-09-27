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

//	$(".clickableRow").click(function(event) {
//		var issueId = $(this).attr("id");
//		if ($("#chb_" + issueId).prop("checked")) {
//			$("#chb_" + issueId).prop("checked", false).change();
//		} else {
//			$("#chb_" + issueId).prop("checked", true).change();
//		}
//
//	});
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

var nim = NIM.getInstance({
    // debug: true,
    appKey: 'a6f737fcac6d69bbab3c36e10e4bb8e8',
    account: 'xiaweijia',
    onconnect: onConnect,
    onwillreconnect: onWillReconnect,
    ondisconnect: onDisconnect,
    onerror: onError
});

function onConnect() {
    console.log('连接成功');
}
function onWillReconnect(obj) {
    // 此时说明 SDK 已经断开连接, 请开发者在界面上提示用户连接已断开, 而且正在重新建立连接
    console.log('即将重连');
    console.log(obj.retryCount);
    console.log(obj.duration);
}
function onDisconnect(error) {
    // 此时说明 SDK 处于断开状态, 开发者此时应该根据错误码提示相应的错误信息, 并且跳转到登录页面
    console.log('丢失连接');
    console.log(error);
    if (error) {
        switch (error.code) {
        // 账号或者密码错误, 请跳转到登录页面并提示错误
        case 302:
            break;
        // 重复登录, 已经在其它端登录了, 请跳转到登录页面并提示错误
        case 417:
            break;
        // 被踢, 请提示错误后跳转到登录页面
        case 'kicked':
            break;
        default:
            break;
        }
    }
}
function onError(error) {
    console.log(error);
}

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

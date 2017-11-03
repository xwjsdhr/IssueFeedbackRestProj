$(document).ready(function() {
					moment.locale("zh-cn");
					var tdArr = $(".last_update_time_td");

					getIssue();

					initSearchBar();

					$.each(tdArr,
							function(index, element) {
								var dateStr = $(element).text();
								var relativeStr = moment(dateStr,
										"YYYY-MM-DD HH:mm:ss").fromNow();
								$(element).text(relativeStr);
							});

					$(".clickableRow")
							.on('click',
									function(event) {
										window.location.href = "/IssueFeedbackProject/IssueDetail?id="
												+ event.currentTarget.id;
									});

					$("#btnSearch").click(function(event) {
						var input = $("#inputSearch");
						if (input.val().length() == 0) {
							return;
						}
					});

					$("#inlineSelectDepts").change(function(event) {
						getUserByDeptId(event.target.value);
					});

					$("#btnClickShow")
							.on("click",
									function(event) {
										var arr = $(".selected");
										var idArr = [];
										$.each(arr, function(index, element) {
											idArr.push($(element).val());
										});
										var strParam = "";
										$.each(idArr, function(index, element) {
											if (index != idArr.length - 1) {
												strParam = strParam
														.concat(element + ",");
											} else {
												strParam = strParam
														.concat(element);
											}
										});

										$.ajax({url : "/IssueFeedbackProject/Export",
													data : {
														arr : strParam
													},
													contentType : "application/json;charset=utf-8",
													success : function(data,
															event) {
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
					$("#chb_order_type").change(function(event) {
						var element = event.target;

						if (element.checked) {
							$("#label_order_type").text("倒序");
						} else {
							$("#label_order_type").text("正序");
						}
					});

				});

function initSearchBar() {
	var list = $("#list-inline-status");
	$("#searchForm").submit(function(event) {
		event.preventDefault();
		var data = {
			statusId : $(".selectpicker").val(),
			year: $("#yearSelector").val(),
			week: $("#weekSelector").val()
		};
		$("#"+week).attr("selected",true);
		$("#"+year).attr("selected",true);
		console.log(data);
		$("#issue_table").attr("hidden", true);
		$("#pbIssues").attr("hidden", false);
		$.ajax({
			url : "/IssueFeedbackProject/searchIssue", //SearchIssueAjax
			method : "GET",
			dataType : "json",
			data : {
//				queryCondition : JSON.stringify(data)
				statusId : $(".selectpicker").val(),
				year: $("#yearSelector").val(),
				week: $("#weekSelector").val()
			},
			dataType : "json",
			success : function(data) {
				$("#mybody").empty();
				$.each(data, function(index, element) {
					var row = makeRowForIssue(element);
					$("#mybody").append(row);
				});
				setTimeout(function() {
					$("#issue_table").attr("hidden", false);
					$("#pbIssues").attr("hidden", true);
				}, 500);
			}
		});
	});
	
	var yearSelector = $("#yearSelector");
	var weekselector = $("#weekSelector");
	var date = new Date();
	var year = date.getFullYear();
	
	
	for (var i = year - 10; i < year; i++) {
		var yearOpt = $("<option>").text(i).val(i).attr("id",i);
		yearSelector.append(yearOpt);
	}
	for(var i = year ;i< year +10 ;i++){
		var yearOpt = $("<option>").text(i).val(i).attr("id",i);
		yearSelector.append(yearOpt);
	}
	
	for(var i = 1 ;i<= 53 ;i++){
		var optWeek = $("<option>").text(i).val(i).attr("id",i);
		weekselector.append(optWeek);
	}
	var week = moment().week();
	$("#"+week).attr("selected",true);
	$("#"+year).attr("selected",true);
	
	console.log(year);
	$.ajax({
		url : "/IssueFeedbackProject/allStatus",
		method : "GET",
		dataType : "json",
		success : function(data) {
			var default1 = $("<option value='-1'>").text("全部");
			$(".selectpicker").append(default1);
			$.each(data, function(index, element) {
				var item = makeListItemForStatus(element);
				$(".selectpicker").append(item);
			});

			setTimeout(function() {
				$("#issue_table").attr("hidden", false);
				$("#pbIssues").attr("hidden", true);
			}, 500);
		}
	});
}

function makeListItemForStatus(status) {
	var item = $("<option>").val(status.id).text(status.statusName);
	return item;
}
function getIssue() {
	$("#issue_table").attr("hidden", true);
	$("#pbIssues").attr("hidden", false);
	$.ajax({
		url : "/IssueFeedbackProject/allIssues",
		method : "GET",
		dataType : "json",
		success : function(data) {
			$.each(data, function(index, element) {
				var row = makeRowForIssue(element);
				$("#mybody").append(row);
			});
			setTimeout(function() {
				$("#issue_table").attr("hidden", false);
				$("#pbIssues").attr("hidden", true);
			}, 500);
		}
	});
}
/**
 * 
 * 
 * @param issue
 * @returns
 */
function makeRowForIssue(issue) {
	var trRow = $("<tr class='clickableRow' >").attr("id", issue.id);

	var checkboxTd = $("<td>");
	var checkbox = $("<input>").attr("id", "chb_" + issue.id).attr("type",
			"checkbox").val(issue.id).addClass("selectedCheckbox");
	checkboxTd.append(checkbox);

	var statusTd = $("<td>");

	var statusClassArr = [ "", "mdl-chip mdl-chip-unsovled",
			"mdl-chip mdl-chip-feedback", "mdl-chip mdl-chip-sovled",
			"mdl-chip mdl-chip-problem" ];

	var spanStatus = $("<span>").addClass(statusClassArr[issue.status.id]);

	var spanStatusChild = $("<span>").addClass("mdl-chip__text").html(
			issue.status.statusName)
	var spanCommentSize = $("<span class='badge badge-pill badge-info'>").text(
			issue.comments.length + "");
	spanStatus.append(spanStatusChild);

	statusTd.append(spanStatus);
	statusTd.append(spanCommentSize);

	var titleTd = $("<td>").text(issue.title);
	var submitTimeTd = $("<td>").text(issue.submitTime);
	var lastUpdateTimeTd = $("<td>").text(issue.lastUpdateTime);
	var realNameTd = $("<td>").text(issue.user.realName);
	var projectNameTd = $("<td>").text(issue.project.projectName);
	var deptNameTd = $("<td>").text(issue.project.dept.deptName);

	var tdLink = $("<td>");

	var aLink = $("<a>").addClass("btn btn-primary").text("查看").attr("href",
			"/IssueFeedbackProject/issue_detail?id=" + issue.id);
	tdLink.append(aLink);

	trRow.append(checkboxTd);
	trRow.append(statusTd);
	trRow.append(titleTd);
	trRow.append(submitTimeTd);
	trRow.append(lastUpdateTimeTd);
	trRow.append(realNameTd);
	trRow.append(projectNameTd);
	trRow.append(deptNameTd);
	trRow.append(tdLink);
	return trRow;
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

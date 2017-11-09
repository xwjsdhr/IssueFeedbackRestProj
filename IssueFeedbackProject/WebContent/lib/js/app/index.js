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
		$("#issue_table").attr("hidden", true);
		$("#pbIssues").attr("hidden", false);
		$.ajax({
			url : "/IssueFeedbackProject/searchIssue", //SearchIssueAjax
			method : "GET",
			dataType : "json",
			data : {
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
//					$("#pbIssues").attr("hidden", true);
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
	
	$.ajax({
		url : "/IssueFeedbackProject/allStatus",
		method : "GET",
		dataType : "json",
		success : function(data) {
			var default1 = $("<option value='-1'>").text("全部");
			$(".selectpicker").append(default1);
			$.each(data.result, function(index, element) {
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
	progress.css("width","65%");
	$.ajax({
		url : "/IssueFeedbackProject/allIssues",
		method : "GET",
		dataType : "json",
		success : function(data,textStatus,jqXHR) {
			
			progress.css("width","100%");
			$.each(data.result, function(index, element) {
				var row = makeRowForIssue(element);
				$("#mybody").append(row);
			});
			
			setTimeout(function() {
				
				$("#issue_table").attr("hidden", false);
//				$("#pbIssues").attr("hidden", true);
				progressRoot.attr("hidden",true);
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
	var commentIcon = $("<i>").addClass("material-icons").text("comment");
	var commentTd = $("<td>").append(commentIcon).append(spanCommentSize);

	statusTd.append(spanStatus);
	//statusTd.append(spanCommentSize);
	
	var titleTd = $("<td>").text(issue.title);
	var submitTimeTd = $("<td>").text(moment(issue.submitTime).fromNow());
	var lastUpdateTimeTd = $("<td>").text(moment(issue.lastUpdateTime).fromNow());
	var realNameTd = $("<td>").text(issue.user.realName);
	var projectNameTd = $("<td>").text(issue.project.projectName);
	var deptNameTd = $("<td>").text(issue.project.dept.deptName);
	var weekTd = $("<td>").text(issue.weekOfYear);

	var tdLink = $("<td>");

	var aLink = $("<a>").addClass("mdl-button mdl-js-button mdl-button--raised").text("查看").attr("href",
			"/IssueFeedbackProject/issue_detail?id=" + issue.id);
	tdLink.append(aLink);

	trRow.append(checkboxTd);
	trRow.append(commentTd);
	trRow.append(statusTd);
	trRow.append(titleTd);
	trRow.append(submitTimeTd);
	trRow.append(lastUpdateTimeTd);
	trRow.append(weekTd);
	trRow.append(realNameTd);
	trRow.append(projectNameTd);
	trRow.append(deptNameTd);
	trRow.append(tdLink);
	
	return trRow;
}


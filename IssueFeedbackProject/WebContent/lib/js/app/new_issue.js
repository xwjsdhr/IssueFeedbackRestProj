var textArea = CKEDITOR.instances['textareaIssueContent'];
var inputTitle = $("#inputIssueTitle");
var submitAddIssue = $("#submitAddIssue");
var pbAddIssue = $("#pbAddIssue");
$(document).ready(function() {
	CKEDITOR.replace('textareaIssueContent');

	$.ajax({
		url:"/IssueFeedbackProject/AllProjectsAjax",
		method:"get",
		dataType:"json",
		success:function(data){
			$(data).each(function(index,data){
				var option = $("<option>").text(data.projectName).val(data.id);
				$("#projectSelector").append(option);
			});
		}
	});
	
	
	$("#formAddIssue").submit(function(event) {
		event.preventDefault();
		var issueTitle = $("#inputIssueTitle").val();
		var issueContent = CKEDITOR.instances['textareaIssueContent'].getData();
		var issue = {
			title:issueTitle,
			content:issueContent,
			project:{
				id:$("#projectSelector").val()
			}
		};
		console.log(issue);
		pbAddIssue.attr("hidden",false);
		submitAddIssue.attr("hidden",true);
		$.ajax({
			url : "/IssueFeedbackProject/AddIssueAjax",
			method : "post",
			dataType: 'JSON',
			data : {
				issue:JSON.stringify(issue)
			},
			success : function(data) {
				pbAddIssue.attr("hidden",true);
				submitAddIssue.attr("hidden",false);
				
				window.location.href = "/IssueFeedbackProject/Index";
			}
		});
		
	});
	
	
	setListener();
});

function setListener(){
	var titleNotNull = false;
	var contentNotNull = false;
	submitAddIssue.attr("disabled",true);
	
	inputTitle.on("change",function(event){
		if(inputTitle.val().trim().length >0){
			titleNotNull = true;
		}else{
			titleNotNull = false;
		}
		updateSubmitStatus(titleNotNull,contentNotNull);
	});
	CKEDITOR.instances.textareaIssueContent.on("change",function(event){
		if(CKEDITOR.instances["textareaIssueContent"].getData().trim().length >0){
			contentNotNull = true;
		}else{
			contentNotNull = false;
		}
		updateSubmitStatus(titleNotNull,contentNotNull);
	});
	
	
}
function updateSubmitStatus(titleNotNull,contentNotNull){
	
	if(titleNotNull &&contentNotNull ){
		console.log("enable");
		submitAddIssue.prop("disabled",false);
	}else{
		console.log("disable");
		submitAddIssue.prop("disabled",true);
	}
}
$(document).ready(function() {
//	$('#textareaCommentContent').ckeditor();
	CKEDITOR.replace('textareaCommentContent',{
		filebrowserImageUploadUrl: '/IssueFeedbackProject/CommentImageUpload',
		filebrowserImageBrowseUrl: '/IssueFeedbackProject/ImageBrowser',
		toolbar :	// Sample toolbar
		    [
		        { name: 'document',    items : [ 'Source' ] },
		        { name: 'clipboard',   items : [ 'Cut','Copy','Paste','-','Undo','Redo' ] },
		        { name: 'basicstyles', items : [ 'Bold','Italic' ] },
		        { name: 'insert',      items : [ 'Link', 'Image', 'addFile', 'addImage' ] },
		        { name: 'tools',       items : [ 'Maximize' ] }
		    ],
	});
	$("#checkboxResovled").change(function(event) {
		var element = event.target;
		if (element.checked) {
			$("#checkboxProblem").prop("disabled", true);
		} else {
			$("#checkboxProblem").prop("disabled", false);
		}
	});

	var formReply = $("#formReply");
	formReply.submit(function(event) {
		event.preventDefault();

		var textArea = $("#textareaCommentContent");
		var issueDetailId = $("#issueDetailId");
		var desc = CKEDITOR.instances['textareaCommentContent'].getData();
		var checkboxResovled = $("#checkboxResovled");
		var checkboxProblem = $("#checkboxProblem");
		
		var pbAddComment = $("#pbAddComment");
		var btnSubmitAddComment = $("#btnSubmitAddComment");
		console.log(checkboxResovled.prop("checked"));
		console.log(checkboxProblem.prop("checked"));
		var comment = {
			content : desc,
			isResovleIssue : checkboxResovled.prop("checked") ? 1 : null,
			isProblem : checkboxProblem.prop("checked") ? 1 : null,
		};

		console.log(desc);
		btnSubmitAddComment.attr("hidden",true);
		pbAddComment.attr("hidden",false);
		$.ajax({
			url : "/IssueFeedbackProject/AddCommentRest",
			dataType : 'JSON',
			data : {
				issue_id : issueDetailId.val(),
				comm : JSON.stringify(comment)
			},
			method : "get",
			success : function(data) {
				console.log(data);
				addCommentToList(data);
				btnSubmitAddComment.attr("hidden",false);
				pbAddComment.attr("hidden",true);
			}
		});
	});

	$("#checkboxProblem").change(function(event) {
		var element = event.target;
		if (element.checked) {
			$("#checkboxResovled").prop("disabled", true);
		} else {
			$("#checkboxResovled").prop("disabled", false);
		}
	});

});

function addCommentToList(comment) {
	var item = $("<div class='media list-group-item'>");
	var pullRight = $("<p class='pull-right'>");
	var badge;
	if (comment.isResovleIssue == 1) {
		badge = $("<span class='badge badge-pill badge-success'>已解决</span>")
	} else if (comment.isProblem == 1) {
		badge = $("<span class='badge badge-pill badge-danger'>疑难问题</span>")
	}
	var small = $("<small>").append(comment.createTime);
	var clockIcon = $("  <i class='ion-clock'>")
	pullRight.append(clockIcon);
	pullRight.append(small);

	var mediaBody = $("<div class='media-body'>");
	var userName = $("<p class='user_name'>");
	var icon = $("<i class='ion-person'>");

	var realName = comment.user.realName;
	var content = comment.content;
	console.log(content);
	userName.append(icon);
	userName.append(realName);
	mediaBody.append(userName);
	mediaBody.append(content);

	item.append(pullRight);
	item.append(badge);
	item.append(mediaBody);

	$("#comment_list_div").append(item);

	CKEDITOR.instances["textareaCommentContent"].setData('');
}
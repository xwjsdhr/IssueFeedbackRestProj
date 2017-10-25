$(document).ready(function() {
	CKEDITOR.replace( 'textareaIssueContent' );
	$("#checkboxResovled").change(function(event){
		var element = event.target;
		if(element.checked){
			$("#checkboxProblem").prop("disabled",true);
		}else{
			$("#checkboxProblem").prop("disabled",false);
		}
	});

	var formReply = $("#formReply");
	formReply.submit(function(event){
		event.preventDefault();
		
		var textArea = $("#textareaIssueContent");
		var issueDetailId = $("#issueDetailId");
		var desc = CKEDITOR.instances['textareaIssueContent'].getData();
		var comment = {
			content:desc
		};
		
		console.log(desc);
		$.ajax({
			url:"/IssueFeedbackProject/AddCommentRest",
			dataType: 'JSON',
			data:{
				issue_id:issueDetailId.val(),
				comm:JSON.stringify(comment)
			},
			method:"get",
			success:function(data){
				//console.log(data);
				addCommentToList(data);
			}
		});
	});
	
	
	$("#checkboxProblem").change(function(event){
		var element = event.target;
		if(element.checked){
			$("#checkboxResovled").prop("disabled",true);
		}else{
			$("#checkboxResovled").prop("disabled",false);
		}
	});
	
	 
	 
	 
});

function addCommentToList(comment){
	var item  = $("<div class='media list-group-item'>");
	var pullRight = $("<p class='pull-right'>");
	var badge;
	if(comment.isResovleIssue == 1){
		badge = $("<span class='badge badge-pill badge-success'>已解决</span>")
	}else if(comment.isProblem == 1){
		badge = $("<span class='badge badge-pill badge-danger'>疑难问题</span>")
	}

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
}

/*
 <div class="media list-group-item">
						<p class="pull-right">
							<i class="ion-clock"></i> <small>${comment.createTime }</small>
						</p>
						<c:if test="${comment.isResovleIssue == 1 }">
							<span class="badge badge-pill badge-success">已解决</span>
						</c:if>
						<c:if test="${comment.isProblem == 1 }">
							<span class="badge badge-pill badge-danger">疑难问题</span>
						</c:if>

						<div class="media-body">
							<p class=" user_name">
								<i class="ion-person"></i> ${comment.user.realName }
							</p>
							${comment.content }
						</div>
					</div>

*/
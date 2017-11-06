<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>问题详情</title>
	<jsp:include page="/WEB-INF/css_common.jsp"></jsp:include>
	<link href="lib/css/app/issue_detail.css" rel="stylesheet">
	<link href="lib/css/app/common.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
	  
	  <jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	  
	  <main class="mdl-layout__content">
	    <div class="page-content">
	    	
	    	<div class="container">
	    	
		
		<div class="card" style="margin-top: 20px">
			<div class="card-header">${issue_detail.title } 
			
			<span class="mdl-chip"  style="background-color: #FFC107;">
			
			 <span class="mdl-chip__text ">${issue_detail.project.projectName}</span>
			 
			 </span>
				<c:choose>
					<c:when test="${issue_detail.status.id == 1 }">
						<span class="badge badge-pill badge-secondary">${issue_detail.status.statusName }</span>
					</c:when>
					<c:when test="${issue_detail.status.id == 2 }">
						<span class="badge badge-pill badge-warning">${issue_detail.status.statusName }</span>
					</c:when>
					<c:when test="${issue_detail.status.id == 3 }">
						<span class="badge badge-pill badge-success">${issue_detail.status.statusName }</span>
					</c:when>
					<c:when test="${issue_detail.status.id == 4 }">
						<span class="badge badge-pill badge-danger">${issue_detail.status.statusName }</span>
					</c:when>
				</c:choose>
			</div>
			<div class="card-body">
				<p class="card-text">${issue_detail.content }</p>
			</div>
			<div class="list-group list-group-flush" id="comment_list_div">

				<c:forEach items="${issue_detail.comments }" var="comment">

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
				</c:forEach>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					
					<c:if test="${fn:contains(user_session.dept.permissions,8) }">
					
					<!-- action="${pageContext.request.contextPath }/AddComment" -->
					
						<form id="formReply"
							method="get">
							<input type="hidden" name="issue_id" id="issueDetailId" value="${issue_detail.id }" />
							<input type="hidden" name="user_id" value="${user_session.id }" />
							<label style="margin-top: 20px" for="textareaCommentContent">回复描述</label>
							<textarea name="comment"  class="form-control"
								id="textareaCommentContent" rows="20"></textarea>

							<c:if test="${fn:contains(user_session.dept.permissions,9) }">
								<div class="form-check form-check-inline">
									<label style="margin-top: 20px" class="form-check-label"
										for="checkboxResovled"> <input type="checkbox"
										class="form-check-input" id="checkboxResovled"
										name="is_resovled"  /> 标记为已解决
									</label>
								</div>
							</c:if>

							<c:if test="${fn:contains(user_session.dept.permissions,10) }">
								<div class="form-check form-check-inline">
									<label class="form-check-label" style="margin-top: 20px">
										<input class="form-check-input" type="checkbox"
										id="checkboxProblem" name="is_problem"> 标记为未查出原因
									</label>
								</div>
							</c:if>

							
							<input style="margin-top: 20px; clear: left; float: none;"
								id="btnSubmitAddComment"
								class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="submit" value="回复">
							<div class="mdl-spinner mdl-js-spinner is-active" hidden="true" id="pbAddComment"></div>
						
						</form>

					</c:if>
				</div>

			</div>

		</div>
	</div>
   </div>
   </main>
</div>

	
</body>
<jsp:include page="/WEB-INF/script.jsp"></jsp:include>
<script type="text/javascript" src="lib/js/app/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="lib/js/app/ckeditor/adapters/jquery.js"></script>
<script type="text/javascript" src="lib/js/app/issue_details.js"></script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>问题详情</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet">
<link href="lib/css/app/issue_detail.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="/IssueFeedbackProject/Index">组长问题提交</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="/IssueFeedbackProject/Index">首页 <span class="sr-only">(current)</span>
					</a></li>

					<li class="nav-item"><a class="nav-link" href="#">${user_session.realName}</a>
					</li>
					<c:if test="${user_session.dept.id == 4 }">
						<li class="nav-item"><a class="nav-link"
						href="/IssueFeedbackProject/DeptManagement">部门管理</a>
					</li>
					</c:if>
					<li class="nav-item"><a class="nav-link"
						href="/IssueFeedbackProject/Logout">退出</a></li>
				</ul>
			</div>
		</nav>

		<div class="card" style="margin-top: 20px">
			<div class="card-header">${issue_detail.title }
				<c:choose>
					<c:when test="${issue_detail.status.id == 1 }">
						<span class="badge badge-pill badge-danger">${issue_detail.status.statusName }</span>
					</c:when>
					<c:when test="${issue_detail.status.id == 2 }">
						<span class="badge badge-pill badge-warning">${issue_detail.status.statusName }</span>
					</c:when>
					<c:when test="${issue_detail.status.id == 3 }">
						<span class="badge badge-pill badge-success">${issue_detail.status.statusName }</span>
					</c:when>
				</c:choose>

<!-- 
				<c:if test="${user_session.dept.id == 3 }">
					<form action="/" method="post" class="form-inline">
						<div class="form-group">
							<select class="form-control" name="status_id">
								<c:forEach items="${all_status }" var="status">
									<option value=${status.id }
										selected="${issue_detail.status.id == status.id  ? 'selected' :'' }"> ${status.statusName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group mx-sm-3">
							<input class="btn btn-primary" type="submit" value="修改" />
						</div>


					</form>

				</c:if>
 -->
			</div>
			<div class="card-body">

				<p class="card-text">${issue_detail.content }</p>
			</div>
			<div class="list-group list-group-flush">

				<c:forEach items="${comments }" var="comment">

					<div class="media list-group-item">
						<p class="pull-right">
							<small>${comment.createTime }</small>
						</p>
						<a class="media-left" href="#"> <img
							src="http://lorempixel.com/40/40/people/1/">
						</a>
						<div class="media-body">
							<p class=" user_name">${comment.user.realName }</p>
							${comment.content }
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<form action="/IssueFeedbackProject/AddComment" method="get">
						<input type="hidden" name="issue_id" value="${issue_detail.id }" />
						<input type="hidden" name="user_id" value="${user_session.id }" />
						<label style="margin-top: 20px" for="textareaIssueContent">回复描述</label>
						<textarea name="comment" class="form-control"
							id="textareaIssueContent" rows="3"></textarea>

						<input style="margin-top: 20px" class="btn btn-primary"
							type="submit" value="回复">
					</form>
				</div>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
</html>
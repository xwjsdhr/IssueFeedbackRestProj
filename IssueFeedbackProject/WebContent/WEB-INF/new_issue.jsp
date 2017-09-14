<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加问题</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet">
<link href="lib/css/app/index.css" rel="stylesheet">
</head>
<body>
	<div class="container">

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">组长问题提交</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
			    <ul class="navbar-nav mr-auto">
			      <li class="nav-item ">
			        <a class="nav-link" href="/IssueFeedbackProject/Index">首页 <span class="sr-only">(current)</span></a>
			      </li>
			      
			      <li class="nav-item active">
			        <a class="nav-link" href="/IssueFeedbackProject/NewIssue">添加问题</a>
			      </li>
			      
			      <li class="nav-item">
			       <a class="nav-link" href="/IssueFeedbackProject/UserInfo">${user_session.realName}</a>
			      </li>
			      <c:if test="${user_session.dept.id == 4 }">
						<li class="nav-item"><a class="nav-link"
						href="/IssueFeedbackProject/DeptManagement">部门管理</a>
					</li>
					</c:if>
			      <li class="nav-item">
					  <a class="nav-link" href="/IssueFeedbackProject/Logout">退出</a>
			      </li>
			    </ul>
			   
			  </div>
		</nav>
		<div class="row ">
			<div class="col-md-12 panel ">
				<form action="/IssueFeedbackProject/AddIssue" method="post">
					<div class="form-froup">
						<label for="inputIssueTitle">问题标题</label> 
						<input
							id="inputIssueTitle" type="text" class="form-control" name="title"/>
							<label style="margin-top: 20px" for="textareaIssueContent">问题描述</label> 
							
						<textarea name="content" class="form-control" id="textareaIssueContent" rows="3"></textarea>
							
							<input style="margin-top: 20px" class="btn btn-primary" type="submit" value="提交"/>
					</div>

				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
</html>
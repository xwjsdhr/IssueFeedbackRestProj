<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet">
<link href="lib/css/app/index.css" rel="stylesheet">
</head>
<body>
	<div class="container">

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">组长问题提交</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link"
						href="/IssueFeedbackProject/Index">
						<img alt="name" src="icon/ic_home_black_24px.svg">
						首页 
					</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 问题管理 </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="nav-link" href="/IssueFeedbackProject/NewIssue">添加问题</a>
							<c:if test="${user_session.dept.id == 4 }">
								<a class="nav-link" href="/IssueFeedbackProject/TrashBin">回收站</a>
							</c:if>
						</div></li>

					<c:if test="${user_session.dept.id == 4 }">

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle"
							href="/IssueFeedbackProject/UserManagement"
							id="navbarDropdownMenuLink" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> 用户管理 </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="#">添加用户</a>
							</div></li>
						<li class="nav-item active"><a class="nav-link"
							href="/IssueFeedbackProject/DeptManagement">部门管理</a></li>

					</c:if>


				</ul>
				<div class="btn-group " role="group">
					<a class="btn btn-link" href="/IssueFeedbackProject/UserInfo">${user_session.realName}</a>
					<a class="nav-link" href="/IssueFeedbackProject/Logout">退出</a>
				</div>

			</div>
		</nav>
		<div class="row ">
			<div class="col-md-12 panel ">
				<form action="/IssueFeedbackProject/AddUser" method="post">
					<div class="form-froup">
						<label style="margin-top: 20px" for="inputIssueTitle">部门名称</label> 
						<input id="inputIssueTitle" type="text" class="form-control" name="user_name"/>
						<label style="margin-top: 20px" for="inputIssueTitle">密码</label> 
						<input id="inputIssueTitle" type="password" class="form-control" name="password"/>
						<label style="margin-top: 20px" for="inputRealName">姓名</label> 	
						<input type="text" id="inputRealName" class="form-control" name="real_name"/>
						
						<input style="margin-top: 20px" class="btn btn-primary" type="submit" value="注册"/>
					</div>

				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="lib/js/popper.min.js"></script>
<script type="text/javascript" src="lib/js/jquery-slim.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
</html>
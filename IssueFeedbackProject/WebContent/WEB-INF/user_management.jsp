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
<link href="lib/css/app/common.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="container">

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">组长问题提交</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath }/Index">
						<img alt="name" src="icon/ic_home_black_24px.svg">首页 <span class="sr-only">(current)</span>
					</a></li>

					<li class="nav-item"><a class="nav-link"
						href="/IssueFeedbackProject/NewIssue">添加问题</a></li>

					<c:if test="${user_session.dept.id == 4 }">
					
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath }/UserManagement" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						          	用户管理
						        </a>
						        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						          <a class="dropdown-item" href="#">添加用户</a>
						        </div>
							</li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath }/DeptManagement">部门管理</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath }/TrashBin">回收站</a></li>
					</c:if>

				</ul>
				 <div class="btn-group " role="group">
				 <a class="btn btn-link"
						href="${pageContext.request.contextPath }/UserInfo">${user_session.realName}</a>
						<a class="nav-link"
						href="${pageContext.request.contextPath }/Logout">退出</a>
				 </div>

			</div>
		</nav>

		<div class="row ">
			<div class="col-md-12 panel "></div>
		</div>
	</div>
</body>
<script type="text/javascript" src="lib/js/popper.min.js"></script>
<script type="text/javascript" src="lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
</html>
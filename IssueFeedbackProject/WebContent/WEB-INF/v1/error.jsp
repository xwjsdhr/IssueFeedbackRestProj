<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组长问题提交首页</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet"/>
<link href="lib/css/app/index.css" rel="stylesheet" type="text/css"/>
<link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
      rel="stylesheet"/>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">组长问题提交</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="${pageContext.request.contextPath }/Index">
						<i class="ion-home"></i>
						首页
					</a>
					</li>
					<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink1" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false" style="vertical-align: middle;">
						<i class="ion-help-circled"></i> 
						 问题管理</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink1">
							<a class="dropdown-item" href="${pageContext.request.contextPath }/NewIssue">
							<i class="ion-plus"></i>
							添加问题</a>
							<c:if test="${user_session.dept.id == 4 }">
								<a class="dropdown-item" href="${pageContext.request.contextPath }/TrashBin">
								<i class="ion-trash-a"></i>
								回收站</a>
							</c:if>
						</div></li>

					<c:if test="${user_session.dept.id == 4 }">
						<li class="nav-item dropdown">
						
							<a class="nav-link dropdown-toggle"
							href="${pageContext.request.contextPath }/UserManagement"
							id="navbarDropdownMenuLink2" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">
							<i class="ion-person-stalker"></i>
							 用户管理 </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink2">
								<a class="dropdown-item" href="${pageContext.request.contextPath }/Register">
								<i class="ion-person-add"></i>
								添加用户</a>
							</div></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath }/DeptManagement">
							<i class="ion-ios-people"></i>
							部门管理</a></li>

					</c:if>

				</ul>
				<form action="${pageContext.request.contextPath }/Index" method="get"
					class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" name="keyword" type="text"
						placeholder="请输入关键字" aria-label="Search" value="${keyword }" />
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索
					<i class="ion-search"></i>
					</button>
				</form>

				<div class="btn-group " role="group">
				
					<a class="btn btn-link" href="${pageContext.request.contextPath }/UserInfo">
					<i class="ion-person"></i>
					${user_session.realName}</a>
					<a class="btn btn-link" href="${pageContext.request.contextPath }/Logout">
					退出
					<i class="ion-log-out"></i>
					</a>
				</div>
			</div>
		</nav>
		<div class="row ">
			<div class="col-md-12 panel">
				<div class="alert alert-warning" role="alert">
				  ${error.msg }
				</div>
				<a class="btn btn-primary" href="${error.backAddr }">返回</a>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="lib/js/popper.min.js"></script>
<script type="text/javascript" src="lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/js/index.js"></script>


</html>
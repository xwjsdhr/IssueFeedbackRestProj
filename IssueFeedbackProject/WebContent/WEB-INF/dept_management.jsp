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
<link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
      rel="stylesheet"/>
</head>
<body>
	<div class="container">

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">组长问题提交</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link"
						href="/IssueFeedbackProject/Index">
						<i class="ion-home"></i> 首页 <span class="sr-only">(current)</span>
					</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 
						<i class="ion-help-circled"></i> 问题管理 </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="/IssueFeedbackProject/NewIssue">
							<i class="ion-plus"></i>
							添加问题</a>
							<c:if test="${user_session.dept.id == 4 }">
								<a class="dropdown-item" href="/IssueFeedbackProject/TrashBin">
								<i class="ion-trash-a"></i>
								回收站</a>
							</c:if>
						</div></li>

					<c:if test="${user_session.dept.id == 4 }">

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle"
							href="/IssueFeedbackProject/UserManagement"
							id="navbarDropdownMenuLink" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">
							<i class="ion-person-stalker"></i>
							 用户管理 </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="#">
								<i class="ion-person-add"></i>
								添加用户</a>
							</div></li>
						<li class="nav-item active"><a class="nav-link"
							href="/IssueFeedbackProject/DeptManagement">
							<i class="ion-ios-people"></i>
							部门管理</a></li>

					</c:if>


				</ul>
				<div class="btn-group " role="group">
					<a class="btn btn-link" href="/IssueFeedbackProject/UserInfo">
					<i class="ion-person"></i>${user_session.realName}</a>
					<a class="nav-link" href="/IssueFeedbackProject/Logout">退出
					<i class="ion-log-out"></i></a>
				</div>

			</div>
		</nav>

		<div class="row ">
			<div class="col-md-12 panel"> 
				<form action="/IssueFeedbackProject/AddDept" class="form-inline" method="get">
					<div class="form-group mx-sm-3">
						<label  for="inputDeptName " class="sr-only">部门名称</label>
						<input class="form-control" id="" type="text" placeholder="部门名称" name="dept_name"/>
					</div>
					<input type="submit" class="btn btn-primary" value="添加"/>
				</form>
			</div>
		</div>
		<div class="row ">
			<div class="col-md-12 panel ">
				<table class="table table-hover table-bordered">

					<thead>
						<tr>
							<td>部门Id</td>
							<td>部门名称</td>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${all_depts }" var="dept">
							<tr>
								<td>${dept.id }</td>
								<td>${dept.deptName }</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="lib/js/popper.min.js"></script>
<script type="text/javascript" src="lib/js/jquery-slim.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
</html>
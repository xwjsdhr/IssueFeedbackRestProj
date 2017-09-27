<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet">

<link
	href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" />
<link href="lib/css/material/material.css" rel="stylesheet" />
<link href="lib/css/app/common.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
		<header class="mdl-layout__header">
			<div class="mdl-layout__header-row">
				<!-- Title -->
				<span class="mdl-layout-title">组长问题提交</span>
				<!-- Add spacer, to align navigation to the right -->
				<div class="mdl-layout-spacer"></div>
				<!-- Navigation. We hide it in small screens. -->
				<nav class="mdl-navigation mdl-layout--large-screen-only">

					<a class="mdl-navigation__link"
						href="${pageContext.request.contextPath }/Index"> <i
						class="ion-home"></i> 首页
					</a>
					<button id="demo-menu-lower-left" class="mdl-button mdl-js-button"
						style="color: white;">
						<i class="ion-help-circled"></i> 问题管理
					</button>

					<ul
						class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
						for="demo-menu-lower-left">
						<li class="mdl-menu__item"><a
							href="${pageContext.request.contextPath }/NewIssue">添加问题</a></li>
						<c:if test="${user_session.dept.id == 4 }">
							<li class="mdl-menu__item"><a
								href="${pageContext.request.contextPath }/TrashBin"> <i
									class="ion-trash-a"></i> 回收站
							</a></li>
						</c:if>
					</ul>
					<c:if test="${user_session.dept.id == 4 }">
						<button id="demo-menu-lower-user" class="mdl-button mdl-js-button"
							style="color: white;">
							<i class="ion-person-stalker"></i> 用户管理
						</button>
						<ul
							class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
							for="demo-menu-lower-user">
							<li class="mdl-menu__item"><a
								href="${pageContext.request.contextPath }/Register">添加用户</a></li>
						</ul>

						<a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/DeptManagement"> <i
							class="ion-ios-people"></i> 部门管理
						</a>

						<a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/Statistics"> <i
							class="ion-stats-bars"></i> 统计管理
						</a>
					</c:if>

					<a class="mdl-navigation__link"
						href="${pageContext.request.contextPath }/UserInfo"> <i
						class="ion-person"></i> ${user_session.realName}
					</a> <a class="mdl-navigation__link"
						href="${pageContext.request.contextPath }/Logout"> 退出 <i
						class="ion-log-out"></i>
					</a>



				</nav>

			</div>

		</header>

		<main class="mdl-layout__content">
		<div class="page-content">

			<div class="mdl-grid" style="margin-top: 20px">
			<div class=" mdl-cell mdl-cell--1-col "></div>
				<div class=" mdl-cell mdl-cell--10-col ">
					<form action="${pageContext.request.contextPath }/AddDept"
						class="form-inline" method="get">
						<div class="form-group mx-sm-3">
							<label for="inputDeptName " class="sr-only">部门名称</label> <input
								class="form-control" id="" type="text" placeholder="部门名称"
								name="dept_name" />
						</div>
						<input type="submit"
							class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"
							value="添加" />
					</form>
				</div>
			</div>

			<div class="mdl-grid" style="margin-top: 20px">
				<div class="mdl-cell mdl-cell--1-col"></div>
				<table
					class="mdl-cell mdl-cell--10-col mdl-data-table mdl-js-data-table mdl-shadow--2dp table-bordered">

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
		</main>
	</div>


</body>
<script type="text/javascript" src="lib/js/popper.min.js"></script>
<script type="text/javascript" src="lib/js/jquery-slim.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/js/material/material.js"></script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组长问题提交首页</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet" />

<link
	href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.yellow-amber.min.css" />
<link href="lib/css/material/material.css" rel="stylesheet" />
<link href="lib/css/app/index.css" rel="stylesheet" type="text/css" />
<link href="lib/css/app/common.css" rel="stylesheet" type="text/css" />

</head>
<body>

				<div class="float-over-bottom">
					<button type="button" id="btnAddDept" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent"
					 data-toggle="modal" >
					   添加部门
					</button>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" data-dismiss="modal">Close</button>
				        <button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent">Save changes</button>
				      </div>
				    </div>
				  </div>
				</div>
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
		<header class="mdl-layout__header">
			<div class="mdl-layout__header-row">
			
			
				<!-- Title -->
				<span class="mdl-layout-title">组长问题提交</span>
				<!-- Add spacer, to align navigation to the right -->
				<div class="mdl-layout-spacer"></div>
				<!-- Navigation. We hide it in small screens. -->
				<nav class="mdl-navigation mdl-layout--large-screen-only">

					<a class="mdl-navigation__link" href="${pageContext.request.contextPath }/Index"> <i class="ion-home"></i>
						首页
					</a>
					<button id="demo-menu-lower-issue" class="mdl-button mdl-js-button"
						style="color: white;">
						<i class="ion-help-circled"></i> 问题管理
					</button>

					<ul
						class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
						for="demo-menu-lower-issue">
						<li >
							<a class="mdl-menu__item"
								href="${pageContext.request.contextPath }/NewIssue"> <i
									class="ion-plus"></i> 添加问题
							</a>
						</li>
						<c:if test="${user_session.dept.id == 4 }">
							<li >
								<a class="mdl-menu__item"
									href="${pageContext.request.contextPath }/TrashBin"> 
									<i class="ion-trash-a"></i> 回收站
								</a>
							</li>
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
							<li ><a class="mdl-menu__item"
								href="${pageContext.request.contextPath }/Register"> <i
									class="ion-plus"></i> 添加用户
							</a></li>
						</ul>

						<a class="mdl-navigation__link"
							href="#"> <i
							class="ion-ios-people"></i> 部门管理
						</a>

						<%-- <a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/Statistics"> <i
							class="ion-stats-bars"></i> 统计管理
						</a> --%>
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
			
		
			
			<div class="mdl-grid">
				<div class="mdl-cell mdl-cell--1-col"></div>
				<table
					class="mdl-cell mdl-cell--10-col mdl-data-table mdl-js-data-table mdl-shadow--2dp">
					<thead>

						<tr>

							<td>编号</td>
							<td>项目</td>
							<td>管理部门</td>
						</tr>

					</thead>

					<tbody>

						<c:forEach items="${allProject }" var="project">
							<tr >
								<td>${project.id }</td>
								<td>${project.projectName }</td>
								<td>${project.dept.deptName}</td>
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
<script type="text/javascript" src="lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/js/moment.js"></script>
<script type="text/javascript" src="lib/js/zh-cn.js"></script>
<script type="text/javascript" src="lib/js/material/material.js"></script>
<script type="text/javascript" src="lib/js/app/project_management.js"></script>


</html>
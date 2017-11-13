<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link href="lib/css/sb-admin.css" rel="stylesheet"> -->
<link href="${pageContext.request.contextPath}/lib/css/app/header.css" rel="stylesheet">
<!-- <link href="lib/js/font-awesome/css/font-awesome.min.css"  rel="stylesheet" type="text/css"> -->
<style type="text/css">
body{
	background-color: #E4EAF5;
}
</style>
</head>

<header class="mdl-layout__header">
			<div class="mdl-layout__header-row">
				<!-- Title -->
				<span class="mdl-layout-title">组长问题提交</span>
				<!-- Add spacer, to align navigation to the right -->
				<div class="mdl-layout-spacer"></div>
				<!-- Navigation. We hide it in small screens. -->
				<nav class="mdl-navigation mdl-layout--large-screen-only">

					<a class="mdl-navigation__link" href="${pageContext.request.contextPath}/v1/index">
						<i class="material-icons">home</i>
						首页
					</a>
					<c:if test="${fn:contains(user_session.dept.permissions,2) }">
						<button id="demo-menu-lower-issue" class="mdl-button mdl-js-button"
							style="color: white;">
							<i class="material-icons">help_outline</i> 问题管理
						</button>
	
						<ul
							class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
							for="demo-menu-lower-issue">
							<li><a class="mdl-menu__item"
								href="${pageContext.request.contextPath }/v1/new_issue"> <i
									class="ion-plus"></i> 添加问题
							</a></li>
						</ul>
					
					</c:if>
					
					<c:if test="${fn:contains(user_session.dept.permissions,3)}">
						<button id="demo-menu-lower-user" class="mdl-button mdl-js-button"
							style="color: white;">
							<i class="material-icons">person_outline</i> 用户管理
						</button>
						<ul
							class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
							for="demo-menu-lower-user">
							<li>
								<a class="mdl-menu__item"
									href="${pageContext.request.contextPath }/v1/register">  添加用户
								</a>
								
							</li>
							<li>
								<a class="mdl-menu__item"
									href="${pageContext.request.contextPath }/v1/user_management"> 
									 用户管理
								</a>
							</li>
						</ul>
					</c:if>
					
					<c:if test="${fn:contains(user_session.dept.permissions,4)}">
						
						<a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/v1/dept_management"><i class="material-icons">people_outline</i> 部门管理
						</a>
	
					</c:if>
					
					<c:if test="${fn:contains(user_session.dept.permissions,5)}">
						<a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/v1/project_management">
							<i class="material-icons">assignment</i> 项目管理
						</a>
					
					</c:if>
					
					<c:if test="${fn:contains(user_session.dept.permissions,6)}">
						<a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/v1/statistics"> <i class="material-icons">insert_chart</i> 统计管理
						</a> 
					
					</c:if>
					
					<c:if test="${fn:contains(user_session.dept.permissions,7)}">
						<a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/v1/permission_management"><i class="material-icons">pan_tool</i> 权限管理
						</a> 
					</c:if>
					
					
					<button id="demo-menu-lower-user1" class="mdl-button mdl-js-button"
						style="color: white;">
						<i class="material-icons">person</i>
						${user_session.realName}
					</button>
					<ul
						class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
						for="demo-menu-lower-user1">
						<li>
							<a class="mdl-menu__item"
								href="${pageContext.request.contextPath }/v1/user_info">个人信息
							</a>
							 <a class="mdl-menu__item"
								href="${pageContext.request.contextPath }/v1/update_pwd"> 
								 修改密码
							</a> 
						</li>
					</ul>

					<a class="mdl-navigation__link"
						href="#" id="btnLogout"> 退出 <i class="material-icons">exit_to_app</i>
					</a>
				</nav>

			</div>

		</header>
		<c:if test="${fn:contains(user_session.dept.permissions,11)}">
		
			<div class="mdl-layout__drawer">
			    <span class="mdl-layout-title">系统设置</span>
			    <nav class="mdl-navigation">
			      <a class="mdl-navigation__link" href="${pageContext.request.contextPath }/v1/sys_params">系统参数</a>
			      <a class="mdl-navigation__link" href="">Link</a>
			      <a class="mdl-navigation__link" href="">Link</a>
			      <a class="mdl-navigation__link" href="">Link</a>
			    </nav>
			  </div>
		
		</c:if>
		<div class="progress" id="progressRoot">
		  <div class="progress-bar bg-warning" role="progressbar" id="progress" style="width: 25%;height: 10px" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
		</div>
		 
    
     <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/externals/jquery/jquery-3.2.1.min.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v1/header.js"></script>	 
</html>
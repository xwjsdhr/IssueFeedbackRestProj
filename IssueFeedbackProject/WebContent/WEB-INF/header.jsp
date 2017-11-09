<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

					<a class="mdl-navigation__link" href="${pageContext.request.contextPath}/index">
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
								href="${pageContext.request.contextPath }/new_issue"> <i
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
									href="${pageContext.request.contextPath }/register">  添加用户
								</a>
								
							</li>
							<li>
								<a class="mdl-menu__item"
									href="${pageContext.request.contextPath }/user_management"> 
									 用户管理
								</a>
							</li>
						</ul>
					</c:if>
					
					<c:if test="${fn:contains(user_session.dept.permissions,4)}">
						
						<a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/dept_management"><i class="material-icons">people_outline</i> 部门管理
						</a>
	
					</c:if>
					
					<c:if test="${fn:contains(user_session.dept.permissions,5)}">
						<a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/project_management">
							<i class="material-icons">assignment</i> 项目管理
						</a>
					
					</c:if>
					
					<c:if test="${fn:contains(user_session.dept.permissions,6)}">
						<a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/Statistics"> <i class="material-icons">insert_chart</i> 统计管理
						</a> 
					
					</c:if>
					
					<c:if test="${fn:contains(user_session.dept.permissions,7)}">
						<a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/permission_management"><i class="material-icons">pan_tool</i> 权限管理
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
								href="${pageContext.request.contextPath }/user_info">个人信息
							</a>
							 <a class="mdl-menu__item"
								href="${pageContext.request.contextPath }/update_pwd"> 
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
			      <a class="mdl-navigation__link" href="${pageContext.request.contextPath }/sys_params">系统参数</a>
			      <a class="mdl-navigation__link" href="">Link</a>
			      <a class="mdl-navigation__link" href="">Link</a>
			      <a class="mdl-navigation__link" href="">Link</a>
			    </nav>
			  </div>
		
		</c:if>
		
		
		<!-- <div class="progress" id="progressRoot">
		  <div class="progress-bar progress-bar-striped progress-bar-animated"
		   role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 35%" id="progress"></div>
		</div> -->
		
		<!-- <div id="progressRoot" class="mdl-progress mdl-js-progress" style="height: 10px"></div> -->
		<div class="progress" id="progressRoot">
		  <div class="progress-bar bg-warning" role="progressbar" id="progress" style="width: 25%;height: 10px" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
		</div>
		
		<script type="text/javascript" src="lib/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="lib/js/app/header.js"></script>
</html>
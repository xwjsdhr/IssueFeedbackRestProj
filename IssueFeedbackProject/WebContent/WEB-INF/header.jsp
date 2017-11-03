<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<header class="mdl-layout__header">
			<div class="mdl-layout__header-row">
				<!-- Title -->
				<span class="mdl-layout-title">组长问题提交</span>
				<!-- Add spacer, to align navigation to the right -->
				<div class="mdl-layout-spacer"></div>
				<!-- Navigation. We hide it in small screens. -->
				<nav class="mdl-navigation mdl-layout--large-screen-only">

					<a class="mdl-navigation__link" href="${pageContext.request.contextPath}/index"> <i class="ion-home"></i>
						首页
					</a>
					<c:if test="${fn:contains(user_session.dept.permissions,2) }">
						<button id="demo-menu-lower-issue" class="mdl-button mdl-js-button"
							style="color: white;">
							<i class="ion-help-circled"></i> 问题管理
						</button>
	
						<ul
							class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
							for="demo-menu-lower-issue">
							<li><a class="mdl-menu__item"
								href="${pageContext.request.contextPath }/new_issue"> <i
									class="ion-plus"></i> 添加问题
							</a></li>
							<c:if test="${user_session.dept.id == 4 }">
								<li><a class="mdl-menu__item"
									href="${pageContext.request.contextPath }/TrashBin"> <i
										class="ion-trash-a"></i> 回收站
								</a></li>
							</c:if>
						</ul>
					
					</c:if>
					
					<c:if test="${fn:contains(user_session.dept.permissions,3)}">
						<button id="demo-menu-lower-user" class="mdl-button mdl-js-button"
							style="color: white;">
							<i class="ion-person-stalker"></i> 用户管理
						</button>
						<ul
							class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
							for="demo-menu-lower-user">
							<li>
								<a class="mdl-menu__item"
									href="${pageContext.request.contextPath }/register"> <i
										class="ion-plus"></i> 添加用户
								</a>
								<a class="mdl-menu__item"
									href="${pageContext.request.contextPath }/user_management"> 
									 用户管理
								</a>
							</li>
						</ul>
					</c:if>
					
					<c:if test="${fn:contains(user_session.dept.permissions,4)}">
						
						<a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/dept_management"> <i
							class="ion-ios-people"></i> 部门管理
						</a>
	
					</c:if>
					
					<c:if test="${fn:contains(user_session.dept.permissions,5)}">
						<a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/project_management">
							<i class="ion-stats-bars"></i> 项目管理
						</a>
					
					</c:if>
					
					<c:if test="${fn:contains(user_session.dept.permissions,6)}">
						<a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/Statistics"> <i
							class="ion-stats-bars"></i> 统计管理
						</a> 
					
					</c:if>
					
					<c:if test="${fn:contains(user_session.dept.permissions,7)}">
						<a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/permission_management"> <i
							class="ion-stats-bars"></i> 权限管理
						</a> 
					</c:if>
					
					<a class="mdl-navigation__link"
						href="${pageContext.request.contextPath }/user_info"> <i
						class="ion-person"></i> ${user_session.realName}
					</a> <a class="mdl-navigation__link"
						href="${pageContext.request.contextPath }/Logout"> 退出 <i
						class="ion-log-out"></i>
					</a>
				</nav>

			</div>

		</header>
</html>
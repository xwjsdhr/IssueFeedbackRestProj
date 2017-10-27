<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>问题详情</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet">

<link
	href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" />
	<link href="lib/css/material/material.css" rel="stylesheet" />
	<link href="lib/css/app/issue_detail.css" rel="stylesheet">
	<link href="lib/css/app/common.css" rel="stylesheet" type="text/css"/>
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
						class="ion-person"></i> 首页
			</a>
	        <button id="demo-menu-lower-left"
        		class="mdl-button mdl-js-button" style="color: white;">
			  <i class="ion-help-circled"></i>  问题管理
			</button>
			
			<ul class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
			    for="demo-menu-lower-left">
			  <li class="mdl-menu__item">
			  	<a href="${pageContext.request.contextPath }/NewIssue">添加问题</a>
			  </li>
				 <c:if test="${user_session.dept.id == 4 }">
				 	<li class="mdl-menu__item">
						<a href="${pageContext.request.contextPath }/TrashBin"> <i
							class="ion-trash-a"></i> 回收站
						</a>
					</li>
				</c:if>
			</ul>
			<c:if test="${user_session.dept.id == 4 }">
				 <button id="demo-menu-lower-user"
	        		class="mdl-button mdl-js-button" style="color: white;">
	        		<i class="ion-person-stalker"></i>
				  用户管理
				</button>
				<ul class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
				    for="demo-menu-lower-user">
				  <li class="mdl-menu__item">
				  	<a href="${pageContext.request.contextPath }/Register">添加用户</a>
				  </li>
				</ul>
				
				<a class="mdl-navigation__link" href="${pageContext.request.contextPath }/DeptManagement">
				<i class="ion-ios-people"></i>
				部门管理</a>
				
				<a class="mdl-navigation__link" href="${pageContext.request.contextPath }/Statistics"> <i
									class="ion-stats-bars"></i> 统计管理</a>
			</c:if>
			
			<a class="mdl-navigation__link"
						href="${pageContext.request.contextPath }/UserInfo"> <i
						class="ion-person"></i> ${user_session.realName}
					</a>
	         <a class="mdl-navigation__link"
						href="${pageContext.request.contextPath }/Logout"> 退出 <i
						class="ion-log-out"></i>
					</a>
	        
	        
	        
	      </nav>
	      	
	    </div>
	    
	  </header>
	  
	  <main class="mdl-layout__content">
	    <div class="page-content">
	    	
	    	<div class="container">
	    	<!-- 
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath }/Index">组长问题提交</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="${pageContext.request.contextPath }/Index"> <i
							class="ion-home"></i> 首页 <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="ion-help-circled"></i> 问题管理
					</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="nav-link"
								href="${pageContext.request.contextPath }/NewIssue"> <i
								class="ion-plus"></i> 添加问题
							</a>
							<c:if test="${user_session.dept.id == 4 }">
								<a class="nav-link"
									href="${pageContext.request.contextPath }/TrashBin"> <i
									class="ion-trash-a"></i> 回收站
								</a>
							</c:if>
						</div></li>

					<c:if test="${user_session.dept.id == 4 }">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath }/DeptManagement"> <i
								class="ion-ios-people"></i> 部门管理
						</a></li>
					</c:if>

				</ul>
				<div class="btn-group " role="group">
					<a class="btn btn-link"
						href="${pageContext.request.contextPath }/UserInfo"> <i
						class="ion-person"></i> ${user_session.realName}
					</a> <a class="nav-link"
						href="${pageContext.request.contextPath }/Logout">退出 <i
						class="ion-log-out"></i>
					</a>
				</div>
			</div>
		</nav>
 -->
		
		<div class="card" style="margin-top: 20px">
			<div class="card-header">${issue_detail.title } 
			
			<span class="mdl-chip"  style="background-color: #FFC107;">
			
			 <span class="mdl-chip__text ">${issue_detail.project.projectName}</span>
			 
			 </span>
				<c:choose>
					<c:when test="${issue_detail.status.id == 1 }">
						<span class="badge badge-pill badge-secondary">${issue_detail.status.statusName }</span>
					</c:when>
					<c:when test="${issue_detail.status.id == 2 }">
						<span class="badge badge-pill badge-warning">${issue_detail.status.statusName }</span>
					</c:when>
					<c:when test="${issue_detail.status.id == 3 }">
						<span class="badge badge-pill badge-success">${issue_detail.status.statusName }</span>
					</c:when>
					<c:when test="${issue_detail.status.id == 4 }">
						<span class="badge badge-pill badge-danger">${issue_detail.status.statusName }</span>
					</c:when>
				</c:choose>
			</div>
			<div class="card-body">

				<p class="card-text">${issue_detail.content }</p>
			</div>
			<div class="list-group list-group-flush" id="comment_list_div">

				<c:forEach items="${comments }" var="comment">

					<div class="media list-group-item">
						<p class="pull-right">
							<i class="ion-clock"></i> <small>${comment.createTime }</small>
						</p>
						<c:if test="${comment.isResovleIssue == 1 }">
							<span class="badge badge-pill badge-success">已解决</span>
						</c:if>
						<c:if test="${comment.isProblem == 1 }">
							<span class="badge badge-pill badge-danger">疑难问题</span>
						</c:if>

						<div class="media-body">
							<p class=" user_name">
								<i class="ion-person"></i> ${comment.user.realName }
							</p>
							${comment.content }
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!--  -->
					<c:if test="${issue_detail.status.id != 3 }">
					<!-- action="${pageContext.request.contextPath }/AddComment" -->
					
					
						<form id="formReply"
							method="get">
							<input type="hidden" name="issue_id" id="issueDetailId" value="${issue_detail.id }" />
							<input type="hidden" name="user_id" value="${user_session.id }" />
							<label style="margin-top: 20px" for="textareaCommentContent">回复描述</label>
							<textarea name="comment"  class="form-control"
								id="textareaCommentContent" rows="20"></textarea>

							<c:if test="${user_session.dept.id==3 }">
								<c:if
									test="${comment_number !=0 && issue_detail.status.id != 3}">
									<div class="form-check form-check-inline">
										<label style="margin-top: 20px" class="form-check-label"
											for="checkboxResovled"> <input type="checkbox"
											class="form-check-input" id="checkboxResovled"
											name="is_resovled"  /> 标记为已解决
										</label>
									</div>
								</c:if>

								<c:if
									test="${comment_number != 0 && issue_detail.status.id != 4}">
									<div class="form-check form-check-inline">
										<label class="form-check-label" style="margin-top: 20px">
											<input class="form-check-input" type="checkbox"
											id="checkboxProblem" name="is_problem"> 标记为疑难问题
										</label>
									</div>
								</c:if>

							</c:if>
							<input style="margin-top: 20px; clear: left; float: none;"
								id="btnSubmitAddComment"
								class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="submit" value="回复">
							<div class="mdl-spinner mdl-js-spinner is-active" hidden="true" id="pbAddComment"></div>
						
						</form>

					</c:if>
				</div>

			</div>

		</div>
	</div>
   </div>
   </main>
</div>

	
</body>
<script type="text/javascript" src="lib/js/popper.min.js"></script>
<script type="text/javascript" src="lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/js/material/material.js"></script>
<script type="text/javascript" src="lib/js/app/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="lib/js/app/ckeditor/adapters/jquery.js"></script>
<script type="text/javascript" src="lib/js/app/issue_details.js"></script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加问题</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet">
<link href="lib/css/app/index.css" rel="stylesheet">
<link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
      rel="stylesheet"/>
      <link href="lib/css/material/material.css" rel="stylesheet" />
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
						href="${pageContext.request.contextPath }/Index"> <i class="ion-home"></i> 首页
			</a>
	        
	       <c:if test="${user_session.dept.id != 4 }">
	       		<a class="mdl-navigation__link" href="#"> <i class="ion-help-circled"></i> 添加问题</a>
	       </c:if>

			<c:if test="${user_session.dept.id == 4 }">
			 
				 <button id="demo-menu-lower-left"
	        		class="mdl-button mdl-js-button" style="color: white;">
				  <i class="ion-help-circled"></i>  添加问题
				</button>
			
				<ul class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
			    for="demo-menu-lower-left">
				 	<li class="mdl-menu__item">
						<a href="${pageContext.request.contextPath }/TrashBin"> <i
							class="ion-trash-a"></i> 回收站
						</a>
					</li>
					</ul>
			</c:if>
			
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
	    		<div class="mdl-grid">
	    			<div class="mdl-cell mdl-cell--1-col "> </div>
		    		<div class="mdl-cell mdl-cell--10-col " style="margin-top: 20px">
		    		<!-- action="${pageContext.request.contextPath }/AddIssue" -->
						<form  id="formAddIssue" >
							<div class="form-group">
								
								<label for="inputIssueTitle">问题标题</label> 
								<input
									id="inputIssueTitle" type="text" class="form-control"
									placeholder="请输入标题"
									name="title" required="required" /> 
									<label style="margin-top: 20px"
											for="textareaIssueContent">问题描述</label>
		
								<textarea name="content" class="form-control"
									id="textareaIssueContent" placeholder="请输入问题描述" rows="20" required="required" ></textarea>
								
								<div class="mdl-grid">
									<div class="mdl-cell mdl-cell--10-col">
										<input style="margin-top: 20px" id="submitAddIssue"
										 class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="submit" value="提交"  />
										<div class="mdl-spinner mdl-js-spinner is-active" hidden="true" id="pbAddIssue"></div>
									</div>
								</div>
								
							</div>
		
						</form>
					</div>
					<div class="mdl-cell mdl-cell--1-col "> </div>
	    		</div>

	    </div>
</main>
</div>
















	
</body>
<script type="text/javascript" src="lib/js/popper.min.js"></script>
<script type="text/javascript" src="lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
<script type="text/javascript"  src="lib/js/material/material.js"></script>
<script type="text/javascript" src="lib/js/app/ckeditor/ckeditor.js"></script>
<script type="text/javascript"  src="lib/js/app/new_issue.js"></script>
</html>
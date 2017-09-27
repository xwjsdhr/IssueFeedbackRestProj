<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet">
<link href="lib/css/app/index.css" rel="stylesheet">
<link
	href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" />
	<link   href="lib/css/app/register.css" rel="stylesheet"/>
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
						href="${pageContext.request.contextPath }/Index"> <i
						class="ion-home"></i> 首页
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
		<div class="row ">
			<div class="col-md-12 panel ">
				<form action="${pageContext.request.contextPath }/AddUser"
					method="post">
					<div class="form-group">
						<label style="margin-top: 20px" for="inputIssueTitle">用户名</label>
						<div class="row">
							<div class="col-lg-10">
								<input id="inputUserName" type="text" class="form-control" name="user_name" /> 
							</div>
							<div class="col-lg-2">
								<span class="badge badge-pill badge-success" id="alertUserSuccess"><i class="ion-checkmark" ></i></span> 
								<span class="badge badge-pill badge-danger" id="alertUserFail"><i class="ion-close"></i></span>
							</div>	
						</div>
						
					</div>
					<div class="form-group">
						<label style="margin-top: 20px" for="inputIssueTitle">密码</label> 
							<div class="row">
								<div class="col-lg-10">
									<input id="inputpassword" type="password" class="form-control" name="password" />
								</div>
								<div class="col-lg-2">
									<span class="badge badge-pill badge-success" id="alertPwdSuc"><i class="ion-checkmark" ></i></span> 
									<span class="badge badge-pill badge-danger" id="alertPwdFail"><i class="ion-close"></i></span>
								</div>
							</div>
						
					</div>
					<div class="form-group-inline mb-2 mr-sm-2 mb-sm-0">
						<label style="margin-top: 20px" for="inputRealName">姓名</label> 
							<div class="row">
								<div class="col-lg-10">
									<input type="text" id="inputRealName" class="form-control" name="real_name" />
								</div>
								<div class="col-lg-2">
									<span class="badge badge-pill badge-success" id="alertRealSuc"><i class="ion-checkmark" ></i></span> 
									<span class="badge badge-pill badge-danger" id="alertRealFail"><i class="ion-close"></i></span>
								</div>
							</div>
						
					</div>
					<div class="form-group">
						<label style="margin-top: 20px" for="selectDept">部门</label> <select
							name="dept_id" id="selectDept" class="form-control">

							<c:forEach items="${list_dept }" var="dept">
								<option value="${dept.id }">${dept.deptName }</option>
							</c:forEach>
						</select> <input id="submitBtnReg" style="margin-top: 20px" class="btn btn-primary"
							type="submit" value="注册" />
					</div>

				</form>
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
<script type="text/javascript" src="lib/js/app/register.js"></script>
<script type="text/javascript"  src="lib/js/material/material.js"></script>
</html>
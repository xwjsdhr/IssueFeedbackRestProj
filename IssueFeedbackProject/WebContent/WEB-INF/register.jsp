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
</head>
<body>
	<div class="container">

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath }/Index">注册</a>
		</nav>
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
</body>
<script type="text/javascript" src="lib/js/popper.min.js"></script>
<script type="text/javascript" src="lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/js/app/register.js"></script>
</html>
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
</head>
<body>
	<div class="container">

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="/IssueFeedbackProject/Index">注册</a>
		</nav>
		<div class="row ">
			<div class="col-md-12 panel ">
				<form action="/IssueFeedbackProject/AddUser" method="post">
					<div class="form-froup">
						<label style="margin-top: 20px" for="inputIssueTitle">用户名</label> 
						<input id="inputIssueTitle" type="text" class="form-control" name="user_name"/>
						<label style="margin-top: 20px" for="inputIssueTitle">密码</label> 
						<input id="inputIssueTitle" type="password" class="form-control" name="password"/>
						<label style="margin-top: 20px" for="inputRealName">姓名</label> 	
						<input type="text" id="inputRealName" class="form-control" name="real_name"/>
						<label style="margin-top: 20px" for="selectDept">部门</label> 	
						<select name="dept_id" id="selectDept" class="form-control">
							<c:forEach items="${list_dept }" var="dept">
								<option value="${dept.id }">${dept.deptName }</option>
							</c:forEach>
						</select>
						<input style="margin-top: 20px" class="btn btn-primary" type="submit" value="注册"/>
					</div>

				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="lib/js/popper.min.js"></script>
<script type="text/javascript" src="lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
</html>
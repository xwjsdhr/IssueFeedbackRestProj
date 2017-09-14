<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>登录</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet">
<link href="lib/css/app/login.css" rel="stylesheet">
</head>
<body>
	<div class="container">

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">Navbar</a>

		</nav>

		<div class="row loginPanel">

			<div class="col-md-2"></div>
			<div class="col">

				<form action="/IssueFeedbackProject/Auth" method="post">
					<div class="form-group">
						<label for="usernameInputId">用户名</label> <input name="user_name"
							id="usernameInputId" placeholder="请输入用户名" type="text"
							class="form-control" />
					</div>
					<div class="form-group">
						<label for="usernameInputId">密码</label> <input name="password"
							id="usernameInputId" placeholder="请输入密码" type="password"
							class="form-control" />
						<c:if test="${error != null }">
						<div class="alert alert-danger" role="alert">${error.errorMsg }</div>
						</c:if>
						
					</div>
					<div class="container">
						<div class="row">
							<div class="col-md-4">
								<input type="submit" value="登录" class="btn btn-primary" />
							</div>
							<div class="col-md-4">
								<a class="btn btn-primary" href="/IssueFeedbackProject/Register">注册</a>
							</div>
							<div class="col-md-4">
								<input type="reset" value="取消" class="btn btn-default centerSub" />
							</div>
						</div>

					</div>

				</form>
			</div>
			<div class="col-md-2"></div>
		</div>

	</div>

</body>
<script type="text/javascript" src="lib/js/jquery-slim.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>登录</title>
<jsp:include page="/WEB-INF/css_common.jsp"></jsp:include>
<link href="lib/css/app/login.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="container">

		<form class="form-signin" id="loginForm" method="post">
			<h2 class="form-signin-heading">请登录</h2>
			<label for="usernameInputId" class="sr-only">用户名</label> <input
				name="user_name" id="usernameInputId" type="text"
				class="form-control" placeholder="请输入用户名" required /> <label
				for="passwordInputId" class="sr-only">密码</label> <input
				name="password" id="passwordInputId" type="password"
				class="form-control" placeholder="请输入密码" required /> <input
				type="submit" value="登录" id="btnLogin"
				class="btn btn-lg btn-primary btn-block" />
		</form>

	</div>

</body>
<jsp:include page="/WEB-INF/script.jsp"></jsp:include>
 <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>  
  <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>  
<script type="text/javascript" src="lib/js/app/login.js"></script>
</html>
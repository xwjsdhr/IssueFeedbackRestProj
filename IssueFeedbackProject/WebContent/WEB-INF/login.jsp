<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>登录</title>
<link href="lib/css/material/material.css" rel="stylesheet" />
<link href="lib/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="lib/css/app/login.css" rel="stylesheet" type="text/css">
</head>
<body>
			<div class="mdl-grid">
				<div class="mdl-cell mdl-cell--4-col mdl-cell--4-offset">
				<div class="demo-card-square mdl-card mdl-shadow--2dp card"
					>
					<form action="${pageContext.request.contextPath }/Auth"
						method="post">
						<div class="mdl-grid">
							<div class="mdl-cell mdl-cell--1-col"></div>
							<div class="mdl-cell mdl-cell--10-col">
								<div class="mdl-textfield mdl-js-textfield">
									<input name="user_name" id="usernameInputId" type="text"
										class="mdl-textfield__input" placeholder="请输入用户名" required />
								</div>
							</div>
						</div>
						<div class="mdl-grid">
							<div class="mdl-cell mdl-cell--1-col"></div>
							<div class="mdl-cell mdl-cell--10-col">
								<div class="mdl-textfield mdl-js-textfield">
									<input name="password" id="usernameInputId" type="password"
										class="mdl-textfield__input" placeholder="请输入密码"  required />
									<c:if test="${error != null }">
										<div class="alert alert-danger" role="alert">${error.errorMsg }</div>
									</c:if>
								</div>
							</div>
						</div>
						<div class="mdl-grid">
							<div class="mdl-cell mdl-cell--5-col mdl-cell--1-offset btn-login">
								<input type="submit" value="登录"
									class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" />
							</div>
							<div class="mdl-cell mdl-cell--5-col mdl-cell--1-offset btn-cancel">
								<input type="reset" value="取消"
									class="mdl-button mdl-js-button mdl-button--raised" />
							</div>
						</div>
					</form>
				</div>
				</div>
			</div>
</body>
<script type="text/javascript" src="lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/js/material/material.js"></script>
</html>
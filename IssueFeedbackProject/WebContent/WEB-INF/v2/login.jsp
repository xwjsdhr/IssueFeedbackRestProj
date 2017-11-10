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
<jsp:include page="/WEB-INF/v1/css_common.jsp"></jsp:include>
<link href="lib/css/app/login.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="container">
	<div class="row">
        <div class="col-md-12">
            <div class="pr-wrap">
                <div class="pass-reset">
                    <label>
                        Enter the email you signed up with</label>
                    <input type="email" placeholder="Email" />
                    <input type="submit" value="Submit" class="pass-reset-submit btn btn-success btn-sm" />
                </div>
            </div>
            <div class="wrap">
                <p class="form-title">问题反馈系统</p>
                <form class="login" id="loginForm" method="post">
	                <input type="text" placeholder="用户名" id="usernameInputId" />
	                <input type="password" placeholder="密码"  id="passwordInputId" />
	                <input type="submit" value="登录" class="btn btn-success btn-sm" id="btnLogin" />
                </form>
            </div>
        </div>
    </div>


	</div>

</body>
<jsp:include page="/WEB-INF/v1/script.jsp"></jsp:include>
 <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>  
  <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>  
<script type="text/javascript" src="lib/js/app/v1/login.js"></script>
</html>
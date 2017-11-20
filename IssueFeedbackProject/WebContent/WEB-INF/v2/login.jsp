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
<jsp:include page="/WEB-INF/v2/stylesheet_beta.jsp"></jsp:include>
<link href="/IssueFeedbackProject/lib/css/app/login.css" rel="stylesheet" type="text/css">
</head>

<body class="app flex-row align-items-center">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-5">
        <div class="card-group">
          <div class="card p-4">
            <div class="card-body">
              <h1>登录</h1>
              <p class="text-muted">输入账号登录</p>
              <form  id="loginForm" method="post">
	              <div class="input-group mb-3">
	                <span class="input-group-addon"><i class="icon-user"></i></span>
	               	<input type="text" placeholder="用户名" class="form-control" id="usernameInputId" />
	              </div>
	              <div class="input-group mb-4">
	                <span class="input-group-addon"><i class="icon-lock"></i></span>
	               <input type="password" placeholder="密码" class="form-control"  id="passwordInputId" />
	              </div>
	              <div class="row">
	                <div class="col-6">
	                 <input type="submit" value="登录" class="btn btn-success" id="btnLogin" />
	                </div>
	              </div>
              </form>
            </div>
          </div>
          <!-- <div class="card text-white bg-primary py-5 d-md-down-none" style="width:44%">
            <div class="card-body text-center">
              <div>
                <h2>Sign up</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                <button type="button" class="btn btn-primary active mt-3">Register Now!</button>
              </div>
            </div>
          </div> -->
        </div>
      </div>
    </div>
  </div>

</body>

<!-- <body>

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

</body> -->
<jsp:include page="/WEB-INF/v2/script_beta.jsp"></jsp:include>
 <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>  
  <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>  
<script type="text/javascript" src="/IssueFeedbackProject/lib/js/app/v2/login.js"></script>
</html>
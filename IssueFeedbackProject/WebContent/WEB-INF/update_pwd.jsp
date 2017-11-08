<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
		<jsp:include page="/WEB-INF/css_common.jsp"></jsp:include>
</head>
<body>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
	  
	  <jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	  
	  <main class="mdl-layout__content">
	    <div class="page-content">
	    		<div class="mdl-grid">
	    			<div class="mdl-cell mdl-cell--1-col "> </div>
		    		<div class="mdl-cell mdl-cell--10-col " style="margin-top: 20px">
								<div class="mdl-grid">
									<div class="mdl-cell mdl-cell--5-col mdl-cell--3-offset">
										<form id="formUpdatePwd">
											 <label for="inputNewPassword" >新密码</label>
											<div class="mdl-grid">
												<div class="mdl-cell mdl-cell--10-col">
													
													<input type="password" class="form-control" placeholder="请输入新密码" id="inputNewPassword"  required="required">
												</div>
												
											</div>
											
											
											<div class="alert" role="alert" id="alertNewPwd1" hidden="true">
											  
											</div>
											
											<label  for="inputNewPassword2" style="margin-top: 20px">确认新密码</label>
											
											<div class="mdl-grid">
												<div class="mdl-cell mdl-cell--10-col">
													<input type="password" class="form-control" placeholder="请再次输入新密码"  id="inputNewPassword2"  required="required">
												</div>
												
											</div>
											 
											 <div class="alert " id="alertNewPwd2" role="alert" hidden="true">
											  
											 </div>
												
											<input type="submit" id="btnUpdatePwd" style="margin-top: 20px" class="btn btn-primary" value="修改密码">
										</form>	
									</div>
											
								
								</div>
									
					</div>
					<div class="mdl-cell mdl-cell--1-col "></div>
	    		</div>

	    </div>
</main>
</div>
	
</body>
<jsp:include page="/WEB-INF/script.jsp"></jsp:include>
<script type="text/javascript" src="lib/js/app/update_pwd.js"></script>
</html>
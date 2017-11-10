<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<jsp:include page="/WEB-INF/v1/css_common.jsp"></jsp:include>
	<link href="${pageContext.request.contextPath}/lib/css/app/common.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="modal fade" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">添加用户</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>添加成功</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">确定</button>
	      </div>
	    </div>
	  </div>
	</div>
	
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
	  
	  <jsp:include page="/WEB-INF/v1/header.jsp"></jsp:include>
	  
	  <main class="mdl-layout__content">
	    <div class="page-content">
	    
	    
	    <div class="container">
		<div class="row ">
			<div class="col-md-12 panel ">
				<form id="formAddUser"
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
						<label style="margin-top: 20px" for="selectDept">部门</label> 
						<select
							name="dept_id" id="selectDept" class="form-control">

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
<jsp:include page="/WEB-INF/v1/script.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v1/register.js"></script>
</html>
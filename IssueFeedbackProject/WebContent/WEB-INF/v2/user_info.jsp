<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<jsp:include page="/WEB-INF/v2/stylesheet_beta.jsp"></jsp:include>
</head>
<body class="app header-fixed sidebar-fixed aside-menu-fixed aside-menu-hidden">
  <jsp:include page="/WEB-INF/v2/header.jsp"></jsp:include>
  <div class="app-body">
  	<jsp:include page="/WEB-INF/v2/siderbar.jsp"></jsp:include>
    <!-- Main content -->
    <main class="main">
      <!-- Breadcrumb -->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">模块管理</li>
        <li class="breadcrumb-item">用户管理</li>
        <li class="breadcrumb-item active">当前用户信息</li>
        <li class="breadcrumb-menu d-md-down-none">
          <div class="btn-group" role="group" aria-label="Button group">
            <a id="btnUpdateUserInfo" class="btn" href="#"><i class="icon-pencil"></i>&nbsp; 修改用户信息</a>
            <a id="btnUpdateUserInfoCancel" class="btn" href="#"  hidden="true"><i class="fa fa-ban"></i>&nbsp; 取消修改</a>
            <a id="btnSaveUserInfo" class="btn" href="#" hidden="true"><i class="icon-check"></i>&nbsp; 保存</a>
          </div>
        </li>
      </ol>
      <div class="container-fluid">

        <div class="animated fadeIn">
        
          <div class="row">
            <div class="col-md-6">
            
              <div class="card"> 
		        <div class="card-header">
		          <i class="fa fa-table"></i>&nbsp;&nbsp;&nbsp;用户信息
		          </div>
			        <div class="card-body">
	        			<div class="form-froup">
							<label for="inputIssueTitle">
							<b>用户名</b>
							</label> 
							<input id="inputUserName" type="text" value="${user_login.username }" class="form-control" name="user_name" disabled /> 
							 <label for="inputRealName">
							 	<b>姓名</b>
							 </label>
							<input type="text" id="inputRealName" value="${user_login.realName }" class="form-control" name="real_name" disabled /> 
							<label for="selectDept">
								<b>部门</b>
							</label>
							<select name="dept_id" id="selectDept" class="form-control" disabled>
								<option value="${user_login.dept.id }">${user_login.dept.deptName }</option>
							</select>
							 <label for="inputRealName">
							 	<b>电话</b>
							 </label>
							<input type="text" id="inputTelephone" value="${user_login.telephone }" class="form-control" name="real_name" disabled />
							
							 <label for="inputRealName">
							 	<b>邮箱</b>
							 </label>
							<input type="text" id="inputEmail" value="${user_login.email }" class="form-control" name="real_name" disabled />
							
						</div>
				    </div>  
       			</div>
            
            </div>
             <div class="col-md-6">
             		<div class="card"> 
				        <div class="card-header">
				          <i class="fa fa-table"></i>&nbsp;&nbsp;&nbsp;修改密码
				        </div>
				        <div class="card-body">
		        			<div class="form-froup">
								<label for="inputPassword1">
									<b>新密码</b>
								</label> 
								<input id="inputPassword1" type="password"  class="form-control" name="inputPassword1" 
									placeholder="请输入新密码"
								 /> 
								<label for="inputPassword2">
									<b>重复新密码</b>
								</label> 
								<input id="inputPassword2" type="password"  class="form-control" name="inputPassword2"
									placeholder="请输入旧密码"/> 
							</div>
					    </div>  
					    <div class="card-footer">
								<button id="btnUpdatePwd" type="button" class="btn btn-sm btn-primary"><i class="icon-pencil"></i>&nbsp; 修改密码</button>
						</div>
       				</div>
             </div>
            
          </div>
          
        </div>

      </div>
    </main>
  </div>
  
 	<jsp:include page="/WEB-INF/v2/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/logout.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/script_beta.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/adapters/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v2/user_info.js"></script>
</body>


<%-- <body class="fixed-nav sticky-footer bg-dark" id="page-top">
  
  <jsp:include page="/WEB-INF/v2/navbar.jsp"></jsp:include>
  
  <div class="content-wrapper">
    <div class="container-fluid">
    
    <nav aria-label="breadcrumb" role="navigation">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item">用户信息</li>
	  </ol>
	</nav>
      <div class="card"> 
        <div class="card-header">
          <i class="fa fa-table"></i>&nbsp;&nbsp;&nbsp;用户信息
          </div>
          
	        <div class="card-body">
	        	<div class="row">
	        		<div class="col-lg-4">
	        			<div class="form-froup">
							<label for="inputIssueTitle">
							<b>用户名</b>
							</label> 
							<input id="inputIssueTitle" type="text" value="${user_login.username }" class="form-control" name="user_name" disabled /> 
							 <label for="inputRealName">
							 	<b>姓名</b>
							 </label>
							<input type="text" id="inputRealName" value="${user_login.realName }" class="form-control" name="real_name" disabled /> 
							<label for="selectDept">
								<b>部门</b>
							</label>
							<select name="dept_id" id="selectDept" class="form-control" disabled>
								<option value="${user_login.dept.id }">${user_login.dept.deptName }</option>
							</select>
						</div>
	        		</div>
	        	
	        	</div>
					
		    </div>  
       	</div>
      <jsp:include page="/WEB-INF/v2/footer.jsp"></jsp:include>
     </div>
    <jsp:include page="/WEB-INF/v2/logout.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/script2.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/adapters/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v2/user_info.js"></script>
  </div>
</body> --%>
</html>
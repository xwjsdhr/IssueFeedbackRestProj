<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<jsp:include page="/WEB-INF/v2/stylesheet.jsp"></jsp:include> 
</head>
<body class="fixed-nav sticky-footer" id="page-top">
 <jsp:include page="/WEB-INF/v2/navbar.jsp"></jsp:include> 
  
   <div class="content-wrapper">
    <div class="container-fluid">
    <nav aria-label="breadcrumb" role="navigation">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item">用户管理</li>
	    <li class="breadcrumb-item active" aria-current="page">修改密码</li>
	  </ol>
	</nav>
	
	<div class="card"> 
        <div class="card-header">
          <i class="fa fa-table"></i>&nbsp; &nbsp;&nbsp;修改密码
          </div>
          
	        <div class="card-body">
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
     
      <jsp:include page="/WEB-INF/v2/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/logout.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/script2.jsp"></jsp:include>
  	 </div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/adapters/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v2/update_pwd.js"></script>
</body>
</html>
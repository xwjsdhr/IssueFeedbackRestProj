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
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  
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
</body>
</html>
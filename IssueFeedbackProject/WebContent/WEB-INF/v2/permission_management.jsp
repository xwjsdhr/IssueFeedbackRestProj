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
      <div class="card"> 
        <div class="card-header">
          <i class="fa fa-table"></i>&nbsp; &nbsp;&nbsp;问题列表</div>
	        <div class="card-body">
        		<div class="row">
	        		<div class="col-lg-6">
	        			<div class="table-responsive">
			        		<table id="dept_table" class="table table-bordered" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th>部门名称</th>
									</tr>
								</thead>
							</table>
			        	</div>
	        		</div>
	        		<div class="col-lg-6">
	        			<div class="table-responsive">
			        		<table id="dept_table_details" class="table table-bordered" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th>权限名称</th>
									</tr>
								</thead>
							</table>
			        	</div>
	        		</div>
	        	</div>
	        </div>
       	</div>
      <jsp:include page="/WEB-INF/v2/footer.jsp"></jsp:include>
     </div>
     
     
    <jsp:include page="/WEB-INF/v2/logout.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/script2.jsp"></jsp:include>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v2/permission_management.js"></script>
  </div>
</body>
</html>
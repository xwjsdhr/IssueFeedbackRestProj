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
	    <li class="breadcrumb-item active" aria-current="page">用户登录记录</li>
	  </ol>
	</nav>
	
	<div class="card"> 
        <div class="card-header">
          <i class="fa fa-table"></i>&nbsp; &nbsp;&nbsp;用户登录记录
          </div>
	        <div class="card-body">
		          <div class="table-responsive">
	        		<table id="issue_table" class="table table-striped table-bordered" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>用户</th>
								<th>时间</th>
								<th>IP地址</th>
								<th>类型</th>
							</tr>
						</thead>
					</table>
		        	</div>
	        	</div>
       	</div>
     </div>
     
    <jsp:include page="/WEB-INF/v2/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/logout.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/modal_add_issue.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/script2.jsp"></jsp:include>
  	 </div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/adapters/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v2/user_log_management.js"></script>
</body>
</html>
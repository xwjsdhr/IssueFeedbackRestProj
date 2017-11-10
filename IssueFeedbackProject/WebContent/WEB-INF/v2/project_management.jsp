<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目管理</title>
<jsp:include page="/WEB-INF/v2/stylesheet.jsp"></jsp:include>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  
  <jsp:include page="/WEB-INF/v2/navbar.jsp"></jsp:include>
  
  <div class="content-wrapper">
    <div class="container-fluid">
      <div class="card"> 
        <div class="card-header">
          <i class="fa fa-table"></i>&nbsp; &nbsp;&nbsp;项目列表
          	<button class="btn btn-primary" id="btnAddProject" style="float: right;"> <i class="fa fa-plus"></i>&nbsp;添加项目</button>
          </div>
	        <div class="card-body">
		          <div class="table-responsive">
	        		<table id="project_table" class="table table-bordered" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>项目</th>
								<th>管理部门</th>
								<th>描述</th>
								<th></th>
							</tr>
						</thead>
					</table>
		        	</div>
	        	</div>
       	</div>
      <jsp:include page="/WEB-INF/v2/footer.jsp"></jsp:include>
     </div>
     
    <jsp:include page="/WEB-INF/v2/modal_add_project.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/logout.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/script2.jsp"></jsp:include>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v2/project_management.js"></script>
  </div>
</body>
</html>
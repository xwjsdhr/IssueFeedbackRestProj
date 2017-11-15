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
	    <li class="breadcrumb-item">培训记录管理</li>
	    <li class="breadcrumb-item active" aria-current="page">培训记录列表</li>
	  </ol>
	</nav>
      <div class="card"> 
        <div class="card-header">
          <i class="fa fa-table"></i>&nbsp; &nbsp;&nbsp;培训记录列表
          	<c:if test="${fn:contains(user_login.dept.permissions,2)}">
          	<button class="btn btn-primary" id="btnAddIssue" style="float: right;"><i class="fa fa-plus"></i>&nbsp;添加培训记录</button>
          	</c:if>
          </div>
          
	        <div class="card-body">
		          <div class="table-responsive">
	        		<table id="train_record_table" class="table table-striped table-bordered" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>培训类型</th>
								<th>内容</th>
								<th>提交时间</th>
								<th>培训方式</th>
								<th>发起部门</th>
								<th>开始时间</th>
								<th>讲师</th>
								<th>培训用时</th>
								<th>准备文档用时</th>
								<th>参加培训人员</th>
							</tr>
						</thead>
					</table>
		        	</div>
	        	</div>
       	</div>
      <jsp:include page="/WEB-INF/v2/footer.jsp"></jsp:include>
     </div>
    <jsp:include page="/WEB-INF/v2/logout.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/modal_add_issue.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/script2.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/adapters/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v2/train_record_management.js"></script>
  </div>
</body>
</html>
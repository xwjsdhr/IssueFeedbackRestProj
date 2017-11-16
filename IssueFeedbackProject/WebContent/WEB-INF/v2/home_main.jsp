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
<body class="fixed-nav sticky-footer bg-dark" id="page-top"   style="background-color: #F7F7F9">
  
  <jsp:include page="/WEB-INF/v2/navbar.jsp"></jsp:include>
  <div>
  <div class="content-wrapper" >
	    <div class="container-fluid">
	    
		    <nav aria-label="breadcrumb" role="navigation">
			  <ol class="breadcrumb">
			    <li class="breadcrumb-item">首页</li>
			  </ol>
			</nav>
			<div class="container">
					<br/>
					<br/> 
					<div class="row justify-content-center align-items-center">
				   		<div class="col-4">
							<div class="card bg-light" style="max-width: 20rem;">
							  <div class="card-header">问题管理</div>
							  <div class="card-body">
							    <p class="card-text">对于组长问题的反馈与提报。</p>
							    <a href="#" class="btn btn-primary">进入模块</a>
							  </div>
							</div>
						</div>
				   		<div class="col-4">
							<div class="card bg-light" style="max-width: 20rem;">
							  <div class="card-header">周报信息提报</div>
							  <div class="card-body">
							    <p class="card-text">周报的提交与汇总。</p>
							    <a href="#" class="btn btn-primary">进入模块</a>
							  </div>
							</div>
						</div>
			   		</div>
			   		<br/> 
			   		<div class="row justify-content-center align-items-center">
				   		<div class="col-4">
							<div class="card bg-light" style="max-width: 20rem;">
							  <div class="card-header">问题管理</div>
							  <div class="card-body">
							    <p class="card-text">对于组长问题的反馈与提报。</p>
							    <a href="#" class="btn btn-primary">进入模块</a>
							  </div>
							</div>
						</div>
				   		<div class="col-4">
							<div class="card bg-light" style="max-width: 20rem;">
							  <div class="card-header">周报信息提报</div>
							  <div class="card-body">
							    <p class="card-text">周报的提交与汇总。</p>
							    <a href="#" class="btn btn-primary">进入模块</a>
							  </div>
							</div>
						</div>
			   		</div>
			   		
			   		
			   	</div>
			
			</div>
	   	</div>
   </div>
   
    <jsp:include page="/WEB-INF/v2/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/logout.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/modal_add_issue.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/script2.jsp"></jsp:include>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/adapters/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v2/home_main.js"></script>
  </div>
</body>
</html>
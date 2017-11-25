 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE>
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
    <main class="main">
      <ol class="breadcrumb">
        <li class="breadcrumb-item">模块管理</li>
        <li class="breadcrumb-item">组长问题反馈</li>
        
        <li class="breadcrumb-menu d-md-down-none">
          <div class="btn-group" role="group" aria-label="Button group">
        	<c:if test="${fn:contains(user_login.dept.permissions,2)}">
	          	<a class="btn" id="btnAddIssue" href="#"><i class="icon-plus"></i>&nbsp;添加问题 </a>
	          	<div class="form-check form-check-inline">
					  <label class="form-check-label">
					    <input class="form-check-input" type="checkbox" id="chkAboutMe" value="option1"> 我参与的
					  </label>
					</div>
          	</c:if>
          	
          </div>
        </li>
        
      </ol>
      
      <div class="container-fluid">
	          <div class="row">
	            <div class="col-md-12">
	              <div class="card">
		            <div class="card-header">
	                  <i class="fa fa-align-justify"></i>问题列表
	                </div>
	                <div class="card-body">
	                
	                  <div class="table-responsive">
		        		<table id="issue_table" class="table table-striped table-bordered" style="width: 100%;"  cellspacing="0">
							<thead>
								<tr>
									<th>状态</th>
									<th>标题</th>
									<th>提交<br>时间</th>
									<th>反馈人</th>
									<th>周</th>
									<th>项目</th>
									<th>项目<br>模块</th>
									<th>详情</th>
								</tr>
							</thead>
						</table>
			        	</div>
	                </div>
	              </div>
	            </div>
	          </div>
          <jsp:include page="/WEB-INF/v2/modal_add_issue.jsp"></jsp:include>
	  	<jsp:include page="/WEB-INF/v2/logout.jsp"></jsp:include>
      </div>
    </main>
  </div>


	<jsp:include page="/WEB-INF/v2/footer.jsp"></jsp:include>
  	<jsp:include page="/WEB-INF/v2/script_beta.jsp"></jsp:include>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v2/index2.js"></script>
</body>




<%--
<body class="fixed-nav sticky-footer" id="page-top">

 <jsp:include page="/WEB-INF/v2/navbar.jsp"></jsp:include> 
 
   <div class="content-wrapper">
    <div class="container-fluid">
    
    
	  <nav aria-label="breadcrumb" role="navigation">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item">问题管理</li>
		    <li class="breadcrumb-item active" aria-current="page">问题列表</li>
		  </ol>
		</nav>
	 
		<div class="card"> 
	        <div class="card-header">
	          <i class="fa fa-table"></i>&nbsp; &nbsp;&nbsp;问题列表
	          	<c:if test="${fn:contains(user_login.dept.permissions,2)}">
	          	<button class="btn btn-primary" id="btnAddIssue" style="float: right;"><i class="fa fa-plus"></i>&nbsp;添加问题</button>
	          	</c:if>
	          </div>
          
	        <div class="card-body">
		          <div class="table-responsive">
	        		<table id="issue_table" class="table table-striped table-bordered" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>状态</th>
								<th>标题</th>
								<th>提交时间</th>
								<th>上次更新时间</th>
								<th>周</th>
								<th>所属项目</th>
								<th>项目模块</th>
								<th>详情</th>
							</tr>
						</thead>
					</table>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v2/index2.js"></script>
</body>
 --%> 
 

</html>
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
        <li class="breadcrumb-item">问题管理</li>
        <li class="breadcrumb-item">问题统计</li>
      </ol>
      <div class="container-fluid">

        <div class="animated fadeIn">
         
          <div class="row">
            <div class="col-md-12">
              
	              <div class="card"> 
			        <div class="card-header">
						<div class="conrainer">
							<div class="row">
								<div class="col-lg-3 col-offset-3" id="colType">
									<select class="form-control" id="selectorType">
										<option value="">--选择类型--</option>
										<option value="year">年</option>
										<option value="week_of_year">周</option>
										<option value="month">月</option>
										<option value="dept_id">部门</option>
										<option value="project">系统</option>
										<option value="status_id">状态</option>
									</select>
								</div>
								<div class="col-lg-3" id="colYear">
									<select class="form-control" id="selectorYear" >
										<option value="">--选择年份--</option>
										<option>2010</option>
										<option>2011</option>
										<option>2012</option>
										<option>2013</option>
										<option>2014</option>
										<option>2015</option>
										<option>2016</option>
										<option>2017</option>
										<option>2018</option>
									</select>
								</div>
								<div class="col-lg-3">
									<button class="btn btn-danger" style="width: 100%;align-items: center;"  type="button" id="btnQuery">查询</button>
								</div>
							</div>
						</div>
			          </div>
			        <div class="card-body">
				          <div class="container">
							<div class="row">
								<div class="col-lg-12">
									 <canvas id="canvas" width="55%"></canvas>
								</div>
							</div>
				          </div>
			        </div>
	       	</div>
              
              
            </div>
          </div>
          
        </div>

      </div>
    </main>
    <jsp:include page="/WEB-INF/v2/aside_menu.jsp"></jsp:include>
  </div>
	<jsp:include page="/WEB-INF/v2/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/logout.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/modal_add_issue.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/script_beta.jsp"></jsp:include>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v2/issue_statistics.js"></script>
</body>


<%-- <body class="fixed-nav sticky-footer bg-dark" id="page-top">
  
  <jsp:include page="/WEB-INF/v2/navbar.jsp"></jsp:include>
  
  <div class="content-wrapper">
    <div class="container-fluid">
    
    <nav aria-label="breadcrumb" role="navigation">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item">问题统计</li>
	  </ol>
	</nav>
      <div class="card"> 
        <div class="card-header">
			<div class="conrainer">
				<div class="row">
				
					<div class="col-lg-3 col-offset-3" id="colType">
						<select class="form-control" id="selectorType">
							<option value="">--选择类型--</option>
							<option value="year">年</option>
							<option value="week_of_year">周</option>
							<option value="month">月</option>
							<option value="dept_id">部门</option>
							<option value="project">系统</option>
							<option value="status_id">状态</option>
						</select>
					</div>
					<div class="col-lg-3" id="colYear">
						<select class="form-control" id="selectorYear" >
							<option value="">--选择年份--</option>
							<option>2010</option>
							<option>2011</option>
							<option>2012</option>
							<option>2013</option>
							<option>2014</option>
							<option>2015</option>
							<option>2016</option>
							<option>2017</option>
							<option>2018</option>
						</select>
					</div>
					<div class="col-lg-3">
						<button class="btn btn-danger" style="width: 100%" type="button" id="btnQuery">查询</button>
					</div>
				</div>
			</div>
          </div>
	        <div class="card-body">
		          <div class="container">
		          	
					
					<div class="row">
					
					
						<div class="col-lg-12">
							 <canvas id="canvas" width="55%"></canvas>
						</div>
						
					</div>
		          </div>
	        </div>
       	</div>
      <jsp:include page="/WEB-INF/v2/footer.jsp"></jsp:include>
     </div>
    <jsp:include page="/WEB-INF/v2/logout.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/modal_add_issue.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/script2.jsp"></jsp:include>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v2/issue_statistics.js"></script>
  </div>
</body> --%>
</html>
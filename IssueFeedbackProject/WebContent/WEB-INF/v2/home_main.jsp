<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
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
        <li class="breadcrumb-item">Home</li>
        <li class="breadcrumb-item"><a href="#">Admin</a></li>
        <li class="breadcrumb-item active">Dashboard</li>
        <!-- Breadcrumb Menu-->
        <li class="breadcrumb-menu d-md-down-none">
          <div class="btn-group" role="group" aria-label="Button group">
            <a class="btn" href="#"><i class="icon-speech"></i></a>
            <a class="btn" href="./"><i class="icon-graph"></i> &nbsp;Dashboard</a>
            <a class="btn" href="#"><i class="icon-settings"></i> &nbsp;Settings</a>
          </div>
        </li>
      </ol>
      <div class="container-fluid">

        <div class="row">
            <div class="col-sm-6 col-lg-3"  id="card_issue">
              <div class="card text-white bg-primary">
                <div class="card-body pb-0">
                <h4 class="mb-0" id="issueCount"></h4>
                <p>问题管理</p>
                </div>
              </div>
            </div>

            <div class="col-sm-6 col-lg-3"  id="card_project">
              <div class="card text-white bg-warning">
                <div class="card-body pb-0">
                 <h4 class="mb-0" id="projectCount"></h4>
                  <p>项目管理</p>
                </div>
              </div>
            </div>
            <!--/.col-->

            <div class="col-sm-6 col-lg-3"  id="card_permission">
              <div class="card text-white bg-danger">
                <div class="card-body pb-0">
                  <h4 class="mb-0" id="userCount"></h4>
                  <p>用户管理</p>
                </div>
              </div>
            </div>
            <!--/.col-->
          </div>
          
          <div class="row">
          	<div class="col-lg-9 ">
          		<div class="card"> 
	          		<div class="card-body">
	          			<canvas id="canvas" height="150px"></canvas>
	          		</div>
          		</div>
          	</div>
          </div>
      </div>
    </main>
  </div>

 <jsp:include page="/WEB-INF/v2/footer.jsp"></jsp:include>
  	<jsp:include page="/WEB-INF/v2/script_beta.jsp"></jsp:include>
  	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.min.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v2/home_main.js"></script>
</body>

</html>
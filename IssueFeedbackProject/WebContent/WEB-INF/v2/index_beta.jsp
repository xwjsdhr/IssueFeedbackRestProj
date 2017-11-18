<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<jsp:include page="/WEB-INF/v2/stylesheet_beta.jsp"></jsp:include>
<jsp:include page="/WEB-INF/v2/script_beta.jsp"></jsp:include>
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

        <div class="animated fadeIn">
        
          <div class="row">
            
          </div>
         
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
                  Traffic &amp; Sales
                </div>
                <div class="card-body">
                  
                </div>
              </div>
            </div>
            <!--/.col-->
          </div>
          
        </div>

      </div>
    </main>
    <jsp:include page="/WEB-INF/v2/aside_menu.jsp"></jsp:include>
  </div>

  <footer class="app-footer">
    <span><a href="http://coreui.io">CoreUI</a> © 2017 creativeLabs.</span>
    <span class="ml-auto">Powered by <a href="http://coreui.io">CoreUI</a></span>
  </footer>
  
</body>

</html>
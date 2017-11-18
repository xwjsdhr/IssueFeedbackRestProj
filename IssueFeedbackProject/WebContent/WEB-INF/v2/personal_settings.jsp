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
        <li class="breadcrumb-item">个人设置</li>
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
                 	 个人设置
                </div>
                <div class="card-body">
                  
                </div>
              </div>
            </div>
          </div>
          
        </div>

      </div>
    </main>
    <%-- <jsp:include page="/WEB-INF/v2/aside_menu.jsp"></jsp:include> --%>
  </div>

  <jsp:include page="/WEB-INF/v2/footer.jsp"></jsp:include>
  	<jsp:include page="/WEB-INF/v2/script_beta.jsp"></jsp:include>
  
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<jsp:include page="/WEB-INF/v2/stylesheet_beta.jsp"></jsp:include>
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
</head>

<body class="app header-fixed sidebar-fixed aside-menu-fixed aside-menu-hidden">
  <jsp:include page="/WEB-INF/v2/header.jsp"></jsp:include>
  <div class="app-body">
  	<jsp:include page="/WEB-INF/v2/siderbar.jsp"></jsp:include>
    <!-- Main content -->
    <main class="main">
      <!-- Breadcrumb -->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">模块管理</li>
        <li class="breadcrumb-item">用户管理</li>
        <li class="breadcrumb-item active">用户列表</li>
        <!-- Breadcrumb Menu-->
        <li class="breadcrumb-menu d-md-down-none">
          <div class="btn-group" role="group" aria-label="Button group">
            <a id="btnAddUser" class="btn" href="#"><i class="icon-plus"></i>&nbsp; 添加用户</a>
          </div>
        </li>
      </ol>
      <div class="container-fluid">

        <div class="animated fadeIn">
        
          <div class="row">
            <div class="col-md-12">
              <div class="card"> 
		        <div class="card-header">
		          <i class="fa fa-table"></i>&nbsp; &nbsp;&nbsp;用户列表
		        <!-- <button id="btnAddUser" class="btn btn-primary" style="float: right;"><i class="fa fa-plus"></i>&nbsp; 添加用户</button> -->
		          </div>
	        	<div class="card-body">
		          <div class="table-responsive">
	        		<table id="user_table" class="table table-striped table-bordered" width="100%"  cellspacing="0">
						 <thead>
							<tr>
								<th>账号</th>
								<th>部门</th>
								<th>状态</th>
								<th>姓名</th>
								<th>电话</th>
								<th>邮箱</th>
								<th>禁用/启用</th>
								<th>修改信息</th>
								<th>重置密码</th>
							</tr>
						</thead> 
					</table>
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
  
  	<jsp:include page="/WEB-INF/v2/modal_add_user.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/modal_update_user.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/script_beta.jsp"></jsp:include>
	<script src="https://unpkg.com/vue"></script>
	<!-- 引入组件库 -->
	<script src="https://unpkg.com/element-ui/lib/index.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v2/user_management.js"></script>
</body>
</html>
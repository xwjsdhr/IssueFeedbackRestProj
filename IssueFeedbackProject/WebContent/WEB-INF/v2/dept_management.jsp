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

<body class="app header-fixed sidebar-fixed aside-menu-fixed aside-menu-hidden">
  <jsp:include page="/WEB-INF/v2/header.jsp"></jsp:include>
  <div class="app-body">
  	<jsp:include page="/WEB-INF/v2/siderbar.jsp"></jsp:include>
    <!-- Main content -->
    <main class="main">
      <!-- Breadcrumb -->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">模块管理</li>
        <li class="breadcrumb-item">组长问题反馈</li>
        <li class="breadcrumb-item active">部门管理</li>
         <li class="breadcrumb-menu d-md-down-none">
          <div class="btn-group" role="group" aria-label="Button group">
	          <a class="btn"  id="btnAddDept" href="#"><i class="icon-plus"></i>&nbsp;添加部门</a>
          </div>
        </li>
      </ol>
      <div class="container-fluid">
        <div class="animated fadeIn">
          <div class="row">
            <div class="col-md-12">
              <div class="card"> 
		        <div class="card-header">
		          <i class="fa fa-table"></i>&nbsp; &nbsp;&nbsp;部门列表
		          	
		          </div>
			        <div class="card-body">
			          <div class="table-responsive">
		        		<table id="dept_table" class="table table-striped table-bordered" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>部门名称</th>
									<th>部门描述</th>
									<th >部门描述</th>
									<!-- <th></th> -->
								</tr>
							</thead>
						</table>
			        	</div>
		        	</div>
		       	</div>
            </div>
          </div>
        </div>
		<jsp:include page="/WEB-INF/v2/logout.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/v2/modal_add_dept.jsp"></jsp:include>
      </div>
    </main>
    <jsp:include page="/WEB-INF/v2/aside_menu.jsp"></jsp:include>
  </div>
	
 <jsp:include page="/WEB-INF/v2/footer.jsp"></jsp:include>
  
  	 <jsp:include page="/WEB-INF/v2/script_beta.jsp"></jsp:include>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v2/dept_management.js"></script>
</body>

</html>
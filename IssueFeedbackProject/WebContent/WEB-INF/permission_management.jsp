<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组长问题提交首页</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet" />

<link
	href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.yellow-amber.min.css" />
<link href="lib/css/material/material.css" rel="stylesheet" />
<link href="lib/css/app/per_manage.css" rel="stylesheet" type="text/css" />

</head>
<body>
	
	<div class="modal fade" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>修改成功</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header mdl-layout--fixed-drawer">
		
		<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

	<div class="mdl-layout__drawer">
	    <span class="mdl-layout-title">部门列表</span>
	    <nav class="mdl-navigation my-drawer">
	      
	    </nav>
	  </div>
		<main class="mdl-layout__content">
		
		<div class="page-content">
			
			<div class="mdl-grid">
				<div class="mdl-cell mdl-cell--1-col"> 
				<!-- Raised disabled button -->
					<button id="btnSave" class="mdl-button mdl-js-button mdl-button--raised">
					  保存
					</button>
				</div>
				
				<div class="mdl-cell mdl-cell--11-col"> 
				<!-- Raised disabled button -->
					<p id="pDeptName" >
					  
					</p>
					<div class="funkyradio mdl-cell mdl-cell--10-col"  id="permissionListBody">
					
					
					</div>
				</div>
				
			</div>

			
		</div>
		
		</main>
	</div>

</body>
<script type="text/javascript" src="lib/js/popper.min.js"></script>
<script type="text/javascript" src="lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/js/moment.js"></script>
<script type="text/javascript" src="lib/js/zh-cn.js"></script>
<script type="text/javascript" src="lib/js/material/material.js"></script>
<script type="text/javascript" src="lib/js/app/permission_management.js"></script>


</html>
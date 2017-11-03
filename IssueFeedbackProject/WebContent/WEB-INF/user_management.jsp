<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet">
<link href="lib/css/material/material.css" rel="stylesheet" />
<link href="lib/css/app/index.css" rel="stylesheet" />
<!-- <link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
      rel="stylesheet"/> -->
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

	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">

		<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

		<main class="mdl-layout__content">
		
			<div class="page-content">
				
				<div class="mdl-grid">
					<table  class="mdl-cell mdl-cell--1-offset mdl-cell--10-col mdl-data-table mdl-js-data-table mdl-shadow--2dp table-bordered" >
						
						<thead>

							<tr>
								<td>用户名</td>
								<td>部门</td>
								<td width="15%">姓名</td>
								<td>状态</td>
								<td></td>
	
							</tr>

						</thead>
							
						<tbody hidden="true" id="user_table">
							
						</tbody>
						
					</table>
					<div class="mdl-cell mdl-cell--2-col mdl-cell--5-offset" id="pbUser">
						<div class="mdl-spinner mdl-js-spinner is-active" ></div>
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
<script type="text/javascript" src="lib/js/popper.min.js"></script>
<script type="text/javascript" src="lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/js/material/material.js"></script>
<script type="text/javascript" src="lib/js/app/user_management.js"></script>
</html>
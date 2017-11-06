<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<jsp:include page="/WEB-INF/css_common.jsp"></jsp:include>
<link href="lib/css/app/common.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="modal fade" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">添加用户</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>添加成功</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">确定</button>
	      </div>
	    </div>
	  </div>
	</div>

	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
		<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
		<main class="mdl-layout__content">
		<div class="page-content">

			<div class="mdl-grid" style="margin-top: 20px">
			<div class=" mdl-cell mdl-cell--1-col "></div>
				<div class=" mdl-cell mdl-cell--10-col ">
					<form id="formAddDept"
						class="form-inline" method="get">
						<div class="form-group mx-sm-3">
							<label for="inputDeptName " class="sr-only">部门名称</label> <input
								class="form-control" id="inputDeptName" type="text" placeholder="部门名称"
								name="dept_name" />
						</div>
						<input type="submit" id="btnAddDept"
							class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored"
							value="添加" />
					</form>
				</div>
			</div>

			<div class="mdl-grid" style="margin-top: 20px">
				<div class="mdl-cell mdl-cell--1-col"></div>
				<table
					class="mdl-cell mdl-cell--10-col mdl-data-table mdl-js-data-table mdl-shadow--2dp table-bordered">

					<thead>
						<tr>
							<td>部门名称</td>
						</tr>
					</thead>
					<tbody id="dept_table">
						
					</tbody>
				</table>
			</div>


		</div>
		</main>
	</div>


</body>
<jsp:include page="/WEB-INF/script.jsp"></jsp:include>
<script type="text/javascript" src="lib/js/app/dept_management.js"></script>
</html>
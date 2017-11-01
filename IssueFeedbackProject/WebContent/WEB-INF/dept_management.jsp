<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet">

<link
	href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" />
<link href="lib/css/material/material.css" rel="stylesheet" />
<link href="lib/css/app/common.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
		<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
		<main class="mdl-layout__content">
		<div class="page-content">

			<div class="mdl-grid" style="margin-top: 20px">
			<div class=" mdl-cell mdl-cell--1-col "></div>
				<div class=" mdl-cell mdl-cell--10-col ">
					<form action="${pageContext.request.contextPath }/AddDept"
						class="form-inline" method="get">
						<div class="form-group mx-sm-3">
							<label for="inputDeptName " class="sr-only">部门名称</label> <input
								class="form-control" id="" type="text" placeholder="部门名称"
								name="dept_name" />
						</div>
						<input type="submit"
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
							<td>部门Id</td>
							<td>部门名称</td>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${all_depts }" var="dept">
							<tr>
								<td>${dept.id }</td>
								<td>${dept.deptName }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>


		</div>
		</main>
	</div>


</body>
<script type="text/javascript" src="lib/js/popper.min.js"></script>
<script type="text/javascript" src="lib/js/jquery-slim.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/js/material/material.js"></script>
</html>
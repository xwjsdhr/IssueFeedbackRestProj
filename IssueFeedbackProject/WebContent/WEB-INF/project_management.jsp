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
<link href="lib/css/app/index.css" rel="stylesheet" type="text/css" />
<link href="lib/css/app/common.css" rel="stylesheet" type="text/css" />

</head>
<body>

	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
		
		<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

		<main class="mdl-layout__content">
		
		<div class="page-content">
			
		
			
			<div class="mdl-grid">
				<div class="mdl-cell mdl-cell--1-col"></div>
				<table
					class="mdl-cell mdl-cell--10-col mdl-data-table mdl-js-data-table mdl-shadow--2dp">
					<thead>

						<tr>

							<td>编号</td>
							<td>项目</td>
							<td>管理部门</td>
						</tr>

					</thead>

					<tbody>

						<c:forEach items="${allProject }" var="project">
							<tr >
								<td>${project.id }</td>
								<td>${project.projectName }</td>
								<td>${project.dept.deptName}</td>
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
<script type="text/javascript" src="lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/js/moment.js"></script>
<script type="text/javascript" src="lib/js/zh-cn.js"></script>
<script type="text/javascript" src="lib/js/material/material.js"></script>
<script type="text/javascript" src="lib/js/app/project_management.js"></script>


</html>
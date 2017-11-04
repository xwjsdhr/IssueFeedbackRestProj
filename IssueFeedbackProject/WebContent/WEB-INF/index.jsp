<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组长问题提交首页</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet" />

<!-- <link
	href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" /> -->
<link href="lib/css/material/material.css" rel="stylesheet" />
<link href="lib/css/app/index.css" rel="stylesheet" type="text/css" />
<link href="lib/css/app/common.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
	
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

		<main class="mdl-layout__content">
		<div class="page-content">
			<c:if test="${fn:contains(user_session.dept.permissions,2) }">
				<div class="float-over-bottom">
					<a class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent"
						href="${pageContext.request.contextPath }/NewIssue"> 添加问题 </a>
				</div>
			</c:if>

				<div class="mdl-grid">
						<div class="mdl-cell mdl-cell--2-col"></div> 
						<form class="form-inline" id="searchForm">
							
							<div class="input-group" style="margin-left: 20px">
	  							<span class="input-group-addon">状态</span>
								<select class="selectpicker form-control">
								
									
								</select>
							</div>
							
							<div class="input-group" style="margin-left: 20px">
	  							<span class="input-group-addon">年</span>
								<select class=" form-control" id="yearSelector">
									
								</select>
							</div>
							
							<div class="input-group" style="margin-left: 20px">
	  							<span class="input-group-addon">周</span>
								<select class=" form-control" id="weekSelector">
									
								</select>
							</div>
							<button style="margin-left: 20px" type="submit"
								class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
								查询 <i class="ion-search"></i>
							</button>
						</form>
					</div>
		


			<div class="mdl-grid">
				<div class="mdl-cell mdl-cell--1-col"></div>
				<table id="issue_table"
					hidden="true"
					class="mdl-cell mdl-cell--10-col mdl-data-table mdl-js-data-table mdl-shadow--2dp">
					<thead>
						<tr>
							<td colspan="2">
								<button id="btnClickShow"
									class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
									导出</button>
							</td>
							<td colspan="2"></td>
							<td colspan="3"></td>
							<td></td>
							<td></td>
						</tr>
					</thead>

					

					<tbody id="mybody">

					</tbody>
				</table>
				<div class="mdl-cell mdl-cell--2-col mdl-cell--5-offset" id="pbIssues">
					<div class="mdl-spinner mdl-js-spinner is-active" ></div>
				</div>
				
			</div>
		
		</div>
		</div>

		</main>
	

</body>
<script type="text/javascript" src="lib/js/popper.min.js"></script>
<script type="text/javascript" src="lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="lib/js/jquery.ajax-progress.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>

<script type="text/javascript" src="lib/js/moment.js"></script>
<script type="text/javascript" src="lib/js/zh-cn.js"></script>
<script type="text/javascript" src="lib/js/material/material.js"></script>
<script type="text/javascript" src="lib/js/app/index.js"></script>

</html>
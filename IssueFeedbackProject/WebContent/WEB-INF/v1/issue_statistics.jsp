<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组长问题提交首页</title>
<jsp:include page="/WEB-INF/v1/css_common.jsp"></jsp:include>
	<link href="lib/css/app/common.css" rel="stylesheet" type="text/css"/>
</head>
<body>


<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
	
	<jsp:include page="/WEB-INF/v1/header.jsp"></jsp:include>

	<main class="mdl-layout__content">
		<div class="page-content">
			
			<div class="row">
				<div class="col-lg-2">
				
				</div>
				<div class="col-lg-2" id="colType">
				类型
					<select class="form-control" id="selectorType">
						<option value="">--选择类型--</option>
						<option value="year">年</option>
						<option value="week_of_year">周</option>
						<option value="month">月</option>
						<option value="dept_id">部门</option>
						<option value="project">系统</option>
						<option value="status_id">状态</option>
					</select>
				
				</div>
				<div class="col-lg-2" id="colYear">
					年
					<select class="form-control" id="selectorYear">
						<option value="">--选择年份--</option>
						<option>2010</option>
						<option>2011</option>
						<option>2012</option>
						<option>2013</option>
						<option>2014</option>
						<option>2015</option>
						<option>2016</option>
						<option>2017</option>
						<option>2018</option>
					</select>
				</div>
				
				<div class="col-lg-2">
					&nbsp;
					<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" type="button" id="btnQuery">查询</button>
					
				</div>
			</div>
			
			<div class="row">
			<div class="col-lg-1"></div>
			
				<div class="col-lg-10 col-lg-offset-1">
				
					 <canvas id="canvas" width="55%"></canvas>
				</div>
				
			</div>
		</div>
	</main>
</div>
</body>

<jsp:include page="/WEB-INF/v1/script.jsp"></jsp:include>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v1/issue_staistics.js"></script>


</html>
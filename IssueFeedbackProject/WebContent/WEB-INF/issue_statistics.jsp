<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组长问题提交首页</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet" />
	<link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" />
	<link href="lib/css/material/material.css" rel="stylesheet" />
	<link href="lib/css/app/common.css" rel="stylesheet" type="text/css"/>
</head>
<body>


<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
	
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

	<main class="mdl-layout__content">
		<div class="page-content">
		
			<div class="row">
				<div class="col-lg-2" style="margin-top: 20px">
					
	
						<div class="input-group mb-2 mr-sm-2 mb-sm-0">
							<div class="input-group-addon">年</div>
							<select class="form-control mb-2 mr-sm-2 mb-sm-0"
								id="inlineSelectYear">
								
							</select>
						</div>
					
				</div>
				<div class="col-lg-2" style="margin-top: 20px">
					
	
						<div class="input-group mb-2 mr-sm-2 mb-sm-0">
							<div class="input-group-addon">周</div>
							<select class="form-control mb-2 mr-sm-2 mb-sm-0"
								id="inlineSelect">
							</select>
						</div>
					
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
				
					<canvas id="myChart" width="400" height="200"></canvas>
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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.min.js"></script>
<script type="text/javascript" src="lib/js/app/issue_staistics.js"></script>


</html>
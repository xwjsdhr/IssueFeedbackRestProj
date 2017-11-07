<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组长问题提交首页</title>
<jsp:include page="/WEB-INF/css_common.jsp"></jsp:include>
	<link href="lib/css/app/common.css" rel="stylesheet" type="text/css"/>
</head>
<body>


<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
	
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>

	<main class="mdl-layout__content">
		<div class="page-content">
		
			
			<div class="row">
			<div class="col-lg-1"></div>
				<div class="col-lg-10">
				
					 <canvas id="canvas" width="55%"></canvas>
				</div>
			</div>
		</div>
	</main>
</div>
</body>

<jsp:include page="/WEB-INF/script.jsp"></jsp:include>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.min.js"></script>
<script type="text/javascript" src="lib/js/app/issue_staistics.js"></script>


</html>
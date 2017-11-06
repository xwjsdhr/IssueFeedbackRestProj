<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<jsp:include page="/WEB-INF/css_common.jsp"></jsp:include>
<link href="lib/css/app/common.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
	  
	  <jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	  
	  <main class="mdl-layout__content">
	    <div class="page-content">
	    
		<div class="mdl-grid">
			<div class="mdl-cell mdl-cell--1-col panel "></div>
			<div class="mdl-cell mdl-cell--10-col panel ">
				<form action="${pageContext.request.contextPath }/AddUser" method="post">
					<div class="form-froup">
						<label for="inputIssueTitle">用户名</label> <input
							id="inputIssueTitle" type="text"
							value="${user_session.username }" class="form-control"
							name="user_name" disabled /> 
							
							 <label for="inputRealName">姓名</label>
						<input type="text" id="inputRealName"
							value="${user_session.realName }" class="form-control"
							name="real_name" disabled /> <label for="selectDept">部门</label>
						<select name="dept_id" id="selectDept" class="form-control"
							disabled>
							<option value="${dept.id }">${user_session.dept.deptName }</option>
						</select>
					</div>

				</form>
			</div>
		</div>
	</div>
	    
	    </main>
	    </div>
	
</body>
<jsp:include page="/WEB-INF/script.jsp"></jsp:include>
<script type="text/javascript"  src="lib/js/app/user_info.js"></script>
</html>
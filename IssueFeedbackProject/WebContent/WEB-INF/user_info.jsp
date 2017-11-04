<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet">
<link href="lib/css/app/index.css" rel="stylesheet">
<!-- <link
	href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" /> -->
<link href="lib/css/material/material.css" rel="stylesheet" />
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
		<div class="mdl-grid ">
			<div class="mdl-cell mdl-cell--1-col panel "></div>
			<div class="mdl-cell mdl-cell--10-col panel ">

				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<td>
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle" type="button"
										id="dropdownMenuButton" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false">
										<c:if test="${select_status ==null }">
											状态
										</c:if>
										<c:if test="${select_status !=null }">
											${select_status.statusName }
										</c:if>
										<span class="badge badge-secondary">${issue_quantity }</span>
									</button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item" href="${pageContext.request.contextPath }/Index">全部</a>
										<c:forEach items="${all_status }" var="status">
											<form action="${pageContext.request.contextPath }/Index" method="get">
												<input type="hidden"  name="status_id"
													value="${status.id }" /> <input type="hidden"
													value="${status.statusName }" name="status_name" /> <input
													class="dropdown-item" type="submit"
													value="${status.statusName }" />
											</form>
										</c:forEach>
									</div>
								</div>

							</td>
							<td width="15%">标题</td>

							<td>问题内容</td>

							<td>时间</td>

							<td>
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle" type="button"
										id="dropdownMenuButton" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false">
										<c:if test="${select_dept == null }">
										部门 
										</c:if>
										<c:if test="${select_dept != null }">
										${select_dept.deptName }
										</c:if>
										<span class="badge badge-secondary">${dept_quantity }</span>
									</button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item" href="${pageContext.request.contextPath }/Index">全部</a>
										<c:forEach items="${all_depts }" var="dept">
											<form action="${pageContext.request.contextPath }/Index" method="get">
												<input type="hidden" name="dept_name"
													value="${dept.deptName }" /> <input type="hidden" 
													name="dept_id" value="${dept.id }" /> <input
													class="dropdown-item" type="submit"
													value="${dept.deptName }" />
											</form>
										</c:forEach>
									</div>
								</div>

							</td>
							<td width="10%"></td>
						</tr>
					</thead>

					<tbody>

						<c:forEach items="${list }" var="issue">
							<tr>
								<td><c:choose>
										<c:when test="${issue.status.id == 1 }">
											<span class="badge badge-pill badge-danger">${issue.status.statusName }</span>
										</c:when>
										<c:when test="${issue.status.id == 2 }">
											<span class="badge badge-pill badge-warning">${issue.status.statusName }</span>
										</c:when>
										<c:when test="${issue.status.id == 3 }">
											<span class="badge badge-pill badge-success">${issue.status.statusName }</span>
										</c:when>
									</c:choose> <span class="badge badge-pill badge-success">${issue.commentsNum }</span>
								</td>
								<td>${issue.title }</td>
								<td>${issue.content }</td>
								<td>${issue.submitTime}</td>
								<td>${issue.user.dept.deptName }</td>

								<td><a
									href="${pageContext.request.contextPath }/IssueDetail?id=${issue.id }"
									class="btn btn-primary">查看</a></td>

							</tr>
						</c:forEach>

					</tbody>
				</table>

			</div>
		</div>
	</div>
	    
	    
	    
	    
	    
	    
	    
	    </main>
	    </div>
	
</body>
<script type="text/javascript" src="lib/js/popper.min.js"></script>
<script type="text/javascript" src="lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
<script type="text/javascript"  src="lib/js/material/material.js"></script>
</html>
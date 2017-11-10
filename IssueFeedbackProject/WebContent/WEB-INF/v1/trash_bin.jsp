<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组长问题提交首页</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet">
<link href="lib/css/app/index.css" rel="stylesheet">
      
      <link href="lib/css/material/material.css" rel="stylesheet" />
      <link href="lib/css/app/common.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
	  
	  <jsp:include page="/WEB-INF/v1/header.jsp"></jsp:include>
	  
	  <main class="mdl-layout__content">
	    <div class="page-content">
		<div class="row ">
			<div class="col-md-12 panel ">
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
											<c:if test="${status.id != 5 }">
												<form action="${pageContext.request.contextPath }/Index" method="get">
													<input type="hidden" name="status_id"
														value="${status.id }" /> <input type="hidden"
														value="${status.statusName }" name="status_name" /> <input
														class="dropdown-item" type="submit"
														value="${status.statusName }" />
												</form>
											</c:if>
											
										</c:forEach>
									</div>
								</div>

							</td>
							<td width="15%">标题</td>

							<td>时间</td>

							<td>
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle" type="button"
										id="dropdownMenuButton" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false">
										<c:if test="${real_name == null }">
										提交人
										</c:if>
										<c:if test="${real_name != null }">
											${real_name }
										</c:if>
									</button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<a class="dropdown-item" href="${pageContext.request.contextPath }/Index">全部</a>
										<c:forEach items="${all_users }" var="user">
											<form action="${pageContext.request.contextPath }/Index" method="get">
												<input type="hidden" name="real_name"
													value="${user.realName }" /> <input type="hidden"
													name="user_id" value="${user.id }" /> <input
													class="dropdown-item" type="submit"
													value="${user.realName }" />
											</form>
										</c:forEach>
									</div>
								</div>
							</td>

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
							<c:if test="${user_session.dept.id == 4 }">
								<td>还原</td>
							</c:if>
							<td width="10%"></td>
						</tr>
					</thead>

					<tbody>

						<c:forEach items="${deleted_list }" var="issue">
							<tr>
								<td><c:choose>
										<c:when test="${issue.status.id == 1 }">
											<span class="badge badge-pill badge-secondary">${issue.status.statusName }</span>
										</c:when>
										<c:when test="${issue.status.id == 2 }">
											<span class="badge badge-pill badge-warning">${issue.status.statusName }</span>
										</c:when>
										<c:when test="${issue.status.id == 3 }">
											<span class="badge badge-pill badge-success">${issue.status.statusName }</span>
										</c:when>
										<c:when test="${issue.status.id == 4 }">
											<span class="badge badge-pill badge-danger">${issue.status.statusName }</span>
										</c:when>
									</c:choose> <span class="badge badge-pill badge-info">${issue.commentsNum }</span>
								</td>
								<td>${issue.title }</td>

								<td>${issue.submitTime}</td>
								<td>${issue.user.realName }</td>
								<td>${issue.user.dept.deptName }</td>
								<td><a
									href="${pageContext.request.contextPath }/Restore?id=${issue.id }"
									class="btn btn-success">还原</a></td>
								<td><a
									href="${pageContext.request.contextPath }/IssueDetail?id=${issue.id }"
									class="btn btn-link">查看</a></td>
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
<jsp:include page="/WEB-INF/v1/script.jsp"></jsp:include>
</html>
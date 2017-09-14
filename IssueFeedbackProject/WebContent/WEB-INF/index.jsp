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
</head>
<body>
	<div class="container">

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">组长问题提交</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="/IssueFeedbackProject/Index">首页 <span class="sr-only">(current)</span>
					</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 问题管理 </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="nav-link" href="/IssueFeedbackProject/NewIssue">添加问题</a>
							<c:if test="${user_session.dept.id == 4 }">
								<a class="nav-link" href="/IssueFeedbackProject/TrashBin">回收站</a>
							</c:if>
						</div></li>

					<c:if test="${user_session.dept.id == 4 }">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle"
							href="/IssueFeedbackProject/UserManagement"
							id="navbarDropdownMenuLink" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> 用户管理 </a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="#">添加用户</a>
							</div></li>
						<li class="nav-item"><a class="nav-link"
							href="/IssueFeedbackProject/DeptManagement">部门管理</a></li>

					</c:if>

				</ul>
				<form action="/IssueFeedbackProject/Index" method="get"
					class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" name="keyword" type="text"
						placeholder="请输入关键字" aria-label="Search" value="${keyword }" />
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
				</form>

				<div class="btn-group " role="group">
					<a class="btn btn-link" href="/IssueFeedbackProject/UserInfo">${user_session.realName}</a>
					<a class="nav-link" href="/IssueFeedbackProject/Logout">退出</a>
				</div>
			</div>
		</nav>
		<div class="row ">
			<div class="col-md-12 panel">
				<form action="/IssueFeedbackProject/Index" class="form-inline">

					<div class="input-group mb-2 mr-sm-2 mb-sm-0">
						<div class="input-group-addon">部门</div>
						<select name="dept_id" class="form-control mb-2 mr-sm-2 mb-sm-0"
							id="inlineFormInputName2">
							<c:if test="${dept_id == dept.id }">
									<option value="-1" selected="selected">全部部门</option>
								</c:if>
								<c:if test="${dept_id != dept.id }">
									<option value="-1">全部部门</option>
								</c:if>
							<c:forEach items="${all_depts }" var="dept">

								<c:if test="${dept_id == dept.id }">
									<option value="${dept.id }" selected="selected">${dept.deptName}</option>
								</c:if>
								<c:if test="${dept_id != dept.id }">
									<option value="${dept.id }">${dept.deptName}</option>
								</c:if>

							</c:forEach>
						</select>
					</div>
					<div class="input-group mb-2 mr-sm-2 mb-sm-0">
						<div class="input-group-addon">用户</div>
						<select name="user_id" class="form-control mb-2 mr-sm-2 mb-sm-0"
							id="inlineFormInputName2">
							<c:if test="${user_id == user.id }">
									<option value="-1" selected="selected">全部用户</option>
								</c:if>
								<c:if test="${user_id != user.id }">
									<option value="-1">全部用户</option>
								</c:if>
							
							<c:forEach items="${all_users }" var="user">

								<c:if test="${user_id == user.id }">
									<option value="${user.id }" selected="selected">${user.realName}</option>
								</c:if>
								<c:if test="${user_id != user.id }">
									<option value="${user.id }">${user.realName}</option>
								</c:if>

							</c:forEach>
						</select>
					</div>
					
					<label class="sr-only" for="inlineFormInputGroupUsername2">Username</label>
					<div class="input-group mb-2 mr-sm-2 mb-sm-0">
						<div class="input-group-addon">状态</div>
						<select name="status_id" class="form-control mb-2 mr-sm-2 mb-sm-0"
							id="inlineFormInputName2">
							<c:if test="${status_id == status.id }">
								<option value="-1" selected="selected">全部状态</option>
							</c:if>

							<c:if test="${status_id != status.id }">
								<option value="-1">全部状态</option>
							</c:if>


							<c:forEach items="${all_status }" var="status">
								<c:if test="${status_id == status.id }">
									<option value="${status.id }" selected="selected">${status.statusName }</option>
								</c:if>

								<c:if test="${status_id != status.id }">
									<option value="${status.id }">${status.statusName }</option>
								</c:if>

							</c:forEach>
						</select>
					</div>

					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<div class="row ">
			<div class="col-md-12 ">
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
										<a class="dropdown-item" href="/IssueFeedbackProject/Index">全部</a>
										<c:forEach items="${all_status }" var="status">
											<form action="/IssueFeedbackProject/Index" method="get">
												<input type="hidden" href="#" name="status_id"
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
							<td>创建时间</td>
							<td>上次更新时间</td>
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
										<a class="dropdown-item" href="/IssueFeedbackProject/Index">全部</a>
										<c:forEach items="${all_users }" var="user">
											<form action="/IssueFeedbackProject/Index" method="get">
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
										<a class="dropdown-item" href="/IssueFeedbackProject/Index">全部</a>
										<c:forEach items="${all_depts }" var="dept">
											<form action="/IssueFeedbackProject/Index" method="get">
												<input type="hidden" href="#" name="dept_name"
													value="${dept.deptName }" /> <input type="hidden" href="#"
													name="dept_id" value="${dept.id }" /> <input
													class="dropdown-item" type="submit"
													value="${dept.deptName }" />
											</form>
										</c:forEach>
									</div>
								</div>

							</td>
							<c:if test="${user_session.dept.id == 4 }">
								<td>删除</td>
							</c:if>
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

									</c:choose> <span class="badge badge-pill badge-info">${issue.commentsNum }</span>
								</td>
								<td>${issue.title }</td>

								<td>${issue.submitTime}</td>
								<td>${issue.lastUpdateTime }</td>
								<td>${issue.user.realName }</td>
								<td>${issue.user.dept.deptName }</td>
								<c:if test="${user_session.dept.id == 4 }">
									<td><a
										href="/IssueFeedbackProject/DeleteIssue?issue_id=${issue.id }"
										class="btn btn-danger">删除</a></td>
								</c:if>
								<td><a
									href="/IssueFeedbackProject/IssueDetail?id=${issue.id }"
									class="btn btn-link">查看</a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
				<!-- 
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${issue_page.pageNum == 1 }">
							<li class="page-item"><a class="page-link" href="#" disabled>上一页</a></li>
						</c:if>
						<c:if test="${issue_page.pageNum != 1 }">
							<li class="page-item"><a class="page-link" href="/IssueFeedbackProject/Index?page_num=${issue_page.pageNum-1 }">上一页</a></li>
						</c:if>
						
						<c:forEach items="${issue_page.pageItems }" var="page">
							<c:if test="${page == issue_page.pageNum }">
								<li class="page-item active"><a class="page-link" href="#">${page}</a></li>
							</c:if>
							<c:if test="${page !=issue_page.pageNum }">
								<li class="page-item"><a class="page-link"
									href="/IssueFeedbackProject/Index?page_num=${page }">${page}</a></li>
							</c:if>
						</c:forEach>
						
						<c:if test="${issue_page.pageNum == issue_page.maxPageNum }">
							<li class="page-item"><a class="page-link" href="#" disabled>下一页</a></li>
						</c:if>
						<c:if test="${issue_page.pageNum != issue_page.maxPageNum }">
							<li class="page-item"><a class="page-link" href="/IssueFeedbackProject/Index?page_num=${issue_page.pageNum+1 }">下一页</a></li>
						</c:if>
					</ul>
				</nav>
				 -->
			</div>

		</div>
	</div>
</body>
<script type="text/javascript" src="lib/js/popper.min.js"></script>
<script type="text/javascript" src="lib/js/jquery-slim.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/js/index.js"></script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组长问题提交首页</title>
<link href="lib/css/bootstrap.min.css" rel="stylesheet" />
<link href="lib/css/app/index.css" rel="stylesheet" type="text/css" />
<link
	href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" />
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">组长问题提交</a>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="${pageContext.request.contextPath }/Index"> <i
							class="ion-home"></i> 首页
					</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink1" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"
						style="vertical-align: middle;"> <i class="ion-help-circled"></i>
							问题管理
					</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink1">
							<a class="dropdown-item"
								href="${pageContext.request.contextPath }/NewIssue"> <i
								class="ion-plus"></i> 添加问题
							</a>
							<c:if test="${user_session.dept.id == 4 }">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath }/TrashBin"> <i
									class="ion-trash-a"></i> 回收站
								</a>
							</c:if>
						</div></li>

					<c:if test="${user_session.dept.id == 4 }">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle"
							href="${pageContext.request.contextPath }/UserManagement"
							id="navbarDropdownMenuLink2" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> <i
								class="ion-person-stalker"></i> 用户管理
						</a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink2">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath }/Register"> <i
									class="ion-person-add"></i> 添加用户
								</a>
							</div></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath }/DeptManagement"> <i
								class="ion-ios-people"></i> 部门管理
						</a></li>
						
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath }/Statistics"> <i
								class="ion-stats-bars"></i> 统计管理
						</a></li>

					</c:if>

				</ul>
				<form action="${pageContext.request.contextPath }/Index"
					method="get" class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" name="keyword" id="inputSearch" type="text"
						placeholder="请输入关键字" aria-label="Search" value="${keyword }" required/>
					<button id="btnSearch" class="btn btn-outline-success my-2 my-sm-0" type="submit">
						搜索 <i class="ion-search"></i>
					</button>
				</form>

				<div class="btn-group " role="group">

					<a class="btn btn-link"
						href="${pageContext.request.contextPath }/UserInfo"> <i
						class="ion-person"></i> ${user_session.realName}
					</a> <a class="btn btn-link"
						href="${pageContext.request.contextPath }/Logout"> 退出 <i
						class="ion-log-out"></i>
					</a>
				</div>
			</div>
		</nav>
		<div class="row ">
			<div class="col-md-12 panel">
				<form action="${pageContext.request.contextPath }/Index"
					class="form-inline">

					<div class="input-group mb-2 mr-sm-2 mb-sm-0">
						<div class="input-group-addon">部门</div>
						<select name="dept_id" class="form-control mb-2 mr-sm-2 mb-sm-0"
							id="inlineSelectDepts">
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
							id="selectUsers">
							<c:if test="${user_id == user.id }">
								<option value="-1" selected="selected">全部用户</option>
							</c:if>
							<c:if test="${user_id != user.id }">
								<option value="-1">全部用户</option>
							</c:if>
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
					<div class="input-group mb-2 mr-sm-2 mb-sm-0">
						<div class="input-group-addon">排序</div>
						<select name="order" class="form-control mb-2 mb-sm-0"
							id="inlineFormInputName2">
							<c:if test="${empty order }">
								<option value="last_update_time" selected="selected">最新更新时间</option>
							</c:if>
							<c:if test="${order != null && last_update_time =='last_update_time' }">
								<option value="last_update_time" selected="selected">最新更新时间</option>
							</c:if>
							<c:if test="${order != null && last_update_time !='last_update_time' }">
								<option value="last_update_time" >最新更新时间</option>
							</c:if>
							
							<c:if test="${order == 'status_id' }">
								<option value="status_id" selected="selected">状态</option>
							</c:if>
							<c:if test="${order != 'status_id' }">
								<option value="status_id" >状态</option>
							</c:if>
							<c:if test="${order == 'user_id' }">
								<option value="user_id" selected="selected">用户</option>
							</c:if>
							<c:if test="${order != 'user_id' }">
								<option value="user_id" >用户</option>
							</c:if>
							<c:if test="${order == 'dept_id' }">
								<option value="dept_id" selected="selected">部门</option>
							</c:if>
							<c:if test="${order != 'dept_id' }">
								<option value="dept_id" >部门</option>
							</c:if>
							<c:if test="${order == 'submit_time' }">
								<option value="submit_time" selected="selected">创建时间</option>
							</c:if>
							<c:if test="${order != 'submit_time' }">
								<option value="submit_time" >创建时间</option>
							</c:if>
							
							
						</select>
						
						<span class="input-group-addon"><a id="label_order_type">
							<c:if test="${empty order_type }">
								正序
							</c:if>
							<c:if test="${order_type == 'off' }">
								正序
							</c:if>
							<c:if test="${order_type == 'on' }">
								倒序
							</c:if>
						</a>
							<c:if test="${empty order_type }">
								<input style="margin-left: 10px"   id="chb_order_type" type="checkbox" name="order_type" />
							</c:if>
						    <c:if test="${order_type == 'off' }">
						     	<input style="margin-left: 10px"   id="chb_order_type" type="checkbox" name="order_type" />
						    </c:if>
						    <c:if test="${order_type == 'on' }">
						     	<input style="margin-left: 10px" checked="checked" id="chb_order_type" type="checkbox" name="order_type" />
						    </c:if>
						</span>
					</div>
					

					<button type="submit" class="btn btn-primary">
						查询 <i class="ion-search"></i>
					</button>
				</form>
			</div>
		</div>
		<div class="row ">
			<div class="col-md-12 ">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<td colspan="2">
								<button id="btnClickShow" class="btn btn-info btn-sm">导出</button>
							</td>
							<td colspan="2"></td>
							<td colspan="3"></td>
							<td></td>

						</tr>
					</thead>

					<thead>

						<tr>

							<td>
								<button id="btnSelectAll" class="btn btn-info btn-sm">全选</button>
							</td>
							<td><span class="badge badge-secondary">${issue_quantity }</span>
								状态</td>
							<td width="15%">标题</td>
							<td>创建时间</td>
							<td>上次更新时间</td>
							<td>提交人</td>

							<td><span class="badge badge-secondary">${dept_quantity }
							</span> 部门</td>
							<td></td>

						</tr>

					</thead>

					<tbody>

						<c:forEach items="${list }" var="issue">
							<tr class="clickableRow" id="${issue.id }">
								<td><input id="chb_${issue.id }" type="checkbox"
									value="${issue.id }" class="selectedCheckbox" /></td>
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

								<td class="submit_time_td">${issue.submitTime}</td>
								<td  class="last_update_time_td">${issue.lastUpdateTime }</td>
								<td>${issue.user.realName }</td>
								<td>${issue.user.dept.deptName }</td>
							
								<td>
									<div class="btn-group" role="group"
										aria-label="Button group with nested dropdown">

										<c:if test="${user_session.dept.id == 4 }">
											<a
												href="${pageContext.request.contextPath }/DeleteIssue?issue_id=${issue.id }"
												class="btn btn-danger btn-sm"> <i class="ion-trash-a"></i>
												删除
											</a>
										</c:if>

										<a
											href="${pageContext.request.contextPath }/IssueDetail?id=${issue.id }"
											class="btn btn-primary btn-sm">查看 <i
											class="ion-arrow-right-a"></i>
										</a>
									</div>
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>

			</div>

		</div>
	</div>
</body>
<script type="text/javascript" src="lib/js/popper.min.js"></script>
<script type="text/javascript" src="lib/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="lib/js/bootstrap.min.js"></script>
<script type="text/javascript" src="lib/js/index.js"></script>
<script type="text/javascript" src="lib/js/moment.js"></script>
<script type="text/javascript" src="lib/js/zh-cn.js"></script>


</html>
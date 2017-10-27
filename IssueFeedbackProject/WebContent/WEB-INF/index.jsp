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
<link href="lib/css/material/material.css" rel="stylesheet" />
<link href="lib/css/app/index.css" rel="stylesheet" type="text/css" />
<link href="lib/css/app/common.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
		<header class="mdl-layout__header">
			<div class="mdl-layout__header-row">
				<!-- Title -->
				<span class="mdl-layout-title">组长问题提交</span>
				<!-- Add spacer, to align navigation to the right -->
				<div class="mdl-layout-spacer"></div>
				<!-- Navigation. We hide it in small screens. -->
				<nav class="mdl-navigation mdl-layout--large-screen-only">

					<a class="mdl-navigation__link" href="#"> <i class="ion-home"></i>
						首页
					</a>
					<button id="demo-menu-lower-issue" class="mdl-button mdl-js-button"
						style="color: white;">
						<i class="ion-help-circled"></i> 问题管理
					</button>

					<ul
						class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
						for="demo-menu-lower-issue">
						<li><a class="mdl-menu__item"
							href="${pageContext.request.contextPath }/NewIssue"> <i
								class="ion-plus"></i> 添加问题
						</a></li>
						<c:if test="${user_session.dept.id == 4 }">
							<li><a class="mdl-menu__item"
								href="${pageContext.request.contextPath }/TrashBin"> <i
									class="ion-trash-a"></i> 回收站
							</a></li>
						</c:if>
					</ul>
					<c:if test="${user_session.dept.id == 4 }">
						<button id="demo-menu-lower-user" class="mdl-button mdl-js-button"
							style="color: white;">
							<i class="ion-person-stalker"></i> 用户管理
						</button>
						<ul
							class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
							for="demo-menu-lower-user">
							<li><a class="mdl-menu__item"
								href="${pageContext.request.contextPath }/Register"> <i
									class="ion-plus"></i> 添加用户
							</a></li>
						</ul>

						<a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/DeptManagement"> <i
							class="ion-ios-people"></i> 部门管理
						</a>

						<%-- <a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/Statistics"> <i
							class="ion-stats-bars"></i> 统计管理
						</a> --%>

						<a class="mdl-navigation__link"
							href="${pageContext.request.contextPath }/ProjectManagement">
							<i class="ion-stats-bars"></i> 项目管理
						</a>
					</c:if>


					<a class="mdl-navigation__link"
						href="${pageContext.request.contextPath }/UserInfo"> <i
						class="ion-person"></i> ${user_session.realName}
					</a> <a class="mdl-navigation__link"
						href="${pageContext.request.contextPath }/Logout"> 退出 <i
						class="ion-log-out"></i>
					</a>
				</nav>

			</div>

		</header>

		<main class="mdl-layout__content">
		<div class="page-content">
			<div class="float-over-bottom">
				<a class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent"
					href="${pageContext.request.contextPath }/NewIssue"> 添加问题 </a>
			</div>


				<div class="mdl-grid">
						 <div class="mdl-cell mdl-cell--2-col"></div>
						 
						<form action="${pageContext.request.contextPath }/Index" class="form-inline">
							<div class="mdl-grid">
								<ul name="dept_id" class="list mb-2 mr-sm-2 mb-sm-0"
									id="inlineSelectDepts">
									<c:if test="${dept_id == dept.id }">
										<li class="list-item" value="-1">全部部门</li>
									</c:if>
									<c:if test="${dept_id != dept.id }">
										<li class="list-item" value="-1">全部部门</li>
									</c:if>
									<c:forEach items="${all_depts }" var="dept">
	
										<c:if test="${dept_id == dept.id }">
											<li class="list-item" value="${dept.id }" >${dept.deptName}</li>
										</c:if>
										<c:if test="${dept_id != dept.id }">
											<li class="list-item" value="${dept.id }">${dept.deptName}</li>
										</c:if>
	
									</c:forEach>
								</ul>
							</div>
							
							<div class="mdl-grid">
							
								<ul name="status_id"
									class="list mb-2 mr-sm-2 mb-sm-0"
									id="inlineFormInputName2">
									<c:if test="${status_id == status.id }">
										<li value="-1" class="list-item">全部状态</li>
									</c:if>
	
									<c:if test="${status_id != status.id }">
										<li value="-1" class="list-item">全部状态</li>
									</c:if>
	
	
									<c:forEach items="${all_status }" var="status">
										<c:if test="${status_id == status.id }">
											<li value="${status.id }" class="list-item">${status.statusName }</li>
										</c:if>
	
										<c:if test="${status_id != status.id }">
											<li value="${status.id }" class="list-item">${status.statusName }</li>
										</c:if>
	
									</c:forEach>
								</ul>
							</div>
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon">排序</div>
								<select name="order" class="form-control mb-2 mb-sm-0"
									id="inlineFormInputName2">
									<c:if test="${empty order }">
										<option value="last_update_time" selected="selected">最新更新时间</option>
									</c:if>
									<c:if
										test="${order != null && last_update_time =='last_update_time' }">
										<option value="last_update_time" selected="selected">最新更新时间</option>
									</c:if>
									<c:if
										test="${order != null && last_update_time !='last_update_time' }">
										<option value="last_update_time">最新更新时间</option>
									</c:if>
	
									<c:if test="${order == 'status_id' }">
										<option value="status_id" selected="selected">状态</option>
									</c:if>
									<c:if test="${order != 'status_id' }">
										<option value="status_id">状态</option>
									</c:if>
									<c:if test="${order == 'user_id' }">
										<option value="user_id" selected="selected">用户</option>
									</c:if>
									<c:if test="${order != 'user_id' }">
										<option value="user_id">用户</option>
									</c:if>
									<c:if test="${order == 'dept_id' }">
										<option value="dept_id" selected="selected">部门</option>
									</c:if>
									<c:if test="${order != 'dept_id' }">
										<option value="dept_id">部门</option>
									</c:if>
									<c:if test="${order == 'submit_time' }">
										<option value="submit_time" selected="selected">创建时间</option>
									</c:if>
									<c:if test="${order != 'submit_time' }">
										<option value="submit_time">创建时间</option>
									</c:if>
	
	
								</select> <span class="input-group-addon"><a id="label_order_type">
										<c:if test="${empty order_type }">
									正序
								</c:if> <c:if test="${order_type == 'off' }">
									正序
								</c:if> <c:if test="${order_type == 'on' }">
									倒序
								</c:if>
								</a> <c:if test="${empty order_type }">
										<input style="margin-left: 10px" id="chb_order_type"
											type="checkbox" name="order_type" />
									</c:if> <c:if test="${order_type == 'off' }">
										<input style="margin-left: 10px" id="chb_order_type"
											type="checkbox" name="order_type" />
									</c:if> <c:if test="${order_type == 'on' }">
										<input style="margin-left: 10px" checked="checked"
											id="chb_order_type" type="checkbox" name="order_type" />
									</c:if> </span>
							</div>
							<button type="submit"
								class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored">
								查询 <i class="ion-search"></i>
							</button>
						</form>
					</div>
		


			<div class="mdl-grid">
				<div class="mdl-cell mdl-cell--1-col"></div>
				<table
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

					<thead>

						<tr>

							<td></td>
							<td><span class="badge badge-secondary">${issue_quantity }</span>
								状态</td>
							<td width="15%">标题</td>
							<td>创建时间</td>
							<td>上次更新时间</td>
							<td>提交人</td>
							<td>系统</td>
							<td>负责部门</td>
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
											<span class="mdl-chip mdl-chip-unsovled"> <span
												class="mdl-chip__text ">${issue.status.statusName }</span>
											</span>
										</c:when>
										<c:when test="${issue.status.id == 2 }">
											<span class="mdl-chip mdl-chip-feedback"> <span
												class="mdl-chip__text ">${issue.status.statusName }</span>
											</span>

										</c:when>
										<c:when test="${issue.status.id == 3 }">
											<span class="mdl-chip mdl-chip-sovled"> <span
												class="mdl-chip__text ">${issue.status.statusName }</span>
											</span>
										</c:when>
										<c:when test="${issue.status.id == 4 }">

											<span class="mdl-chip mdl-chip-problem"> <span
												class="mdl-chip__text ">${issue.status.statusName }</span>
											</span>
										</c:when>
									</c:choose> <span class="badge badge-pill badge-info">${issue.comments.size()}</span>
								</td>
								<td style="font-size: 14px; font-weight: bolder;">${issue.title }</td>

								<td class="submit_time_td">${issue.submitTime}</td>
								<td class="last_update_time_td">${issue.lastUpdateTime }</td>
								<td>${issue.user.realName }</td>
								<td>${issue.project.projectName }</td>
								<td>${issue.project.dept.deptName}</td>
								<td>
									<button id="demo-menu-lower-more_${issue.id }"
										class="mdl-button mdl-js-button">
										<i class="ion-android-more-vertical"></i>
									</button>
									<ul
										class="mdl-menu mdl-menu--bottom-left mdl-js-menu mdl-js-ripple-effect"
										for="demo-menu-lower-more_${issue.id }">

										<c:if test="${user_session.dept.id == 4 }">
											<li><a class="mdl-menu__item"
												href="${pageContext.request.contextPath }/DeleteIssue?issue_id=${issue.id }">
													删除 <i class="ion-trash-a"></i>
											</a></li>

										</c:if>
										<li><a class="mdl-menu__item"
											href="${pageContext.request.contextPath }/IssueDetail?id=${issue.id }">查看
												<i class="ion-arrow-right-a"></i>
										</a></li>
									</ul>
								</td>
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

<script type="text/javascript" src="lib/js/moment.js"></script>
<script type="text/javascript" src="lib/js/zh-cn.js"></script>
<script type="text/javascript" src="lib/js/NIM_Web_NIM_v4.2.0.js"></script>
<script type="text/javascript" src="lib/js/material/material.js"></script>
<script type="text/javascript" src="lib/js/app/index.js"></script>

</html>
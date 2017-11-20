<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<jsp:include page="/WEB-INF/v2/stylesheet_beta.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/lib/css/app/issue_detail.css" rel="stylesheet">
</head>

<body class="app header-fixed sidebar-fixed aside-menu-fixed aside-menu-hidden">
  <jsp:include page="/WEB-INF/v2/header.jsp"></jsp:include>
  <div class="app-body">
  	<jsp:include page="/WEB-INF/v2/siderbar.jsp"></jsp:include>
    <!-- Main content -->
    <main class="main">
      <!-- Breadcrumb -->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">模块管理</li>
        <li class="breadcrumb-item"><a href="index">组长问题反馈</a></li>
        <li class="breadcrumb-item active">问题详情</li>
        
         <li class="breadcrumb-menu d-md-down-none">
          <div class="btn-group" role="group" aria-label="Button group">
	          <a class="btn nav-link" id="btnCommend" href="#replyRow"><i class="icon-bubbles"></i>&nbsp;回复 </a>
          </div>
        </li>
      </ol>
      <div class="container-fluid">
        
          <div class="row">
            <div class="col-md-12">
              
              <div class="card"> 
		        <div class="card-header">
		          	 <i class="fa fa-commenting-o"></i>&nbsp; &nbsp;&nbsp; <b> ${issue_detail.title }</b> &nbsp;  / &nbsp;
		          	 
		          	 <span class="badge  badge-secondary">${issue_detail.project.projectName}</span>
		          	  &nbsp;  /  &nbsp;
		          	 <span class="badge  badge-secondary">${issue_detail.projectModule.projectModuleName}</span>
		          	 &nbsp; &nbsp;&nbsp;
						<c:choose>
							<c:when test="${issue_detail.status.id == 1 }">
								<span class="badge  badge-secondary">${issue_detail.status.statusName }</span>
							</c:when>
							<c:when test="${issue_detail.status.id == 2 }">
								<span class="badge  badge-warning">${issue_detail.status.statusName }</span>
							</c:when>
							<c:when test="${issue_detail.status.id == 3 }">
								<span class="badge  badge-success">${issue_detail.status.statusName }</span>
							</c:when>
							<c:when test="${issue_detail.status.id == 4 }">
								<span class="badge  badge-danger">${issue_detail.status.statusName }</span>
							</c:when>
							<c:when test="${issue_detail.status.id == 5 }">
								<span class="badge  badge-info">${issue_detail.status.statusName }</span>
							</c:when>
						</c:choose>
		        </div>
          
				        <div class="card-body">
				        	<label for="issueContent"><b>问题描述</b></label>
				        	<p class="card-text" id="issueContent">${issue_detail.content }</p>
					          
				        </div>
				        <div class="card-footer">
				        	<b>提交用户：</b><span class="badge  badge-primary" >${issue_detail.user.username } </span>
				        	
				        	<span class="badge  badge-danger" style="float: right;">${issue_detail.submitTime }</span>
				        	<b  style="float: right;">提交时间：</b>
				        </div>
       				</div>
       				
       				<div class="card">
       				<div class="card-header"><b>问题回复</b>
       				 <a class="btn btn-primary btn-sm" data-toggle="collapse" href="#collapseExample" style="float: right;" aria-expanded="false" aria-controls="collapseExample">
					    显示/隐藏
					  </a>
       				</div>
       					<div class="cord-body collapse" class="" id="collapseExample">
       						
				        	<div class="comments"  id="comment_list_div">
										
										<c:forEach items="${issue_detail.comments }" var="comment">
											
											<div class="comment-wrap">   
												<div class="photo text-center" >
													<div class="avatar " 
													 style="background-image: url('https://cdn0.iconfinder.com/data/icons/PRACTIKA/256/user.png')">
													 </div>
													<br/>
													<span class="badge  badge-success"> ${comment.user.realName }</span>
												</div>
												<div class="card " style="margin-left: 12px">
														<%-- <c:if test="${comment.isResovleIssue == 1 }">
															<span class="badge badge-pill badge-success">已解决</span>
														</c:if>
														<c:if test="${comment.isProblem == 1 }">
															<span class="badge badge-pill badge-danger">疑难问题</span>
														</c:if> --%>
														<div class="card-body">
															<div class="row">
																<div class="col-lg-5">
																	<c:if test="${comment.status!= null }">
																		
																		<c:choose>
																			<c:when test="${comment.status.id == 1 }">
																				<span class="badge  badge-secondary">${comment.status.statusName }</span>
																			</c:when>
																			<c:when test="${comment.status.id == 2 }">
																				<span class="badge  badge-warning">${comment.status.statusName }</span>
																			</c:when>
																			<c:when test="${comment.status.id == 3 }">
																				<span class="badge  badge-success">${comment.status.statusName }</span>
																			</c:when>
																			<c:when test="${comment.status.id == 4 }">
																				<span class="badge  badge-danger">${comment.status.statusName }</span>
																			</c:when>
																			<c:when test="${comment.status.id == 5 }">
																				<span class="badge  badge-info">${comment.status.statusName }</span>
																			</c:when>
																		</c:choose>
																	</c:if>
																	<p class="comment-text">
																	 ${comment.content }
																	</p>
																</div>
															</div>
														</div>
														<div class="card-footer">
															<div class="text-right"><b> ${comment.createTime }</b></div>
														</div>
												</div>
											</div>
										</c:forEach>
									</div>
       					</div>
       				</div>
       				
       				<div class="card border-primary">
						<div class="card-body">
								<div class="row">
									<div class="col-lg-12">
										<c:if test="${fn:contains(user_login.dept.permissions,8) }">
										<!-- action="${pageContext.request.contextPath }/AddComment" -->
											<form id="formReply" method="get">
												<div class="row">
													<input type="hidden" name="issue_id" id="issueDetailId" value="${issue_detail.id }" />
													<input type="hidden" name="user_id" value="${user_session.id }" />
													<div class="col-lg-12">
														<label  for="textareaCommentContent"><b>回复描述</b></label>
														<textarea name="comment"  class="form-control"
															id="textareaCommentContent" rows="10"></textarea>
													</div>
												</div>
												<c:if test="${fn:contains(user_login.dept.permissions,12) }">
													<div class="row"> 
														<div class="col-lg-3" style="margin-top: 20px;">
															<label for="statusSelect"><b>更新状态</b></label>
															<select id="statusSelect" style="width: 100%"></select>
														</div>
													</div>
												</c:if>
												<c:if test="${!fn:contains(user_login.dept.permissions,12) }">
													<div class="row" hidden="true"> 
														<div class="col-lg-3" style="margin-top: 20px;">
															<select id="statusSelect" style="width: 100%">
																<option value="0">0</option>
															</select>
														</div>
													</div>
												</c:if>
												<div class="row" id="replyRow"> 
													<div class="col-lg-6">
														<input style="margin-top: 20px; clear: left; float: none;" id="btnSubmitAddComment" class="btn btn-primary" type="submit" value="回复">
														<div class="mdl-spinner mdl-js-spinner is-active" hidden="true" id="pbAddComment"></div>
													</div>
												</div>
					
												<%-- <c:if test="${fn:contains(user_login.dept.permissions,9) }">
													<div class="form-check form-check-inline">
														<label style="margin-top: 20px" class="form-check-label"
															for="checkboxResovled"> <input type="checkbox"
															class="form-check-input" id="checkboxResovled"
															name="is_resovled"  /> 标记为已解决
														</label>
													</div>
												</c:if>
					
												<c:if test="${fn:contains(user_login.dept.permissions,10) }">
													<div class="form-check form-check-inline">
														<label class="form-check-label" style="margin-top: 20px">
															<input class="form-check-input" type="checkbox"
															id="checkboxProblem" name="is_problem"> 标记为未查出原因
														</label>
													</div>
												</c:if> --%>
												
											</form>
										</c:if>
									</div>
					
								</div>
					
						</div>    				
       				</div>
            </div>
          </div>
          
      </div>
    </main>
  </div>

   <jsp:include page="/WEB-INF/v2/footer.jsp"></jsp:include>
   <jsp:include page="/WEB-INF/v2/logout.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/modal_add_issue.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/script_beta.jsp"></jsp:include>
    
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/adapters/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v2/issue_details.js"></script>
</body>







<%-- <body class="fixed-nav sticky-footer bg-dark" id="page-top">
  
  <jsp:include page="/WEB-INF/v2/navbar.jsp"></jsp:include>
  <div class="content-wrapper">
    <div class="container-fluid">
	    <nav aria-label="breadcrumb" role="navigation">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item">问题管理</li>
		    <li class="breadcrumb-item active" aria-current="page">问题详情</li>
		  </ol>
		</nav>
    
      <div class="card"> 
        <div class="card-header">
          <i class="fa fa-table"></i>&nbsp; &nbsp;&nbsp; 问题详情
          </div>
          
	        <div class="card-body">
		          <div class="card" style="margin-top: 20px">
			<div class="card-header">${issue_detail.title } 
			 <span class="badge badge-pill badge-secondary">${issue_detail.project.projectName}</span>
				<c:choose>
					<c:when test="${issue_detail.status.id == 1 }">
						<span class="badge badge-pill badge-secondary">${issue_detail.status.statusName }</span>
					</c:when>
					<c:when test="${issue_detail.status.id == 2 }">
						<span class="badge badge-pill badge-warning">${issue_detail.status.statusName }</span>
					</c:when>
					<c:when test="${issue_detail.status.id == 3 }">
						<span class="badge badge-pill badge-success">${issue_detail.status.statusName }</span>
					</c:when>
					<c:when test="${issue_detail.status.id == 4 }">
						<span class="badge badge-pill badge-danger">${issue_detail.status.statusName }</span>
					</c:when>
				</c:choose>
			</div>
			<div class="card-body">
				<p class="card-text">${issue_detail.content }</p>
			</div>
		</div>
		<div class="comments"  id="comment_list_div">

				<c:forEach items="${issue_detail.comments }" var="comment">
					
					<div class="comment-wrap">
						<div class="photo">
								<div class="avatar" style="background-image: url('https://cdn0.iconfinder.com/data/icons/PRACTIKA/256/user.png')"></div>
								<br/>
								<span class="badge badge-pill badge-success"> ${comment.user.realName }</span>
						</div>
						<div class="comment-block" style="margin-left: 12px">
								<c:if test="${comment.isResovleIssue == 1 }">
									<span class="badge badge-pill badge-success">已解决</span>
								</c:if>
								<c:if test="${comment.isProblem == 1 }">
									<span class="badge badge-pill badge-danger">疑难问题</span>
								</c:if>
								<p class="comment-text">
								 ${comment.content }
								</p>
								<div class="bottom-comment">
										<div class="comment-date"> ${comment.createTime }</div>
								</div>
						</div>
					</div>
				</c:forEach>
			</div>
		
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<c:if test="${fn:contains(user_login.dept.permissions,8) }">
					
					<!-- action="${pageContext.request.contextPath }/AddComment" -->
					
						<form id="formReply"
							method="get">
							<input type="hidden" name="issue_id" id="issueDetailId" value="${issue_detail.id }" />
							<input type="hidden" name="user_id" value="${user_session.id }" />
							<label style="margin-top: 20px" for="textareaCommentContent">回复描述</label>
							<textarea name="comment"  class="form-control"
								id="textareaCommentContent" rows="10"></textarea>

							<c:if test="${fn:contains(user_login.dept.permissions,9) }">
								<div class="form-check form-check-inline">
									<label style="margin-top: 20px" class="form-check-label"
										for="checkboxResovled"> <input type="checkbox"
										class="form-check-input" id="checkboxResovled"
										name="is_resovled"  /> 标记为已解决
									</label>
								</div>
							</c:if>

							<c:if test="${fn:contains(user_login.dept.permissions,10) }">
								<div class="form-check form-check-inline">
									<label class="form-check-label" style="margin-top: 20px">
										<input class="form-check-input" type="checkbox"
										id="checkboxProblem" name="is_problem"> 标记为未查出原因
									</label>
								</div>
							</c:if>

							
							<input style="margin-top: 20px; clear: left; float: none;"
								id="btnSubmitAddComment"
								class="btn btn-primary" type="submit" value="回复">
							<div class="mdl-spinner mdl-js-spinner is-active" hidden="true" id="pbAddComment"></div>
						</form>

					</c:if>
				</div>

			</div>

		</div>
	        	</div>
       	</div>
      <jsp:include page="/WEB-INF/v2/footer.jsp"></jsp:include>
     </div>
     
     
    <jsp:include page="/WEB-INF/v2/logout.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/modal_add_issue.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/v2/script2.jsp"></jsp:include>
    
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/adapters/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v2/issue_details.js"></script>
  </div>
</body> --%>
</html>
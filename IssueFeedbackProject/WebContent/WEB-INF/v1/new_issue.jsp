<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加问题</title>
		<jsp:include page="/WEB-INF/v1/css_common.jsp"></jsp:include>
      <link href="${pageContext.request.contextPath}/lib/css/app/common.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
	  
	  <jsp:include page="/WEB-INF/v1/header.jsp"></jsp:include>
	  
	  <main class="mdl-layout__content">
	    <div class="page-content">
	    		<div class="mdl-grid">
	    			<div class="mdl-cell mdl-cell--1-col "> </div>
		    		<div class="mdl-cell mdl-cell--10-col " style="margin-top: 20px">
		    		<!-- action="${pageContext.request.contextPath }/AddIssue" -->
						<form  id="formAddIssue" >
							<div class="form-group">
								
								<label for="inputIssueTitle">问题标题</label> 
								<input
									id="inputIssueTitle" type="text" class="form-control"
									placeholder="请输入标题"
									name="title" required="required" /> 
									<label style="margin-top: 20px"
											for="projectSelector">分管系统</label>
									<select class="form-control" id="projectSelector">
										
								
									</select>
									<label style="margin-top: 20px"
											for="textareaIssueContent">问题描述</label>
		
								<textarea name="content" class="form-control"
									id="textareaIssueContent" placeholder="请输入问题描述" rows="20" required="required" ></textarea>
								
								<div class="mdl-grid">
									<div class="mdl-cell mdl-cell--10-col">
										<input style="margin-top: 20px" id="submitAddIssue"
										 class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="submit" value="提交"  />
										<div class="mdl-spinner mdl-js-spinner is-active" hidden="true" id="pbAddIssue"></div>
									</div>
								</div>
								
							</div>
		
						</form>
					</div>
					<div class="mdl-cell mdl-cell--1-col "></div>
	    		</div>

	    </div>
</main>
</div>
	
</body>
<jsp:include page="/WEB-INF/v1/script.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/ckeditor/ckeditor.js"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath}/lib/js/app/v1/new_issue.js"></script>
</html>
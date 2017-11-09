<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>组长问题提交首页</title>
<jsp:include page="/WEB-INF/css_common.jsp"></jsp:include>
<link href="lib/css/app/common.css" rel="stylesheet" type="text/css" />

</head>
<body>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">添加项目</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      <form action="">
	      	<div class="form-group">
	      		<label for="inputProjectName">项目名</label>
	      		<input type="text" id="inputProjectName" class="form-control" placeholder="请输入项目名">
	      	</div>
	      	
	      	<div class="form-group">
	      		<label for="selectorDept">分管部门</label>
	      		<select id="selectorDept" class="form-control"></select>
	      	</div>
	      	<div class="form-group">
	      		<label for="textAreaProjectDescription">项目描述</label>
	      		<textarea rows="3" class="form-control" placeholder="请输入项目描述" id="textAreaProjectDescription"></textarea>
	      		
	      	</div>
	      </form>
	       
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="btnSaveProject" data-dismiss="modal">保存</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
		
		<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
		
		<main class="mdl-layout__content">
		
		<div class="page-content">
			<div class="mdl-grid">
				<div class="mdl-cell mdl-cell--1-col mdl-cell--1-offset">
					<button id="btnAddProject" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent">
						<i class="material-icons">add</i> 添加部门
					</button>
				</div>
			</div>
			<div class="mdl-grid">
				<div class="mdl-cell mdl-cell--1-col"></div>
				
				<table
					id="project_table_root" hidden="true"
					class="mdl-cell mdl-cell--10-col mdl-data-table mdl-js-data-table mdl-shadow--2dp">
					<thead>
						<tr>
							<td>项目</td>
							<td>管理部门</td>
							<td>描述</td>
							<td></td>
						</tr>

					</thead>

					<tbody id="project_table">

					</tbody>
				</table>
				<div class="mdl-cell mdl-cell--2-col mdl-cell--5-offset" id="pbProjects">
					<div class="mdl-spinner mdl-js-spinner is-active" ></div>
				</div>
			</div>

			
		</div>
		
		</main>
	</div>

</body>
<jsp:include page="/WEB-INF/script.jsp"></jsp:include>
<script type="text/javascript" src="lib/js/app/project_management.js"></script>


</html>
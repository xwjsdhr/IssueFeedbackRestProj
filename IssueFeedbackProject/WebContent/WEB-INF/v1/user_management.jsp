<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<jsp:include page="/WEB-INF/v1/css_common.jsp"></jsp:include>

</head>
<body>

	<div class="modal fade" tabindex="-1" role="dialog" id="alert_dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title"></h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true"></span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p id="modal-content">修改成功</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- --------------------------------------------------------- -->
	
	<div class="modal fade" tabindex="-1" role="dialog" id="add_dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	   	 <form id="formAddUser">
		      <div class="modal-header">
		        <h5 class="modal-title">新增用户</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true"></span>
		        </button>
		      </div>
		      <div class="modal-body">
			        <p id="modal-content"></p>
			        <div class="container">
						<div class="row">
							<div class="col-lg-10">
							 <div class="form-group">
							    	<label for="inputAddUsername">用户名</label>
							    	<input type="text" class="form-control" id="inputAddUsername" placeholder="请输入用户名" required="required">
							  </div>
							  <div class="form-group">
							    	<label for="inputAddPassword">密码 </label>
							    	<input type="password" class="form-control" id="inputAddPassword" placeholder="请输入密码" required="required">
							  </div>
							  <div class="form-group">
							  	<label for="selectDept">部门</label>
							  	<select class="form-control" id="selectDept" required="required"></select>
							  </div> 
							  
							  <div class="form-group">
							    <label for="inputAddRealName">姓名</label>
							    <input type="text" class="form-control" id="inputAddRealName" placeholder="请输入姓名" required="required">
							  </div>
							</div>
						</div>	        
			        </div>
		      </div>
		      <div class="modal-footer">
		      	<input type="submit" class="btn btn-primary" id="btnUpdateUserInfo" value="保存"/>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
		      </div>
	      </form> 
	    </div>
	   
	  </div>
	</div>
	
	
	<!-- --------------------------------------------------------- -->
	<div class="modal fade" tabindex="-1" role="dialog" id="update_dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">用户信息</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true"></span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p id="modal-content"></p>
	        <div class="container">
				<div class="row">
					<div class="col-lg-10">
						  <div class="form-group">
						    	<label for="exampleInputEmail1">用户名</label>
						    	<input type="text" class="form-control" id="inputUpdateUsername">
						  </div>
						  <div class="form-group">
						  	<label for="selectDept">部门</label>
						  	<select class="form-control" id="selectDeptUpdate">
						  		
						 	 </select>
						  </div> 
						  
						  <div class="form-group">
						    <label for="exampleInputPassword1">姓名</label>
						    <input type="text" class="form-control" id="inputUpdateRealName" placeholder="Password">
						  </div>
						  
					</div>
				</div>	        
	        </div>
	      </div>
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-primary" id="btnUpdateUserInfo" data-dismiss="modal">保存</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>

	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">

		<jsp:include page="/WEB-INF/v1/header.jsp"></jsp:include>

		<main class="mdl-layout__content">
		
			<div class="page-content">
				
				<div class="mdl-grid">
					<div class="mdl-cell mdl-cell--1-offset">
						<button id="btnAddUser" class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent">
							<i class="material-icons">add</i> 添加用户
						</button>
					</div>
					<table  id="user_table_root" hidden="true" class="mdl-cell mdl-cell--1-offset mdl-cell--10-col mdl-data-table mdl-js-data-table mdl-shadow--2dp table-bordered" >
						
						<thead>

							<tr>
								<td>用户名</td>
								<td>部门</td>
								<td width="15%">姓名</td>
								<td>状态</td>
								<td colspan="2"></td>
							</tr>

						</thead>
							
						<tbody hidden="true" id="user_table">
							
						</tbody>
						
					</table>
					<div class="mdl-cell mdl-cell--2-col mdl-cell--5-offset" id="pbUser">
						<div class="mdl-spinner mdl-js-spinner is-active" ></div>
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
<jsp:include page="/WEB-INF/v1/script.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/js/app/v1/user_management.js"></script>
</html>
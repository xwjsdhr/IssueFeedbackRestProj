<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    <form id="formAddUser">
    	<fieldset>
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel"><i class="fa fa-id-card-o" aria-hidden="true"></i>&nbsp;添加用户</h5>
		        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">×</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<div class="container">
		      		<div class="row"> 
		      			<div class="col-lg-6">
		      				<div class="form-group">
			      				<label for="inputUserName"><b><i class="fa fa-user"></i>&nbsp;用户名</b></label>
			      				<input type="text" id="inputUserName" data-parsley-required="true" 
			      				name="inputUserName" class="form-control" 
			      				 data-parsley-trigger="input" placeholder="请输入用户名"
			      				 />
		      					
		      				</div>
		      			</div>
		      			<div class="col-lg-6">
		      				<div class="form-group">
			      				<label for="inputPassword"><b><i class="fa fa-shield"></i>&nbsp; 密码</b></label>
			      				<input type="password" id="inputPassword" name="inputPassword"
			      				 data-parsley-required="true" class="form-control" placeholder="请输入密码"
			      				 data-parsley-minlength="6" />
			      			</div>
		      			</div>
		      		</div>
		      		<div class="row">
		      			<div class="col-lg-6">
			      			<div class="form-group">
			      				<label for="inputDept"><b>部门</b></label>
			      				<select id="selectDept" class="form-control" data-parsley-required="true" ></select>
			      			</div>
		      			</div>
		      			<div class="col-lg-6">
			      			<div class="form-group">
			      				<label for="inputRealName"><b><i class="fa fa-user" aria-hidden="true"></i>&nbsp;姓名</b></label>
			      				<input type="text" id="inputRealName" data-parsley-required="true"
			      				 name="inputRealName" class="form-control" placeholder="请输入姓名" />
		      				</div>
		      			</div>
		      		</div>
		      		<div class="row">
		      			<div class="col-lg-6">
			      			<div class="form-group">
			      				<label for="inputTelephone"><b><i class="fa fa-phone"></i>&nbsp;电话</b></label>
			      				<input type="text" id="inputTelephone" data-parsley-required="true"
			      				  name="inputTelephone" class="form-control" data-parsley-type="number" 
			      				  placeholder="请输入电话" />
		      				</div>
		      			</div>

						<div class="col-lg-6">
			      			<div class="form-group">
			      				<label for="inputEmail"><b><i class="fa fa-envelope"></i>&nbsp;邮箱</b></label>
			      				<input type="text" id="inputEmail" data-parsley-required="true" 
			      				name="inputEmail" class="form-control" data-parsley-type="email"
			      				 placeholder="请输入电子邮箱" />
		      				</div>
		      			</div>
		      			
		      		</div>
		      		
		      	</div>
		      </div>
		      <div class="modal-footer">
		        <button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
		        <button class="btn btn-primary" type="submit">保存</button>
		      </div>
	      </fieldset>
      </form>
      
    </div>
  </div>
</div>
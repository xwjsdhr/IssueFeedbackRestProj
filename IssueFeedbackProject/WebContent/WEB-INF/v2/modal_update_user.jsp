<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="modal fade" id="updateUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    <form id="formUpdateUser">
    	<fieldset>
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">添加</h5>
		        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">×</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<div class="container">
		      		<div class="row"> 
		      			<div class="col-lg-12">
		      				<div class="form-group">
			      				<label for="inputUserName">用户名</label>
			      				<input type="text" id="inputUpdateUserName" name="inputUpdateUserName" class="form-control" placeholder="请输入用户名" />
		      				</div>
		      			</div>
		      		</div>
		      		<div class="row">
		      			<div class="col-lg-12">
			      			<div class="form-group">
			      				<label for="inputDept">部门</label>
			      				<select id="selectUpdateDept" class="form-control" required></select>
			      			</div>
		      			</div>
		      		</div>
		      		<div class="row">
		      			<div class="col-lg-12">
		      				<div class="form-group">
			      				<label for="inputRealName">姓名</label>
			      				<input type="text" id="inputUpdateRealName" name="inputUpdateRealName" class="form-control" placeholder="请输入姓名" />
		      				</div>
		      			</div>
		      		</div>
		      	</div>
		      </div>
		      <div class="modal-footer">
		        <button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
		        <button class="btn btn-primary" type="submit" id="btnUpdateUser">修改</button>
		      </div>
	      </fieldset>
      </form>
      
    </div>
  </div>
</div>
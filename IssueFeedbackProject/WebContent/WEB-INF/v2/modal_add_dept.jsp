<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="modal fade" id="addDeptModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">添加部门</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="container">
      		<div class="row"> 
      			<div class="col-lg-12">
      				<div class="form-group">
	      				<label for="inputDeptName">部门名称</label>
	      				<input type="text" id="inputDeptName" class="form-control" placeholder="请输入部门名称" required/>
      				</div>
      			</div>
      		</div>
      	</div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
        <button class="btn btn-primary" type="button" data-dismiss="modal">保存</button>
      </div>
    </div>
  </div>
</div>
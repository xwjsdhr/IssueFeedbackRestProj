<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="modal fade" id="updateProjectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    
    <form class="cmxform" id="formUpdateProject">
	    <fieldset>
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">修改项目</h5>
		        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">×</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<div class="container">
		      		<div class="row"> 
		      			<div class="col-lg-12">
		      				<div class="form-group">
			      				<label for="inputUpdateProjectName">项目名</label>
			      				<input type="text" id="inputUpdateProjectName" name="inputUpdateProjectName" class="form-control" placeholder="请输入项目名" />
		      				</div>
		      			</div>
		      		</div>
		      		
		      		<div class="row">
		      			<div class="col-lg-12">
			      			<div class="form-group">
			      				<label for="selectorUpdateDept">分管部门</label>
			      				<select id="selectorUpdateDept" class="form-control" ></select>
			      			</div>
		      			</div>
		      		</div>
		      		<div class="row">
		      			<div class="col-lg-12">
		      				<div class="form-group">
			      				<label for="inputUpdateProjectDesc">项目描述</label>
			      				<input type="text" id="inputUpdateProjectDesc" name="inputUpdateProjectDesc" class="form-control" placeholder="请输入项目描述"/>
		      				</div>
		      			</div>
		      		</div>
		      	</div>
		      </div>
		      <div class="modal-footer">
		        <button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
		        <button class="btn btn-primary" type="submit"  id="btnUpdateProject">修改</button>
		      </div>
	      </fieldset>
      </form>
      
    </div>
  </div>
</div>
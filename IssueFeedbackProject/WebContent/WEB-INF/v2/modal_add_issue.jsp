<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="modal fade" id="addIssueModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    <form id="formAddIssue">
    	<fieldset>
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">添加问题</h5>
		        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">×</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<div class="container">
		      		<div class="row"> 
		      			<div class="col-lg-12">
		      				<div class="form-group">
			      				<label for="inputIssueTitle">问题标题</label>
			      				<input type="text" id="inputIssueTitle" name="inputIssueTitle" class="form-control" placeholder="请输入标题" required/>
		      				</div>
		      			</div>
		      		</div>
		      		<div class="row">
		      			<div class="col-lg-12">
			      			<div class="form-group">
			      				<label for="inputIssueProject">所属系统</label>
			      				<select id="inputIssueProject" class="form-control" name="inputIssueProject" placeholder="请输入标题" ></select>
			      			</div>
		      			</div>
		      		</div>
		      		<div class="row">
		      			<div class="col-lg-12">
		      				<div class="form-group">
			      				<label for="inputIssueContent">问题内容</label>
			      				<textarea rows="4" cols="1" id="inputIssueContent" name="inputIssueContent" class="form-control" placeholder="请输入内容" required></textarea> 
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
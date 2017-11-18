<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

	<div class="modal fade" id="addIssueModal" role="dialog">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	    <form id="formAddIssue">
	    	<fieldset>
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">添加问题</h5>
			        <button class="close" type="button" data-dismiss="modal" aria-label="Close" >
			          <span aria-hidden="true">×</span>
			        </button>
			      </div>
			      <div class="modal-body">
			      	<div class="container">
			      		<div class="row"> 
			      			<div class="col-lg-12">
			      				<div class="form-group">
				      				<label for="inputIssueTitle"><b>问题标题</b></label>
				      				<input type="text" id="inputIssueTitle" name="inputIssueTitle" class="form-control" placeholder="请输入标题" required/>
			      				</div>
			      			</div>
			      		</div>
			      		<div class="row">
			      			<div class="col-lg-6">
				      				<label for="inputIssueProject"><b>系统</b>
				      				</label><select id="inputIssueProject" style="width: 100%"></select>
			      			</div>
			      			<div class="col-lg-6">
			      				<div class="form-group">
				      				<label for="inputIssueProjectModule"><b>系统模块</b>
					      				
				      				</label>
				      				<select id="inputIssueProjectModule" style="width: 100% ;" ></select>
				      			</div>
			      			</div>
			      			
			      		</div>
			      		<div class="row">
			      			<div class="col-lg-12">
			      				<div class="form-group">
				      				<label for="inputIssueContent"><b>问题内容</b></label>
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
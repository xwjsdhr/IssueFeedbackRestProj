<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index">组长问题反馈</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="首页">
          <a class="nav-link" href="index">
            <i class="fa fa-fw fa-home"></i>
            <span class="nav-link-text">&nbsp;首页</span>
          </a>
        </li>
        <c:if test="${fn:contains(user_login.dept.permissions,6)}">
	        <!-- <li class="nav-item" data-toggle="tooltip" data-placement="right" title="统计管理">
	          <a class="nav-link" href="statistics">
	            <i class="fa fa-fw fa-area-chart"></i>
	            <span class="nav-link-text">&nbsp;统计</span>
	          </a>
	        </li> -->
        </c:if>
        <c:if test="${fn:contains(user_login.dept.permissions,2) }">
	        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="问题管理">
	          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#page_issue_management" data-parent="#exampleAccordion">
	            <i class="fa fa-fw fa-question"></i>
	            <span class="nav-link-text">&nbsp;组长问题管理</span>
	          </a>
	          <ul class="sidenav-second-level collapse" id="page_issue_management">
	            <li>
	             <a href="index"><i class="fa fa-fw fa-question"></i>&nbsp;问题列表</a>
	            </li>
	          	
	          	<c:if test="${fn:contains(user_login.dept.permissions,5)}">
	          		<li>
		              <a href="project_management"><i class="fa fa-fw fa-file-text"></i>&nbsp;项目列表</a>
		            </li>
	          	</c:if>
	          	
	          	<c:if test="${fn:contains(user_login.dept.permissions,4)}">
	          		<li>
		              <a href="dept_management"><i class="fa fa-fw fa-users"></i>&nbsp;部门列表</a>
		            </li>
	          	</c:if>
	          	
	          	<c:if test="${fn:contains(user_login.dept.permissions,7)}">
	          		<li>
		             <a href="permission_management"><i class="fa fa-fw fa-hand-paper-o"></i>&nbsp;权限列表</a>
		            </li>
	          	</c:if>
	          	
	          	
	          </ul>
	        </li>
        </c:if>
        
      
        <!-- 权限管控 -->
        <c:if test="${fn:contains(user_login.dept.permissions,3)}">
	        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="用户管理">
	          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#user_management" data-parent="#exampleAccordion">
	            <i class="fa fa-fw fa-user"></i>
	            <span class="nav-link-text">用户管理</span>
	          </a>
	          <ul class="sidenav-second-level collapse" id="user_management">
	         	
		            <li>
		              <a href="user_management"><i class="fa fa-fw fa-bars"></i>&nbsp;用户列表</a>
		            </li>
	            
	          </ul>
	        </li>
       </c:if> 
        
          <!-- 
        <c:if test="${fn:contains(user_login.dept.permissions,5)}">
	           <li class="nav-item" data-toggle="tooltip" data-placement="right" title="项目管理">
		          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#page_project_management" data-parent="#exampleAccordion">
		            <i class="fa fa-fw fa-file-text"></i>
		            <span class="nav-link-text">&nbsp;项目管理</span>
		          </a>
		          <ul class="sidenav-second-level collapse" id="page_project_management">
		            <li>
		              <a href="project_management"><i class="fa fa-fw fa-bars"></i>&nbsp;项目列表</a>
		            </li>
		          </ul>
		        </li>
            </c:if>
            
            <c:if test="${fn:contains(user_login.dept.permissions,4)}">
	             <li class="nav-item" data-toggle="tooltip" data-placement="right" title="部门呢管理">
		          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#page_dept_management" data-parent="#exampleAccordion">
		            <i class="fa fa-fw fa-users"></i>
		            <span class="nav-link-text">&nbsp;部门管理</span>
		          </a>
		          <ul class="sidenav-second-level collapse" id="page_dept_management">
		            <li>
		              <a href="dept_management"><i class="fa fa-fw fa-bars"></i>&nbsp;部门列表</a>
		            </li>
		          </ul>
		        </li>
            </c:if>
            
            <c:if test="${fn:contains(user_login.dept.permissions,7)}">
	            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="权限管理">
		          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#page_permission_management" data-parent="#exampleAccordion">
		            <i class="fa fa-fw fa-hand-paper-o"></i>
		            <span class="nav-link-text">&nbsp;权限管理</span>
		          </a>
		          <ul class="sidenav-second-level collapse" id="page_permission_management">
		            <li>
		              <a href="permission_management"><i class="fa fa-fw fa-bars"></i>&nbsp;权限列表</a>
		            </li>
		          </ul>
		        </li>
            </c:if>
            -->
            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="部门呢管理">
		          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#page_training_record_management" data-parent="#exampleAccordion">
		            <i class="fa fa-fw fa-users"></i>
		            <span class="nav-link-text">&nbsp;培训记录</span>
		          </a>
		          <ul class="sidenav-second-level collapse" id="page_training_record_management">
		            <li>
		              <a href="train_record_management"><i class="fa fa-fw fa-bars"></i>&nbsp;培训记录列表</a>
		            </li>
		          </ul>
		    </li>
		     
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      
      
      <ul class="navbar-nav ml-auto">
      
      <c:if test="${user_login != null}">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" 
          id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span > <i class="fa fa-fw fa-user"></i> ${user_login.realName }
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="messagesDropdown">
            <a class="dropdown-item" href="#">
             	 修改密码
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">
             	 查看信息
            </a>
          </div>
          
        </li>
        <li class="nav-item">
	          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
	            <i class="fa fa-fw fa-sign-out"></i>退出</a>
	        </li>
        </c:if>
       
      </ul>
    </div>
  </nav>
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
            <span class="nav-link-text">首页</span>
          </a>
        </li>
        <c:if test="${fn:contains(user_session.dept.permissions,6)}">
	        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="统计管理">
	          <a class="nav-link" href="statistics">
	            <i class="fa fa-fw fa-area-chart"></i>
	            <span class="nav-link-text">统计</span>
	          </a>
	        </li>
        </c:if>
        <c:if test="${fn:contains(user_session.dept.permissions,2) }">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="问题管理">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#page_issue_management" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-question"></i>
            <span class="nav-link-text">问题管理</span>
          </a>
          <ul class="sidenav-second-level collapse" id="page_issue_management">
            <li>
              <a href="new_issue"><i class="fa fa-fw fa-plus"></i>添加问题</a>
            </li>
          </ul>
        </li>
        </c:if>
        
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="用户管理">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#user_management" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-user"></i>
            <span class="nav-link-text">用户管理</span>
          </a>
          <ul class="sidenav-second-level collapse" id="user_management">
         	<c:if test="${fn:contains(user_session.dept.permissions,3)}">
	            <li>
	              <a href="register"><i class="fa fa-fw fa-plus"></i>添加用户</a>
	            </li>
	            <li>
	              <a href="user_management"><i class="fa fa-fw fa-list"></i>用户列表</a>
	            </li>
            </c:if>
          </ul>
        </li>
        
        
        <c:if test="${fn:contains(user_session.dept.permissions,5)}">
	           <li class="nav-item" data-toggle="tooltip" data-placement="right" title="项目管理">
		          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#page_project_management" data-parent="#exampleAccordion">
		            <i class="fa fa-fw fa-file-text"></i>
		            <span class="nav-link-text">项目管理</span>
		          </a>
		          <ul class="sidenav-second-level collapse" id="page_project_management">
		            <li>
		              <a href="project_management"><i class="fa fa-fw fa-list"></i>项目列表</a>
		            </li>
		          </ul>
		        </li>
            </c:if>
            
            <c:if test="${fn:contains(user_session.dept.permissions,4)}">
	             <li class="nav-item" data-toggle="tooltip" data-placement="right" title="部门呢管理">
		          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#page_dept_management" data-parent="#exampleAccordion">
		            <i class="fa fa-fw fa-users"></i>
		            <span class="nav-link-text">部门管理</span>
		          </a>
		          <ul class="sidenav-second-level collapse" id="page_dept_management">
		            <li>
		              <a href="dept_management"><i class="fa fa-fw fa-list"></i>部门列表</a>
		            </li>
		          </ul>
		        </li>
            </c:if>
            
            <c:if test="${fn:contains(user_session.dept.permissions,7)}">
	            <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Example Pages">
		          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#page_permission_management" data-parent="#exampleAccordion">
		            <i class="fa fa-fw fa-hand-paper-o"></i>
		            <span class="nav-link-text">权限管理</span>
		          </a>
		          <ul class="sidenav-second-level collapse" id="page_permission_management">
		            <li>
		              <a href="permission_management"><i class="fa fa-fw fa-list"></i>权限列表</a>
		            </li>
		          </ul>
		        </li>
            </c:if>
        
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-envelope"></i>
            <span class="d-lg-none">Messages
              <span class="badge badge-pill badge-primary">12 New</span>
            </span>
            <span class="indicator text-primary d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-bell"></i>
            <span class="d-lg-none">Alerts
              <span class="badge badge-pill badge-warning">6 New</span>
            </span>
            <span class="indicator text-warning d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
        </li>
        
        <c:if test="${user_session != null}">
	        <li class="nav-item">
	        	<a class="nav-link" href="user_info"><i class="fa fa-fw fa-user"></i>${user_session.realName }</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
	            <i class="fa fa-fw fa-sign-out"></i>退出</a>
	        </li>
        </c:if>
        
      </ul>
    </div>
  </nav>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<div class="sidebar">
      <nav class="sidebar-nav">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="home_main"><i class="icon-speedometer"></i>首页</a>
          </li>
          <li class="nav-title">
           	 模块管理
          </li>
          <c:if test="${fn:contains(user_login.dept.permissions,2) }">
	          <li class="nav-item nav-dropdown">
	            <a class="nav-link nav-dropdown-toggle" href="#"><i class="icon-question"></i>组长问题反馈</a>
	            <ul class="nav-dropdown-items" >
	              <li class="nav-item" >
	                <a class="nav-link" href="index">&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-question"></i>问题管理</a>
	              </li>
	              <c:if test="${fn:contains(user_login.dept.permissions,4)}">
		              <li class="nav-item">
		                <a class="nav-link" href="dept_management">&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-people"></i>部门管理</a>
		              </li>
	              </c:if>
	              <c:if test="${fn:contains(user_login.dept.permissions,5)}">
		              <li class="nav-item">
		                <a class="nav-link" href="project_management">&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-doc"></i> 项目管理</a>
		              </li>
	              </c:if>
	              <c:if test="${fn:contains(user_login.dept.permissions,7)}">
		              <li class="nav-item">
		                <a class="nav-link" href="permission_management">&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-puzzle"></i> 权限管理</a>
		              </li>
	              </c:if>
	              <c:if test="${fn:contains(user_login.dept.permissions,6)}">
	               	  <li class="nav-item">
		                <a class="nav-link" href="issue_statistics">&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-graph"></i> 统计管理</a>
		              </li>
	              </c:if>
	            </ul>
	          </li>
          </c:if>
          
          <li class="nav-item nav-dropdown">
            <a class="nav-link nav-dropdown-toggle" href="#"><i class="icon-user"></i>用户管理</a>
            <ul class="nav-dropdown-items">
             <c:if test="${fn:contains(user_login.dept.permissions,3)}">
              <li class="nav-item">
                <a class="nav-link" href="user_management">&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-people"></i>用户列表</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="user_log_management">&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-logout"></i>登入登出记录</a>
              </li>
              </c:if>
              
              <li class="nav-item">
                <a class="nav-link" href="user_info">&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-user"></i>当前用户信息</a>
              </li>
            </ul>
          </li>
          <li class="nav-item nav-dropdown">
          		<a class="nav-link nav-dropdown-toggle" href="#"><i class="icon-note"></i>培训记录管理</a>
          		<ul class="nav-dropdown-items">
          			<li class="nav-item">
		                <a class="nav-link" href="train_record_management">&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-note"></i>记录列表</a>
		            </li>
          		</ul>
          </li>
          
          <li class="nav-item nav-dropdown">
          		<a class="nav-link nav-dropdown-toggle" href="#"><i class="icon-doc"></i>周报管理</a>
          		<ul class="nav-dropdown-items">
          			<li class="nav-item">
		                <a class="nav-link" href="icons-font-awesome.html">&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-docs"></i>周报列表</a>
		            </li>
          		</ul>
          </li>
          
          <li class="nav-item nav-dropdown">
          		<a class="nav-link nav-dropdown-toggle" href="#"><i class="icon-hourglass"></i>项目进度管理</a>
          		<ul class="nav-dropdown-items">
          			<li class="nav-item">
		                <a class="nav-link" href="#">&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-hourglass"></i>项目进度列表</a>
		            </li>
          		</ul>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="personal_settings"><i class="icon-settings"></i>个人设置</a>
          </li>
        </ul>
      </nav>
      <button class="sidebar-minimizer brand-minimizer" type="button"></button>
    </div>
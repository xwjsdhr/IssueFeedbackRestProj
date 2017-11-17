<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
	          	<c:if test="${fn:contains(user_login.dept.permissions,6)}">
			       <li>
			          <a href="issue_statistics">
			            <i class="fa fa-fw fa-area-chart"></i>&nbsp;统计
			          </a>
			        </li>
		        </c:if>
	          	
	          </ul>
	        </li>
        </c:if>
        
      
        
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
		            <!-- user_log_management -->
		            <li>
		              <a href="user_log_management"><i class="fa fa-fw fa-sign-in"></i>&nbsp;登录/登出记录</a>
		            </li>
		            
		            <c:if test="${user_login!= null }">
		            	<li>
			              <a href="user_info"><i class="fa fa-fw fa-user-md"></i>&nbsp;当前用户信息</a>
			            </li>
			            <li>
			              <a href="update_pwd"><i class="fa fa-fw fa-user-secret"></i>&nbsp;修改密码</a>
			            </li>
			            
		            </c:if>
	          </ul>
	        </li>
       </c:if> 
      
      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="培训记录管理">
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
   	 <li class="nav-item" data-toggle="tooltip" data-placement="right" title="项目进度管理">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#page_project_progress_management" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-tasks"></i>
            <span class="nav-link-text">&nbsp;项目进度管理</span>
          </a>
          <ul class="sidenav-second-level collapse" id="page_project_progress_management">
            <li>
              <a href="#"><i class="fa fa-fw fa-tasks"></i>&nbsp;项目进度管理</a>
            </li>
          </ul>
   	 </li>
   	 
   	  <li class="nav-item" data-toggle="tooltip" data-placement="right" title="周报管理">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#page_week_post_management" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-file-text"></i>
            <span class="nav-link-text">&nbsp;周报管理</span>
          </a>
          <ul class="sidenav-second-level collapse" id="page_week_post_management">
            <li>
              <a href="#"><i class="fa fa-fw fa-file-text"></i>&nbsp;周报管理</a>
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
            <a class="dropdown-item" href="update_pwd">
            	<i class="fa fa-fw fa-user-secret"></i>
             	 修改密码
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="user_info">
            	<i class="fa fa-fw fa-user-md"></i>
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
  
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<header class="app-header navbar">
    <button class="navbar-toggler mobile-sidebar-toggler d-lg-none mr-auto" type="button">
      <span class="navbar-toggler-icon"></span>  研发二部
    
    </button>
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler sidebar-toggler d-md-down-none" type="button">
      <span class="navbar-toggler-icon" ></span>
    </button>

    <ul class="nav navbar-nav d-md-down-none">
      <li class="nav-item px-3">
        <a class="nav-link" href="#">首页</a>
      </li>
      <li class="nav-item px-3">
        <a class="nav-link" href="#">用户</a>
      </li>
      <li class="nav-item px-3">
        <a class="nav-link" href="personal_settings">设置</a>
      </li>
    </ul>
    <c:if test="${user_login!= null }">
    	<ul class="nav navbar-nav ml-auto">
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle nav-link" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
	          <img src="https://cdn0.iconfinder.com/data/icons/PRACTIKA/256/user.png" class="img-avatar" alt="">
	          ${user_login.realName}
	        </a>
	        <div class="dropdown-menu dropdown-menu-right">
	          <div class="dropdown-header text-center">
	            <strong>设置</strong>
	          </div>
	          <a class="dropdown-item" href="user_info"><i class="fa fa-id-card-o" aria-hidden="true"></i>个人信息</a>
	          <div class="divider"></div>
	          <a class="dropdown-item" href="logout"><i class="fa fa-lock"></i>退出</a>
	        </div>
	      </li>
	    </ul>
    	
    </c:if>
    
    <button class="navbar-toggler aside-menu-toggler" type="button">
      <span class=""></span>
    </button>
    
  </header>
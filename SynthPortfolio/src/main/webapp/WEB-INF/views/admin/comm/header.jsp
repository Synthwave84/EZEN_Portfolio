<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- Main Header -->
  <header class="main-header">

    <a href="/admin/admin_menu" class="logo">
      <span class="logo-mini"><b>A</b>LT</span>
      <span class="logo-lg"><b>Admin</b>LTE</span>
    </a>

    <nav class="navbar navbar-static-top" role="navigation">
    
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <div class="navbar-custom-menu">
      <c:if test="${sessionScope.adminStatus != null }">
      	<ul class="nav navbar-nav">
          <li class="dropdown messages-menu">
            <a href="#" >최근 접속시간: <fmt:formatDate value="${sessionScope.adminStatus.administrator_login_time }" pattern="yyyy-MM-dd hh:mm:ss"/></a> 
          </li>
      	</ul>
      	<ul class="nav navbar-nav">
          <li class="dropdown messages-menu">
            <a href="/">[Docmall]</a> 
          </li>
      	</ul>
      	<ul class="nav navbar-nav">
          <li class="dropdown messages-menu">
            <a href="#" >로그아웃</a> 
          </li>
      	</ul>
      	</c:if>
      	
    
        
      </div>
    </nav>
  </header>
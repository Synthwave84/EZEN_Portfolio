<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>  
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Starter</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">  



<!-- CSS용 부트스트랩 파일 -->
<%@include file="/WEB-INF//views/admin/comm/plugin1.jsp" %>
<%@include file="/WEB-INF/views/comm/plugin2.jsp" %>
<link rel="stylesheet" href="/css/adLogin.css">

</head>
<body>
<div class="container row">
<form action="/admin/admin_login" method="post">
  <div class="form-group col-12">
    <label for="administrator_id">ID</label>
    <input type="text" class="form-control" id="administrator_id" name="administrator_id" value="admin" placeholder="ID">
  </div>
  <div class="form-group col-12">
    <label for="administrator_pw">Password</label>
    <input type="password" class="form-control" id="administrator_pw" name="administrator_pw" value="1234" placeholder="pw">
    <input type="submit" value="로그인">
  </div>
  
</form>
</div>
<%@include file="/WEB-INF/views/comm/plugin.jsp" %>
 <script>
 	$(document).ready(function() {
 	  let msg = '${msg}';
      if(msg == 'failID') {
        alert("아이디를 확인하세요");
      }else if(msg == 'failPW') {
    	  alert("비밀번호를 확인하세요");
      }
 	});
 </script>
</body>
</html>
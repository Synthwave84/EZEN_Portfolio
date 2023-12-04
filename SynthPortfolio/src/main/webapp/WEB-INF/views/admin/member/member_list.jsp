<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Starter</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
  <%@ include file="/WEB-INF/views/admin/comm/plugin1.jsp" %>
  
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <%@ include file="/WEB-INF/views/admin/comm/header.jsp" %>
  
  <!-- Left side column. contains the logo and sidebar -->
  <%@ include file="/WEB-INF/views/admin/comm/nav.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">

      <div class="row"> <!-- <tr>과 같은 느낌. row 안에는 <td>를 합이 12까지 사용 가능하다. -->
        <div class="col-md-12"> <!-- <tr> 하나에 <td>를 하나만 쓰겠다는 의미 -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Product List</h3>
            </div>

            <div class="box-body">
              <div> <!-- 검색어 작업 -->
                <form action="/admin/member/member_list" method="get">
                  <select name="type">
                    <option selected>검색종류선택</option>
                    <option value="I" ${pageMaker.cri.type == 'I' ? 'selected' : ''}>회원ID</option>
                    <option value="N" ${pageMaker.cri.type == 'N' ? 'selected' : ''}>회원이름</option>
                  </select>
                  <input type="text" name="keyword" value="${pageMaker.cri.keyword}" />
                  <!-- 검색한 데이터 출력을 위해 pageNum과 amount 값을 필요로 한다. -->
                  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" />
                  <input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
                  <button type="submit" class="btn btn-primary">검색</button>
                </form>
              </div>
              <table class="table table-bordered">
                <tbody>
                  <tr>
                    <th style="width : 5%">회원 ID</th>
                    <th style="width : 5%">이름</th>
                    <th style="width : 10%">가입일</th>
                    <th style="width : 10%">이메일 주소</th>
                    <th style="width : 10%">연락처</th>
                    <th style="width : 5%">우편번호</th>
                    <th style="width : 20%">주소</th>
                 	<th style="width : 5%">포인트</th>
                 	<th style="width : 10%">최근 로그인</th>
                 	<th style="width : 5%">수정</th>
                 	<th style="width : 5%">회원탈퇴</th>
                  </tr>

                  <!-- pro_no, cg_code, pro_name, pro_price, pro_discount, pro_publisher, pro_content, pro_up_folder, pro_img, pro_amount, pro_buy, pro_date, pro_updatedate -->

                  <!-- jstl 문법작업 -->
                  <!-- forEach문 내부에서는 id를 사용할 수 없다. -->
                  <c:forEach items="${memberList}" var="memberVO"> <!-- var = itemVO class 성격이 된다. -->
                    <tr>
                      <td>${memberVO.member_id }</td>
                      <td>${memberVO.member_name}</td>
                      <td><fmt:formatDate value="${memberVO.member_datesub}" pattern="yyyy-MM-dd" /></td>
                      <td>${memberVO.member_email }</td>
                      <td>${memberVO.member_phone }</td>
                      <td>${memberVO.member_zipcode }</td>
                      <td>${memberVO.member_addr } / ${member_deaddr }</td>
                      <td>${memberVO.member_point }</td>
                      <td><fmt:formatDate value="${memberVO.member_lastlogin}" pattern="yyyy-MM-dd" /></td>
                      <td><button>수정</button></td>
                      <td><button>삭제</button></td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
            <div class="box-footer clearfix">
              <div class="row">
                <div class="col-md-2">
                  
                  <!-- 1) 페이지번호 클릭시 사용 [이전] 1 2 3 4 5 [다음], action="/admin/product/list"-->
                  <!-- 2) 목록에서 제목 클릭시 사용, actionForm.setAttribute("action", "/admin/product/get");-->
                  <form id="actionForm" action="" method="get">
                    <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}" />
                    <input type="hidden" name="amount" id="amount" value="${pageMaker.cri.amount}" />
                    <input type="hidden" name="type" id="type" value="${pageMaker.cri.type}" />
                    <input type="hidden" name="keyword" id="keyword" value="${pageMaker.cri.keyword}" />
                  </form>
                </div>
                <div class="col-md-8 text-center">
                  <nav aria-label="...">
                    <ul class="pagination">
                      <c:if test="${pageMaker.prev}">
                        <li class="page-item">
                          <a href="${pageMaker.startPage - 1}" class="page-link movepage">Previous</a> <!-- page-link movepage를 주어 페이징에 사용한 태그들을 관리한다 -->
                        </li>
                      </c:if>
                      <!--
                      begin과 end 속성은 반복 범위를 정의합니다.
                      pageMaker.startPage와 pageMaker.endPage 의 범위내에서 반복문을 수행한다.
                      num 은 반복되는 페이지 번호를 나타낸다.
                      -->
                      <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
                        <li class='page-item ${pageMaker.cri.pageNum == num ? "active":"" }'
                          aria-current="page">
                          <a class="page-link movepage" href="${num}" data-page="${num}">${num}</a>
                        </li>
                      </c:forEach>

                      <c:if test="${pageMaker.next}">
                        <li class="page-item">
                          <a href="${pageMaker.endPage + 1}" class="page-link movepage" href="#">Next</a>
                        </li>
                      </c:if>
                    </ul>
                  </nav>
                </div>
                  
                </div>
                
              </div>
              

            </div>
          </div>

        </div>
      
	
    </section>
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

   <!-- Main Footer -->
  <%@ include file="/WEB-INF/views/admin/comm/footer.jsp" %>



<%@ include file="/WEB-INF/views/admin/comm/plugin2.jsp" %>


</body>
</html>
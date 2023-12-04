<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  
<div id="category_menu">
  <ul class="nav justify-content-center" id="first_category">
    <!-- items="${firstCategoryList}": 1차 카테고리 목록 전부(GlobalControllerAdvice 참고) -->
    <!-- var="category": CategoryVO의 성격 -->
    <c:forEach items="${firstCategoryList}" var="category">
        <li class="nav-item">
          <!-- a 태그에 값을 숨기는 방법: href 또는 data- 속성 이용 -->
          <a class="nav-link active" href="#" data-cg_code="${category.cg_code}">${category.cg_name}</a>
        </li>
    </c:forEach>
  </ul>
</div>






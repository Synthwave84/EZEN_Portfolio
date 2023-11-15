<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/WEB-INF/views/comm/plugin2.jsp" %>

<style>
  body, ul, li {
    margin: 0;
    padding: 0;
    list-style: none; 
  }
  a {
    color: inherit;   /* 부모 엘리먼트의 값을 물려받는다 */
    text-decoration: none;    /* 해당 태그의 text-decoration 속성을 none 값으로 하는 것으로 밑줄을 제거한다 */
  }
  .side-bar > ul ul {
    display: none;
  }
  
  .side-bar {
    position: fixed;    /* 스크롤을 따라오도록 지정 */
    background-color: rgb(255, 80, 5);
    min-width: 12%;
    min-height: 100%;   /* 사이드바의 높이를 전체 화면 높이의 90%로 지정 */
  }
  
  .side-bar ul > li > a {
    border-bottom:solid 1px rgb(212, 212, 212);
    display: block;
    color: rgb(165, 165, 165);
    font-size: 1.4rem;
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 30px;
    transition: 0.3s;
  }
  
  /* 자식의 position이 absolute일 때 자식을 영역 안에 가두어 준다 */
  .side-bar > ul > li {
    position: relative;
  }
  
  /* 모든 메뉴가 마우스 인식 시 반응 */
  .side-bar ul > li:hover > a {
    background-color: rgb(123, 123, 123);
    border-bottom: 1px solid rgb(128, 128, 128);
  }
  
  /* 1차 메뉴의 항목이 마우스 인식 시에 2차 메뉴 등장 */
  .side-bar > ul > li:hover > ul {
    display: block;
    position: absolute;
    background-color: rgb(26, 21, 60);
    top: 0;         /* 2차 메뉴의 상단을 1차 메뉴의 상단에 고정 */
    left: 100%;     /* 2차 메뉴를 1차 메뉴의 너비만큼 이동 */
    width: 100%;    /* 1차 메뉴의 너비를 상속 */
  }
  
  
  
  
  
  /* 커스텀 끝 */
  </style>
  <p>HELLO!!!!!!!!!!!!!!</p>
  <aside class="side-bar">

    <ul>
      <li>
        <a href="#">상품관리</a>
        <ul>
          <li><a href="#">상품등록</a></li>
          <li><a href="#">상품목록</a></li>
        </ul>
      </li>
      <li>
        <a href="#">주문관리</a>
      </li>
      <li>
        <a href="#">회원관리</a>
        <ul>
          <li><a href="#">회원목록</a></li>
          <li><a href="#">회원정보</a></li>

        </ul>
      </li>
    </ul>
  </aside>

  
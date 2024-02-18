<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.101.0">
<title>Pricing example · Bootstrap v4.6</title>

<!-- Bootstrap Core CSS -->
<%@include file="/WEB-INF/views/comm/plugin2.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://jqueryui.com/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="reviewTemplate" type="text/x-handlebars-template">
  <table class="table table-sm">
<thead>
  <tr>
    <th scope="col">후기번호</th>
    <th scope="col">리뷰내용</th>
    <th scope="col">별점평</th>
    <th scope="col">날짜</th>
  <th scope="col">작성자</th>
  </tr>
</thead>
{{#each .}}
<tbody>
  <tr>
    <th scope="row" class="rev_num">{{rev_num}}</th>
    <td class="rev_content">{{rev_content}}</td>
    <td style="color: red;" class="rev_score">{{starConverter rev_score}} / {{rev_score}}</td>
    <td class="rev_regdate">{{dateConverter rev_regdate}}</td>
    <td class="member_id">{{member_id}}</td>
    <td class="">{{authControlView member_id rev_num rev_score}}</td>
</tr>
  {{/each}}
</tbody>
</table>

</script>


<style>
  .bd-placeholder-img {
    font-size: 1.125rem;
    text-anchor: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
  }

  @media (min-width: 768px) {
    .bd-placeholder-img-lg {
      font-size: 3.5rem;
    }
  }
  .ui-draggable, .ui-droppable {
    background-position:  top;
  }

  /* 별평점 기본 선택자 */
  p#star_rv_score a.rv_score {
    font-size: 22px;
    text-decoration: none;
    color: lightgray;
  }
  /* 별평점에 마우스 오버 했을 경우 사용되는 선택자 */
  p#star_rv_score a.rv_score.on {
    color: gold;
  }

</style>

<script>
    $( function() {
    $( "#tabs_item_detail" ).tabs();
    } );
</script>

</head>
<body>

<%@include file="/WEB-INF/views/comm/header.jsp" %>

<%@include file="/WEB-INF/views/comm/category_menu.jsp" %>

<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
<p>2차 카테고리 : ${cg_name }</p>
</div>

<div class="container">
<div class="card-deck mb-3 text-center row">
<div class="col-md-6" style="border: solid 1px grey;">
  상품 이미지
  <img class="btn_item_img" data-item_no="${itemVO.item_no }" width="100%" height="90%" src="/member/item/imageDisplay?dateFolderName=${itemVO.item_up_folder}&fileName=${itemVO.item_img}" alt="">
</div>
<div class="col-md-6">
  <div class="row text-left">
    <div class="col">
      상품이름 : ${itemVO.item_name}
    </div>
  </div>
  <div class="row text-left">
    <div class="col">
        <span id="unit_price">${itemVO.item_price}</span> 
    </div>
  </div>
  <div class="row text-left" >
    <div class="col">
      수량 : <input type="number" id="btn_quantity" value="1" style="width: 80px;">
    </div>
  </div>
  <div class="row text-left">
    <div class="col">
      총 상품금액 : <span id="tot_price">${itemVO.item_price}</span>
    </div>
  </div>
  <div class="row text-left">
    <div class="col-md-6">
      <button type="button" class="btn btn-outline-secondary" name="btn_order" data-item_no="${itemVO.item_no}">구매하기</button>
    </div>
    <div class="col-md-6">
      <button type="button" class="btn btn-outline-secondary" name="btn_cart_add" data-item_no="${itemVO.item_no}">장바구니</button> 
    </div>
  </div>
</div>
</div>
    
  <form id="actionForm" action="" method="get">
    <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}" />
    <input type="hidden" name="amount"  id="amount" value="${pageMaker.cri.amount}" />
    <input type="hidden" name="type" id="type" value="${pageMaker.cri.type}" />
    <input type="hidden" name="keyword" id="keyword" value="${pageMaker.cri.keyword}" />

    <input type="hidden" name="cg_code" id="cg_code" value="${cg_code}" />
    <input type="hidden" name="cg_name" id="cg_name" value="${cg_name}" />
  </form>
<div>
<div id="tabs_item_detail">
<ul>
  <li><a href="#tabs-itemdetail">상품 설명</a></li>
  <li><a href="#tabs-itemreview">상품 후기</a></li>
  <li><a href="#tabs-3">Aenean lacinia</a></li>
</ul>
<div id="tabs-itemdetail">
  <p>${itemVO.item_content}</p>
</div>
<div id="tabs-itemreview">
<p>상품후기목록</p>
<div class="row">
  <div class="col-md-12" id="review_list">

  </div>
</div>
<div class="row">
  <div class="col md-8 text-center" id="review_paging">
    
    </div>
    <div class="col-md-4 text-right">
      <button type="button" id="btn_review_write" class="btn btn-info" data-item_no="${itemVO.item_no }">상품후기 등록</button>
    </div>
  </div>
<div id="tabs-3">

</div>



</div>
</div>
</div>
<%@include file="/WEB-INF/views/comm/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

<%-- <%@include file="/WEB-INF/views/comm/plugin.jsp" %> --%>
<!-- 카테고리 메뉴 자바 스크립트 작업. -->
<script src="/js/category_menu.js"></script>


<script>
$(document).ready(function() {

  let actionForm = $("#actionForm");

  $(".movepage").on("click", function(event) {
    event.preventDefault(); // a태그의 href속성에 페이지번호를 숨겨두었다.

    actionForm.attr("action", "/member/item/item_list");

    // actionForm 태그를 가지고 있는 하위요소중 input 태그의 name 이 pageNum인 것을 찾는 작업
    actionForm.find("input[name='pageNum']").val($(this).attr("href"));

    actionForm.submit();
  });

  // 장바구니 추가
  $("button[name='btn_cart_add']").on("click", function () {
  // console.log("장바구니"); 
    $.ajax({
      url: '/member/cart/cart_add',
      type : 'post',
      data : {item_no : $(this).data("item_no") , cart_amount : $("#btn_quantity").val() },
      success : function(result) {
        if(result == "success") {
          alert("장바구니에 추가되었습니다");
            location.href = "/member/cart/cart_list";
        }
      }

    });
  });

  //구매하기(주문)
  $("button[name='btn_order']").on("click", function() {
                  
    let url = "/member/order/order_ready?item_no=" + $(this).data("item_no") + "&cart_amount=" + $("#btn_quantity").val();
    location.href = url;
  });

  // 상품 이미지또는 상품명 클릭 시 상세로 보내는 작업.
  $(".btn_item_img").on("click", function() {
    console.log("상품상세설명");
    // 상품 상세 주소 설정
    actionForm.attr("action", "/member/item/item_detail");

    let item_no = $(this).data("item_no");

    actionForm.find("input[name='item_no']").remove();
    // <input type='hidden' name='item_no' value='상품코드'>
    actionForm.append("<input type='hidden' name='item_no' value='"+ item_no +"'>");
    actionForm.submit();
  });


  //수량 변경시
  $("#btn_quantity").on("change", function() {
    
    let tot_price = parseInt($("#unit_price").text()) * parseInt($("#btn_quantity").val());

    //총 상품금액 표시.
    $("#tot_price").text(tot_price);


  });

  // 상품후기 작성 폼
  $("#btn_review_write").on("click", function () {

	

      $("#btn_review_modify").hide(); // 추가: 상품후기 수정하기 버튼 숨김
      $("#btn_review_save").show(); // 추가: 상품후기 수정하기 버튼 보임
      $('#review_modal').modal('show');
      $("#rev_num").text("");
      $('#rev_content').val("");
      $("#star_rv_score a.rv_score").removeClass("on");  
  });
  
  
  
  // 별점 클릭 시. 별평점태그 5개
  $("p#star_rv_score a.rv_score").on("click", function(e) {
    e.preventDefault();

    // this는 클릭한 a태그
    $(this).parent().children().removeClass("on");
    $(this).addClass("on").prevAll("a").addClass("on");

  });

  // 상품명 목록 불러오는 작업(이벤트 사용 불가)
    // 상품 후기 작업 함수
    let printReviewList = function(reviewData, target, template) {
    let templateObj = Handlebars.compile(template.html());
    let reviewHtml = templateObj(reviewData);

    $("#review_list").children().remove();
    // 상품후기 목록 위치를 참조하여 추가.
    target.append(reviewHtml);
  }
  // 목록의 첫번째 페이지
  let reviewPage = 1;
  // @GetMapping("/list{item_no}/{page}")
  let url = "/member/review/list/" + '${itemVO.item_no}' + "/" + reviewPage;
  getReviewInfo(url);
  function getReviewInfo(url) {
    $.getJSON(url, function(data) {

      // console.log("상품후기", data-list);
      // console.log("페이징정보", data.pageMaker.total);
      // review_list

      printReviewList(data.list, $("#review_list"),$("#reviewTemplate"))

      // review_paging
      printPaging(data.pageMaker, $("#review_paging"));
    });
  }


  // 페이징 기능작업
  let printPaging = function(pageMaker, target) {

    let pagingStr = '<nav id="navigation" aria-label="Page navigation example">';
    pagingStr += '<ul class="pagination">';
    // 이전 표시 여부 
    if (pageMaker.prev) {
      pagingStr += '<li class="page-item"><a class="page-link" href="' + (pageMaker.startPage - 1) +'">[prev]</a></li>'
  }
  
  // 페이지 번호 출력
  for (let i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
        let className = pageMaker.cri.pageNum == i ? 'active' : '';
        pagingStr += '<li class="page-item ' + className + '"><a class="page-link" href="' +i+ '">' + i + '</a></li>';
      }
  // 다음 표시 여부
  if (pageMaker.next) {
      pagingStr += '<li class="page-item"><a class="page-link" href="' + (pageMaker.startPage + 1) +'">[next]</a></li>'
  }
  pagingStr += '</ul>';
  pagingStr += '</nav>';

  // 리뷰페이징 중복데이터 제거
  target.children().remove();
  target.append(pagingStr);

}

  // 사용자정의 Helper(Handlebars함수)
  // 상품후기 등록일 millisecond ->자바스크립트의 date함수로 변경
  Handlebars.registerHelper("dateConverter", function(reviewTime) {
    const dateObj = new Date(reviewTime);
    let year = dateObj.getFullYear();
    let month = dateObj.getMonth();
    let date = dateObj.getDate();
    let hour = dateObj.getHours();
    let minute = dateObj.getMinutes();

    return year + "/" + month + "/" + date + " " + hour + ":" + minute;
  });

  // 사용자정의 Helper 별점만들기

  Handlebars.registerHelper("starConverter", function (reviewScore) {
    let starStr = "";

    switch(reviewScore) {
      case 1:
        starStr="★☆☆☆☆";
        break;
      case 2:
        starStr="★★☆☆☆";
        break;
      case 3:
        starStr="★★★☆☆";
        break;
      case 4:
        starStr="★★★★☆";
        break;
      case 5:
        starStr="★★★★★";
        break;
    }

    return starStr;
  });

  // 상품후기 수정/ 삭제버튼 표시
  Handlebars.registerHelper("authControlView", function(member_id, rev_num, rev_score) {
    let str ="";
    let login_id = '${sessionScope.loginStatus.member_id}';

    // 로그인한 사용자와 상품후기 등록 사용자의 동일 일치 여부
    if(login_id == member_id) {
    str += '<button type="button" name="btn_review_edit" class="btn btn-info" data-rev_score="'+ rev_score +'">수정</button>';
    str += '<button type="button" name="btn_review_del" class="btn btn-danger" data-rev_num="'+ rev_num +'">삭제</button>';

    console.log(str);
    // 출력내용이택읠때 사용
    return new Handlebars.SafeString(str);
    }

  });

  // 상품후기 수정 버튼 클릭
  $("div#review_list").on("click", "button[name='btn_review_edit']", function () {
    
    // console.log("번호 :", $(this).parent().parent().find(".rev_num").text());
  // console.log("내용 :", $(this).parent().parent().find(".rev_content").text());
  // console.log("별 :", $(this).parent().parent().find(".rev_score").text());
  // console.log("날짜 :", $(this).parent().parent().find(".rev_regdate").text());
    let rev_score = $(this).data("rev_score")
      
    $("#star_rv_score a.rv_score").each(function(index, item) {
      if(index < rev_score) {
        $(item).addClass("on");
      } else {
        $(item).removeClass("on");
      }
    }) ;

  $("#rev_content").val($(this).parent().parent().find(".rev_content").text());
  $("#rev_num").text($(this).parent().parent().find(".rev_num").text());
  $("#rev_regdate").text($(this).parent().parent().find(".rev_regdate").text());
  $("#btn_review_save").hide(); //상품후기 저장 버튼 숨김
  $("#btn_review_modify").show();//상품후기 수정 버튼 보임
  // modal = 부트스트랩 명령어
  // $("#btn_review_modify").text($(this).parent().parent().find(".rev_num").text());
  $('#review_modal').modal('show');
  });

  // 상품 삭제 버튼
  $("div#review_list").on("click", "button[name='btn_review_del']", function() {
    let rev_num = $(this).data("rev_num");

    $.ajax({
      url:'/user/review/delete/' + rev_num,
      headers :{
        "Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"
      },
      type : 'delete',
      // 데이터 포맷 object -> json변환.
    
      dataType : 'text',
      success : function(result) {
        if(result =='success') {
          if (confirm("정말 삭제하시겠습니까?"));
          alert("상품평이 삭제되었습니다..")
          // 부트스트랩 4.6버전의 자바스크립트 명령어
          
          url = "/member/review/list/" + '${itemVO.item_no}' + "/" + reviewPage;
                // 상품평 목록 불러오는 작업.
                getReviewInfo(url);

        }
    }
    });
  })


// 상품후기 수정
$("#btn_review_modify").on("click", function() {
  let rev_num = $("#rev_num").text();
  let rev_content = $("#rev_content").val(); 

  let rev_score = 0;
    $("p#star_rv_score a.rv_score").each(function (index, item) {
      if($(this).attr("class") == "rv_score on") {
        rev_score += 1;
      }
    });

    let review_data = {rev_num: rev_num, rev_content : rev_content, rev_score : rev_score}

  $.ajax({
      url:'/member/review/modify',
      headers :{
        "Content-Type" : "application/json", "X-HTTP-Method-Override" : "PUT"
      },
      type : 'put',
      // 데이터 포맷 object -> json변환.
      data : JSON.stringify(review_data),
      dataType : 'text',
      success : function(result) {
        if(result =='success') {
        alert("상품평이 수정되었습니다.")
          // 부트스트랩 4.6버전의 자바스크립트 명령어
        $('#review_modal').modal('hide');
        // 상품평 목록 불러오는 작업.
        getReviewInfo(url);
       
        }
    }
    });
});

  // 페이징 번호 클릭
  // $("div#review_paging(정적태그)").on("click", "(동적태그)", function() {}
  $("div#review_paging").on("click", "nav#navigation ul a", function(e) {
    e.preventDefault();
    // console.log("페이지번호");

    // 상품후기 선택 페이지번호 클릭
    reviewPage = $(this).attr("href");
    url = "/user/review/list/" + '${itemVO.item_no}' + "/" + reviewPage;

    // 스프링에서 상품후기, 페이지번호 데이터 가져오는 함수.
    getReviewInfo(url);
  });


  // 상품 후기 저장
  $("#btn_review_save").on("click" ,function() {
    // 별평점 값 
    let rev_score = 0;
    let rev_content = $("#rev_content").val();
    $("p#star_rv_score a.rv_score").each(function (index, item) {
      if($(this).attr("class") == "rv_score on") {
        rev_score += 1;
      }
    });

    if(rev_score == 0) {
      alert("별 평점을 체크해주세요");
      return;
    }

    // 후기 체크
    if(rev_content == "") {
      alert ("상품 리뷰 내용을 작성 해 주세요");
      return;
    }

      // ajax를 사용하여 스프링으로 리뷰데이터 전송작업
      let review_data = {item_no : $(this).data("item_no"), rev_content: rev_content, rev_score: rev_score};
    // ajax작업 스프링으로 리뷰데이터전송
    $.ajax({
      url:'/member/review/new',
      headers :{
        "Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"
      },
      type : 'post',
      // 데이터 포맷 object -> json변환.
      data : JSON.stringify(review_data),
      dataType : 'text',
      success : function(result) {
        if(result =='success') {
          
          alert("상품평이 등록되었습니다.")
          // 부트스트랩 4.6버전의 자바스크립트 명령어
          $('#review_modal').modal('hide');
                // 상품평 목록 불러오는 작업.
                getReviewInfo(url);

        }
      }
    });

  });

  


});   // ready event end
</script>

<!--상품 후기 Modal-->
<div class="modal fade" id="review_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
  <div class="modal-header">
    <!--  h5 class="modal-title" id="exampleModalLabel">상품 후기</h5> -->
    <b>상품후기&nbsp;</b><span id="rev_num"></span>&nbsp;<span id="rev_regdate"></span>
    <button type="button" class="close" id="close" data-dismiss="modal" aria-label="Close">

    </button>
  </div>
  <div class="modal-body">
    <form>
      <div class="form-group">
        <label for="recipient-name" class="col-form-label">별점 주기</label>
      <p id="star_rv_score">
        <a class="rv_score" href="#">★</a>
        <a class="rv_score" href="#">★</a>
        <a class="rv_score" href="#">★</a>
        <a class="rv_score" href="#">★</a>
        <a class="rv_score" href="#">★</a>
      </p>

      </div>
      <div class="form-group">
        <label for="message-text" class="col-form-label">내용</label>
        <textarea class="form-control" id="rev_content"></textarea>
      </div>
    </form>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    <button type="button" id="btn_review_save" class="btn btn-primary" data-item_no="${itemVO.item_no }">상품 후기 저장</button>
    <button type="button" id="btn_review_modify" class="btn btn-primary" data-item_no="${itemVO.item_no }">상품 후기 수정</button>
  </div>
</div>
</div>
</div>

</body>
</html>
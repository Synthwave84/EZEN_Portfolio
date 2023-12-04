<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- CSS용 부트스트랩 파일 -->
	<%@include file="/WEB-INF/views/comm/plugin2.jsp" %>
	
	
</head>
<body>
<%@include file="/WEB-INF/views/comm/header.jsp" %>
	<div class="container">
  <div class="text-center">
    <div class="box box-primary">
      <div class="box-header with-border">
  
      <h3>회원가입</h3>
        <form role="form" id="joinForm" method="post" action="/member/join">
          <div class="box-body">
          <div class="form-group row">
            <label for="member_id" class="col-2">아이디</label>
            <div class="col-7">
              <input type="text" class="form-control" name="member_id" id="member_id" placeholder="아이디 입력">
            </div>
            <div class="col-3">
              <button type="button" class="btn btn-outline-primary" id="isIdInUse">아이디 중복 체크</button>
            </div>
          </div>
          <div class="form-group row">
            <label for="" class="col-2">비밀번호</label>
            <div class="col-4">
              <input type="password" class="form-control" name="member_password" id="member_password" placeholder="비밀번호 입력">
            </div>
            <label for="" class="col-2">비밀번호 확인</label>
            <div class="col-4">
              <input type="password" class="form-control" id="member_password2" placeholder="비밀번호 확인">
            </div>
          </div>
          <div class="form-group row">
            <label for="" class="col-2">이름</label>
            <div class="col-10">
              <input type="text" class="form-control" name="member_name" id="memeber_name" placeholder="이름">
            </div>
          </div>
          <div class="form-group row">
            <label for="" class="col-2">이메일 주소</label>
            <div class="col-7">
              <input type="email" class="form-control" name="member_email" id="member_email" placeholder="이메일 주소 입력">
            </div>
              <div class="col-3">
                <button type="button" class="btn btn-outline-primary" id="mailAuth">메일인증</button>
              </div>
          </div>
          <div class="form-group row">
            <label for="" class="col-2">인증코드</label>
            <div class="col-7">
              <input type="text" class="form-control" name="" id="" placeholder="인증코드입력">
            </div>
              <div class="col-3">
                <button type="button" class="btn btn-outline-primary" id="btnConfirmAuth">인증코드입력</button>
              </div>
          </div>
          <div class="form-group row">
            <label for="sample2_postcode" class="col-2">우편번호</label>
            <div class="col-7">
              <input type="text" class="form-control" name="member_zipcode" id="sample2_postcode" placeholder="우편번호">
            </div>
            <div class="col-3">
              <button type="button" onclick="sample2_execDaumPostcode()" class="btn btn-outline-primary">우편번호 검색</button>
            </div>
          </div>
          <div class="form-group row">
            <label for="sample2_address" class="col-2">기본주소</label>
            <div class="col-10">
              <input type="text" class="form-control" name="member_addr" id="sample2_address" placeholder="기본주소">
            </div>
          </div>
          <div class="form-group row">
            <label for="sample2_detailAddress" class="col-2">상세주소</label>
            <div class="col-10">
              <input type="text" class="form-control" name="member_deaddr" id="sample2_detailAddress" placeholder="상세주소">
              <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
            </div>
          </div>
          <div class="form-group row">
            <label for="" class="col-2">휴대폰 번호</label>
            <div class="col-10">
              <input type="text" class="form-control" name="member_phone" id="member_phone" placeholder="휴대폰 번호">
            </div>
          </div>
          <div class="box-footer">
            <button type="submit" class="btn btn-primary" id="btnJoin">가입하기</button>
            <button type="reset" class="btn btn-primary" id="btnReset">초기화</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>


 
</div>
 <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
  <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
  </div>
  
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
      // 우편번호 찾기 화면을 넣을 element
      var element_layer = document.getElementById('layer');
  
      function closeDaumPostcode() {
          // iframe을 넣은 element를 안보이게 한다.
          element_layer.style.display = 'none';
      }
  
      function sample2_execDaumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수
  
                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
                  }
  
                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if(data.userSelectedType === 'R'){
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                      if(extraAddr !== ''){
                          extraAddr = ' (' + extraAddr + ')' ;
                      }
                      // 조합된 참고항목을 해당 필드에 넣는다.
                      document.getElementById("sample2_extraAddress").value = extraAddr;
                  
                  } else {
                      document.getElementById("sample2_extraAddress").value = '';
                  }
  
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('sample2_postcode').value = data.zonecode;
                  document.getElementById("sample2_address").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("sample2_detailAddress").focus();
  
                  // iframe을 넣은 element를 안보이게 한다.
                  // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                  element_layer.style.display = 'none';
              },
              width : '100%',
              height : '100%',
              maxSuggestItems : 5
          }).embed(element_layer);
  
          // iframe을 넣은 element를 보이게 한다.
          element_layer.style.display = 'block';
  
          // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
          initLayerPosition();
      }
  
      // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
      // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
      // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
      function initLayerPosition(){
          var width = 300; //우편번호서비스가 들어갈 element의 width
          var height = 400; //우편번호서비스가 들어갈 element의 height
          var borderWidth = 5; //샘플에서 사용하는 border의 두께
  
          // 위에서 선언한 값들을 실제 element에 넣는다.
          element_layer.style.width = width + 'px';
          element_layer.style.height = height + 'px';
          element_layer.style.border = borderWidth + 'px solid';
          // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
          element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
          element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
      }
  </script>
  
<%@include file="/WEB-INF/views/comm/plugin.jsp" %>

<script>
  $(document).ready(function () {

	// 아이디 중복 확인 여부 버튼 연관 작업

    // 아이디 중복체크 버튼 사용 여부 확인.
    let useIdCheck = false;
    $("#isIdInUse").click(function() {
      // 아이디 중복 검사 버튼 클릭 시, 아이디 작성 여부 검사 (빈칸 검증)
      if($("#member_id").val() == "") {
          alert("아이디를 입력하세요.");
          $("#member_id").focus();
          return;
      }
    
    
      // 아이디 중복체크. A.01
      
      // 스프링에서 받아올 값 확인하기.
      // 스프링에서 가져올 값은 자바스크립트의 오브젝트 방식으로 작성.
      $.ajax({
        url : "/member/isIdInUse",
        type : "get",
        dataType : "text",
        data: {member_id : $("#member_id").val()},
        // 스프링에서 넘어온 데이터를 기반으로 중복 체크.
        success : function(result) {
          if(result == "true") {
            alert("아이디 사용이 가능합니다.");
            useIdCheck = true;
          }else {
            alert("아이디가 사용중입니다.");
            useIdCheck = false;
            $("#member_id").val("");
            $("#member_id").focus();
            return;
          }
        }
      })
    });

    $("#btnJoin").click(function() {

      // 사용자의 버튼 사용 여부 확인.
      if(!useIDCheck) {
          alert("아이디 중복체크 확인 바랍니다.");
          return false;
        }


    joinForm.submit();

    });



  });




  </script>
</body>
</html>
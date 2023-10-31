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
	<div class="container">
  <div class="text-center">
    <div class="box box-primary">
      <div class="box-header with-border">
  
      <h3>회원가입</h3>
        <form role="form" id="joinForm" method="post" action="/member/join">
          <div class="box-body">
          <div class="form-group row">
            <label for="" class="col-2">아이디</label>
            <div class="col-7">
              <input type="text" class="form-control" name="" id="" placeholder="아이디 입력">
            </div>
            <div class="col-3">
              <button type="button" class="btn btn-outline-primary" id="">아이디 중복 체크</button>
            </div>
          </div>
          <div class="form-group row">
            <label for="" class="col-2">비밀번호</label>
            <div class="col-4">
              <input type="password" class="form-control" name="" id="" placeholder="비밀번호 입력">
            </div>
            <label for="" class="col-2">비밀번호 확인</label>
            <div class="col-4">
              <input type="password" class="form-control" id="" placeholder="비밀번호 확인">
            </div>
          </div>
          <div class="form-group row">
            <label for="" class="col-2">이름</label>
            <div class="col-10">
              <input type="text" class="form-control" name="mbsp_name" id="" placeholder="이름">
            </div>
          </div>
          <div class="form-group row">
            <label for="" class="col-2">이메일 주소</label>
            <div class="col-7">
              <input type="email" class="form-control" name="" id="" placeholder="이메일 주소 입력">
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
              <input type="text" class="form-control" name="" id="sample2_postcode" placeholder="우편번호">
            </div>
            <div class="col-3">
              <button type="button" class="btn btn-outline-primary">우편번호 검색</button>
            </div>
          </div>
          <div class="form-group row">
            <label for="sample2_address" class="col-2">기본주소</label>
            <div class="col-10">
              <input type="text" class="form-control" name="" id="sample2_address" placeholder="기본주소">
            </div>
          </div>
          <div class="form-group row">
            <label for="sample2_detailAddress" class="col-2">상세주소</label>
            <div class="col-10">
              <input type="text" class="form-control" name="" id="sample2_detailAddress" placeholder="상세주소">
              <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
            </div>
          </div>
          <div class="form-group row">
            <label for="" class="col-2">휴대폰 번호</label>
            <div class="col-10">
              <input type="text" class="form-control" name="" id="" placeholder="휴대폰 번호">
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
<%@include file="/WEB-INF/views/comm/plugin.jsp" %>
</body>
</html>
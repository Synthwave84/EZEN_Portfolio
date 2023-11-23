  <%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  <!DOCTYPE html>
  <!--
  This is a starter template page. Use this page to start your new project from
  scratch. This page gets rid of all links and provides the needed markup only.
  -->
  <html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Starter</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    
    <%@include file="/WEB-INF/views/admin/comm/plugin1.jsp" %>
    <%@include file="/WEB-INF/views/admin/comm/plugin2.jsp" %>
    
  </head>

  <body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <!-- Main Header -->
    <%@ include file="/WEB-INF/views/admin/comm/header.jsp" %>
    <!-- Left side column. contains the logo and sidebar -->
    <%@ include file="/WEB-INF/views/admin/comm/sidebar.jsp" %>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->


      <!-- Main content -->
      <section class="content container-fluid">

          <div class="row">
          
            <div class="col-md-12">
              <div class="box box-primary">
              <div class="box-header with-border">
                <h3 class="box-title mt-5">상품등록</h3>
              </div>
              <!-- 폼태그 안에 인풋타입 중 'file' 이 있을 경우 enctype="multipart/form-data" 필수로 추가-->
        <form role="form" method="post" action="/admin/product/item_insert" enctype="multipart/form-data">
          <div class="box-body">
          <div class="form-group row">
            <label for="title" class="col-sm-2">카테고리</label>
            <div class="col-sm-3">
              <select class="form-control" id="firstCategory">
                <option>1차 카테고리 선택</option>
                <c:forEach items="${firstCategoryList}" var="cgcodeVO">
                    <option value="${cgcodeVO.cg_code }">${cgcodeVO.cg_name } </option>
                </c:forEach>
              </select>
            </div>
            <div class="col-sm-3">
              <select class="form-control" id="secondCategory" name="cg_code">
                <option value="">2차 카테고리 선택</option>
              </select>
            </div>
          </div>
          <div class="form-group row">
            <label for="title" class="col-sm-2">상품명</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" name="item_name" id="item_name" placeholder="상품명 입력">
            </div>
            <label for="title" class="col-sm-2">상품가격</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" name="item_price" id="item_price" placeholder="상품가격 입력">
            </div>
          </div>
          <div class="form-group row">
            <label for="title" class="col-sm-2">할인율</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" name="item_discount" id="item_discount" placeholder="할인율 입력">
            </div>
            <label for="title" class="col-sm-2">제조사</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" name="item_manufacture" id="item_manufacture" placeholder="제조사 입력">
            </div>
          </div>
          <div class="form-group row">
            <label for="title" class="col-sm-2">상품이미지</label>
            <div class="col-sm-4">
              <input type="file" class="form-control" name="uploadFile" id="uploadFile">
            </div>
            <label for="title" class="col-sm-2">미리보기 이미지</label>
            <div class="col-sm-4">
              <img id="img_preview" style="width:200px; height:200px;">
            </div>
          </div>
          <div class="form-group row">
            <label for="title" class="col-sm-2">상품 간략설명</label>
            <div class="col-sm-10">
              <textarea class="form-control" id="item_short_detail" name="item_short_detail" rows="3"></textarea>
            </div>
          </div>
          <div class="form-group row">
            <label for="title" class="col-sm-2">상품설명</label>
            <div class="col-sm-10">
              <textarea class="form-control" id="item_content" name="item_content" rows="3"></textarea>
            </div>
          </div>
          <div class="form-group row">
            <label for="title" class="col-sm-2">수량</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" name="item_amount" id="item_amount" placeholder="수량">
            </div>
            <label for="title" class="col-sm-2">판매여부</label>
            <div class="col-sm-4">
              <select class="form-control" name="item_buy" id="item_buy">
                <option value="Y">판매가능</option>
                <option value="N">판매불가능</option>
              </select>
            </div>
          </div>
          <div class="form-group row">
          <label for=title class="col-sm-2">기본 사양</label>
          	<div class="col-sm-4">
          	<select class="form-control" name="grade" id="grade">
          		<option value="1"></option>
          		<option value="2"></option>
          		<option value="3"></option>
          		<option value="4"></option>
          	</select>
          	</div>
      
          </div>
          
          <div class="box-footer">
              <div class="form-group">
              <ul class="uploadedList"></ul>
              
              
              </div>
          
            <div class="text-center">
              <button type="submit" class="btn btn-primary">상품등록</button>
              <button type="reset" class="btn btn-primary">취소</button>
            </div>
          </div>
          </form>
        </div>
        </div>
      </div>
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

</div>
  <!-- REQUIRED JS SCRIPTS -->

  <script src="/bower_components/ckeditor/ckeditor.js"></script>
  <script>
    $(document).ready(function () {
      // ckeditor 환경설정. 자바스크립트 Ojbect문법
        var ckeditor_config = {
            resize_enabled : false,
            enterMode : CKEDITOR.ENTER_BR,
            shiftEnterMode : CKEDITOR.ENTER_P,
            toolbarCanCollapse : true,
            removePlugins : "elementspath", 
            //업로드 탭기능추가 속성. CKEditor에서 파일업로드해서 서버로 전송클릭하면 , 이 주소가 동작된다.
            filebrowserUploadUrl: '/admin/item/imageUpload' 
        }

        CKEDITOR.replace("item_content", ckeditor_config);
        console.log("ckeditor 버전: ", CKEDITOR.version);
        
        // 1차 카테고리 선택
        $("#firstCategory").change(function() {
          // $(this) : 태그중 선택한 option 태그를 가리킴
          let cg_prtcode = $(this).val();
          
          console.log("1차 카테고리 코드", cg_prtcode);

        // 1차 카테고리 선택에 의한 2차카테고리 정보를 가져오는 url
          let url= "/admin/common/category/secondCategory/" + cg_prtcode;// + ".json";

        // getJSON : 스프링에 요청시 데이터를 json으로 받는 기능. ajax기능 제공
          $.getJSON(url, function(secondCategoryList) {
          console.log("2차카테고리 정보", secondCategoryList);
                
            console.log("2차카테고리 갯수 :" , secondCategoryList.length);

            // 2차 카테고리 select 태그 참조
            let secondCategory = $("#secondCategory");
            let optionStr = "";
              // <option value='10'>

            secondCategory.find("option").remove();
            secondCategory.append("<option value=''>2차 카테고리 선택</option>");
                
            for (let i = 0; i < secondCategoryList.length; i++) {
            optionStr += "<option value='" + secondCategoryList[i].cg_code+ "'>"  +
            secondCategoryList[i].cg_name+"</option>";
            
          }

          // console.log(optionStr);
          // 2차카테고리에 <option>태그들이 추가됨.
          secondCategory.append(optionStr); 

      
          });
          
        });
        

        // 파일 첨부시 이미지 미리보기.
        // 파일 첨부에 따른 이벤트 관련 정보를 e란 매개변수를 통하여 참조.
      
      
      
        $("#uploadFile").change(function(event) {
            // 선택한 파일
            let file = event.target.files[0]; // 선택한 파일중 첫번째 파일을 가리킨다.

            let reader = new FileReader(); // 첨부된 파일을 이용하여, File 객체를 생성하는 용도
            reader.readAsDataURL(file); // reader 객체에 file 객체가(정보가) 할당된다.

            reader.onload = function(event) {
              // <img id="img_preview" style="width:200px; height:200px;">
              // 위 코드는 src가 없는 상태로 아래코드로 src 속성을 추가
              // event.target.result : reader 객체의 이미지파일정보
              $("#img_preview").attr("src", event.target.result);
            }
          });
    });
    
      
    
  </script>
  </body>
  </html>
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
</head>
<%@ include file="/WEB-INF/views/admin/comm/plugin1.jsp" %>
<%@ include file="/WEB-INF/views/admin/comm/plug-in.jsp" %>
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
      <h1>
        amazing
        <small>Optional description</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">

        <div class="row">
        
          <div class="col-md-12">
            <div class="box box-primary">
	            <div class="box-header with-border">
	              <h3 class="box-title mt-5">상품등록</h3>
	            </div>
          
            <!-- 폼태그 안에 인풋타입 중 'file' 이 있을 경우 enctype="multipart/form-data" 필수로 추가-->
      <form role="form" method="post" action="/admin/item/item_insert" enctype="multipart/form-data" id="itemForm">
        <div class="box-body">
        <div class="form-group row">
          <label for="title" class="col-sm-2">카테고리</label>
          <div class="col-sm-3">
            <select class="form-control" id="firstCategory">
              <option value="0">1차 카테고리 선택</option>
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
          <div class="col-sm-3">
            <select class="form-control" id="manufacture_code">
              <option value="0">제조사 선택</option>
              <c:forEach items="${manufactureList}" var="manufactureVO">
                  <option value="${manufactureVO.manufacture_code }">${manufactureVO.manufacture_name } </option>
              </c:forEach>
            </select>
            <input type="hidden" id=item_manufacture name=item_manufacture>
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
          <label for="title" class="col-sm-2">상품 간략 설명</label>
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
        <fieldset class="form-group border p-3">
        <legend class="w-auto px-2" style="text-align: center;">호환성 목록</legend>
        <div class="form-group row" id="option_1">
	          <label for="title" class="col-sm-2" >카테고리</label>
	          <div class="col-sm-3">
	            <select class="form-control optionTypeList" name="option_type_id">
	              <option value="0">1차 카테고리 선택</option>
	              <c:forEach items="${optionType}" var="optionTypeVO">
	                  <option value="${optionTypeVO.option_type_id }">${optionTypeVO.option_type_name } </option>
	              </c:forEach>
	            </select>
	          </div>
	          <div class="col-sm-3">
	            <select class="form-control optionCG" name="option_cg_id">
	              <option value="">2차 카테고리 선택</option>
	            </select>
	          </div>
	          <div class="col-sm-3">
	            <select class="form-control optionValue" name="option_id">
	              <option value="0">3차 카테고리선택</option>
	            </select>
	          </div>
          
          </div>
           <div class="form-group row" id="option_2">
	          <label for="title" class="col-sm-2">카테고리</label>
	          <div class="col-sm-3">
	            <select class="form-control optionTypeList" name="option_type_id">
	              <option value="0">1차 카테고리 선택</option>
	              <c:forEach items="${optionType}" var="optionTypeVO">
	                  <option value="${optionTypeVO.option_type_id }">${optionTypeVO.option_type_name } </option>
	              </c:forEach>
	            </select>
	          </div>
	          <div class="col-sm-3">
	            <select class="form-control optionCG" name="option_cg_id">
	              <option value="">2차 카테고리 선택</option>
	            </select>
	          </div>
	          <div class="col-sm-3">
	            <select class="form-control optionValue" name="option_id">
	              <option value="0">3차 카테고리선택</option>
	            </select>
	          </div>
          
          </div>
          <div class="form-group row" id="option_3">
	          <label for="title" class="col-sm-2">카테고리</label>
	          <div class="col-sm-3">
	            <select class="form-control optionTypeList" name="option_type_id">
	              <option value="0">1차 카테고리 선택</option>
	              <c:forEach items="${optionType}" var="optionTypeVO">
	                  <option value="${optionTypeVO.option_type_id }">${optionTypeVO.option_type_name } </option>
	              </c:forEach>
	            </select>
	          </div>
	          <div class="col-sm-3">
	            <select class="form-control optionCG" name="option_cg_id">
	              <option value="">2차 카테고리 선택</option>
	            </select>
	          </div>
	          <div class="col-sm-3">
	            <select class="form-control optionValue" name="option_id">
	              <option value="0">3차 카테고리선택</option>
	            </select>
	          </div>
          
          </div>
           <div class="form-group row" id="option_4">
	          <label for="title" class="col-sm-2" >카테고리</label>
	          <div class="col-sm-3">
	            <select class="form-control optionTypeList" name="option_type_id">
	              <option value="0">1차 카테고리 선택</option>
	              <c:forEach items="${optionType}" var="optionTypeVO">
	                  <option value="${optionTypeVO.option_type_id }">${optionTypeVO.option_type_name } </option>
	              </c:forEach>
	            </select>
	          </div>
	          <div class="col-sm-3">
	            <select class="form-control optionCG" name="option_cg_id">
	              <option value="">2차 카테고리 선택</option>
	            </select>
	          </div>
	          <div class="col-sm-3">
	            <select class="form-control optionValue" name="option_id">
	              <option value="0">3차 카테고리선택</option>
	            </select>
	          </div>
          
          </div>
           <div class="form-group row" id="option_5">
	          <label for="title" class="col-sm-2" >카테고리</label>
	          <div class="col-sm-3">
	            <select class="form-control optionTypeList" name="option_type_id">
	              <option value="0">1차 카테고리 선택</option>
	              <c:forEach items="${optionType}" var="optionTypeVO">
	                  <option value="${optionTypeVO.option_type_id }">${optionTypeVO.option_type_name } </option>
	              </c:forEach>
	            </select>
	          </div>
	          <div class="col-sm-3">
	            <select class="form-control optionCG" name="option_cg_id">
	              <option value="">2차 카테고리 선택</option>
	            </select>
	          </div>
	          <div class="col-sm-3">
	            <select class="form-control optionValue" name="option_id">
	              <option value="0">3차 카테고리선택</option>
	            </select>
	          </div>
          
          </div>
        	
  
          <div class="text-center">
            <button type="submit" class="btn btn-primary">상품등록</button>
            <button type="reset" class="btn btn-primary">취소</button>
          </div>
        
                 
        </fieldset>
        </div>
        </form>
        	</div>
        	</div>
        	</div>
        </section>
        </div>
        </div>
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

      	$("#option_1").hide();
    	$("#option_2").hide();
    	$("#option_3").hide();
    	$("#option_4").hide();
  		$("#option_5").hide();


  		 function getSelectedOptions(divId) {
  		    let selectedOptions = [];
  		    $(divId + " select").each(function () {
  		      selectedOptions.push($(this).val());
  		    });
  		    return selectedOptions;
  		  }

  		 
		
      // 1차 카테고리 선택
      $("#firstCategory").change(function() {
        // $(this) : 태그중 선택한 option 태그를 가리킴
        let cg_prtcode = $(this).val();
		// 여기에서 업데이트된 텍스트를 설정하는 로직 추가
	   
		$(".optionTypeList").val(cg_prtcode);
    	// 예: 선택한 카테고리를 기반으로 텍스트 생성
		
	    // ID가 optionType인 <p> 태그의 텍스트 내용 설정
	    
        console.log("1차 카테고리 코드", cg_prtcode);


      // 1차 카테고리 선택에 의한 2차카테고리 정보를 가져오는 url
        let url= "/common/category/secondCategory/" + cg_prtcode;// + ".json";

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

      $("#secondCategory").change(function() {
          // $(this) : 태그중 선택한 option 태그를 가리킴
          let cg_code = $(this).val();
          
          console.log("카테고리 정보", cg_code);

        // 1차 카테고리 선택에 의한 2차카테고리 정보를 가져오는 url
          let url= "/common/category/manufactureCode/" + cg_code;// + ".json";

        // getJSON : 스프링에 요청시 데이터를 json으로 받는 기능. ajax기능 제공
          $.getJSON(url, function(ManufactureList) {
          console.log("제조사정보", ManufactureList);
                
            console.log("카테고리정보 :" , ManufactureList.length);

            // 2차 카테고리 select 태그 참조
            let manufactureCode = $("#manufacture_code");
            console.log("제조사정보", manufactureCode.val())
            let optionStr = "";
              // <option value='10'>

            manufactureCode.find("option").remove();
            manufactureCode.append("<option value=''>제조사 선택</option>");
                
            for (let i = 0; i < ManufactureList.length; i++) {
            optionStr += "<option value='" + ManufactureList[i].manufacture_code+ "'>"  +
            ManufactureList[i].manufacture_name+"</option>";
            
          }

          // console.log(optionStr);
          // 2차카테고리에 <option>태그들이 추가됨.
          manufactureCode.append(optionStr); 
          });
        });

		
			
		
      	$("#manufacture_code").change(function() {
			let manufacture_code = $(this).val();
			console.log("선택 제조사 번호", manufacture_code);
			$("#item_manufacture").val(manufacture_code);
            console.log("아이템 제조사 코드 값 반영", $("#item_manufacture").val());
          	});

      	$("#firstCategory").change(function() {
            // $(this) : 태그중 선택한 option 태그를 가리킴
            let option_type_id = $(this).val();
            
            console.log("카테고리 정보", option_type_id);

          // 1차 카테고리 선택에 의한 2차카테고리 정보를 가져오는 url
            let url= "/common/option/type/" + option_type_id;// + ".json";

          // getJSON : 스프링에 요청시 데이터를 json으로 받는 기능. ajax기능 제공
            $.getJSON(url, function(optionTypeList) {
            console.log("선택 옵션 타입 정보 :", optionTypeList);
                  
              console.log("옵션타입 길이 정보 :" , optionTypeList.length);

              // 2차 카테고리 select 태그 참조
              let option_cg_id = $(".optionCG");
              console.log("제조사정보", option_cg_id.val());
              let optionStr = "";
                // <option value='10'>

              option_cg_id.find("option").remove();
              option_cg_id.append("<option value=''>부품선택 선택</option>");
                  
              for (let i = 0; i < optionTypeList.length; i++) {
              optionStr += "<option value='" + optionTypeList[i].option_cg_id+ "'>"  +
              optionTypeList[i].option_cg_name+"</option>";
              
            }

            // console.log(optionStr);
            // 2차카테고리에 <option>태그들이 추가됨.
            option_cg_id.append(optionStr); 
            });
          });

      	$(".optionCG").change(function() {
            // $(this) : 태그중 선택한 option 태그를 가리킴
            let option_cg_id = $(this).val();
            
            console.log("카테고리 정보", option_cg_id);

          // 1차 카테고리 선택에 의한 2차카테고리 정보를 가져오는 url
            let url= "/common/option/option_val/" + option_cg_id;// + ".json";

          // getJSON : 스프링에 요청시 데이터를 json으로 받는 기능. ajax기능 제공
            $.getJSON(url, function(optionValueList) {
            console.log("선택 옵션 타입 정보 :", optionValueList);
                  
              console.log("옵션타입 길이 정보 :" , optionValueList.length);

              // 2차 카테고리 select 태그 참조
              let option_id = $(".optionValue");
              console.log("제조사정보", option_id.val())
              let optionStr = "";
                // <option value='10'>
				
			
             
                  
              for (let i = 0; i < optionValueList.length; i++) {
              optionStr += "<option value='" + optionValueList[i].option_id+ "'>"  +
              optionValueList[i].option_value+"</option>";
              
            }

            // console.log(optionStr);
            // 2차카테고리에 <option>태그들이 추가됨.
            option_id.append(optionStr); 
            });
          });
  		
      	 // 예시 사용법:
		  $("#itemForm").submit(function (event) {
		    // 기본 폼 제출 동작을 막음
		    event.preventDefault();
		  let optionsArray = [];

		    // 각 div에 대한 선택된 옵션을 가져옴
		    let optionsArray1 = getSelectedOptions("#option_1");
		    let optionsArray2 = getSelectedOptions("#option_2");
		    let optionsArray3 = getSelectedOptions("#option_3");
		    let optionsArray4 = getSelectedOptions("#option_4");
		    let optionsArray5 = getSelectedOptions("#option_5");

		    // 배열을 활용해 원하는 작업 수행, 여기서는 콘솔에 출력하는 예시
		    console.log("Options Array 1:", optionsArray1);
		    console.log("Options Array 2:", optionsArray2);
		    console.log("Options Array 3:", optionsArray3);
		    console.log("Options Array 4:", optionsArray4);
		    console.log("Options Array 5:", optionsArray5);
		  	

		  	optionsArray = [optionsArray1, optionsArray2, optionsArray3, optionsArray4, optionsArray5];
		  	let optionTypeIds = [];
		  	let optionCGIds = [];
		  	let optionIds = [];

			for (let i = 1; i <= 3; i++) {
		  	optionTypeIds.push(optionsArray[i][0]);
			}
			for (let i = 1; i <= 3; i++) {
			  	optionCGIds.push(optionsArray[i][1]);
				}
			for (let i = 1; i <= 3; i++) {
			  	optionIds.push(optionsArray[i][2]);
				}
			

		
		console.log("Option Type IDs:", optionTypeIds);
		console.log("Option CG IDs:", optionCGIds);
		console.log("Option IDs:", optionIds);
		
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

		
      
      

  $("#firstCategory").change(function() {
    let selectedCategory = $(this).val();
   
  	console.log("코드" , selectedCategory)
    // 스위치 문을 사용하여 1차 카테고리에 따라 다른 셀렉트 태그를 보여주거나 숨김
    
    
    switch (selectedCategory) {

      case "0": 
     	$("#option_1").hide();
      	$("#option_2").hide();
      	$("#option_3").hide();
      	$("#option_4").hide();
    	$("#option_5").hide();
          
        break;
      case "1":
        $("#option_1").show();
        $("#option_2").show();
        $("#option_3").show();
        $("#option_4").hide();
        $("#option_5").hide();
      
        break;
      case "2":
    	  $("#option_1").show();
          $("#option_2").hide();
          $("#option_3").hide();
          $("#option_4").hide();
          $("#option_5").hide();         
   		
        break;
      case "3":
    	  $("#option_1").show();
          $("#option_2").show();
          $("#option_3").show();
          $("#option_4").show();
          $("#option_5").show();
        break;
      case "4":
    	  $("#option_1").show();
          $("#option_2").hide();
          $("#option_3").hide();
          $("#option_4").hide();
          $("#option_5").hide();
        break;
      case "5":
    	  $("#option_1").show();
          $("#option_2").show();
          $("#option_3").hide();
          $("#option_4").hide();
          $("#option_5").hide();
        break;
      case "6":
    	  $("#option_1").show();
          $("#option_2").hide();
          $("#option_3").hide();
          $("#option_4").hide();
          $("#option_5").hide();
        break;
      case "7":
    	  $("#option_1").show();
          $("#option_2").hide();
          $("#option_3").hide();
          $("#option_4").hide();
          $("#option_5").hide();
        break;
      case "8":
    	  $("#option_1").show();
          $("#option_2").show();
          $("#option_3").hide();
          $("#option_4").hide();
          $("#option_5").hide();
        break;
      case "9":
    	  $("#option_1").show();
          $("#option_2").hide();
          $("#option_3").hide();
          $("#option_4").hide();
          $("#option_5").hide();
        break;
    }
  });


  

});
</script>

<%@include file="/WEB-INF/views/admin/comm/plugin2.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 관리자</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/jihye.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
<script>
	$(document).ready(function(){
		$("input[type='file']").change(function(){
			var name = $(this).attr("name");
			$("label[for='"+name+"']").css("width", "70px").css("background-color", "#F87E35").css("color","white");
			$("label[for='"+name+"']").text("첨부 완료");
		});
		
		
	});
</script>
</head>
<body class="admin" id="product_mng_regist">
	<!-- header -->
	<jsp:include page="../../header.jsp"></jsp:include>
	
	<div class="jihye_content">
	
	<!-- aside -->
	<jsp:include page="../admin.jsp"></jsp:include>
	
	<a href="product_mng_list.do" class="h2_user"><h2 class="txt">상품 관리</h2></a>
	<p class="mtitle">상품등록 ></p>
	<form name="product_regist_form" action="product_mng_regist_proc.do" method="POST" enctype="multipart/form-data">
		<table class="cs_table" id="admin_product_regist">
	      <tr>
	         <td>
	            <span><span class="red">*</span>카테고리</span>
	         </td>
	         <td>   
	            <select name="pcat" id="pcat">
	               <option>선택</option>
	               <option value="음식">음식</option>
	               <option value="악세사리">악세사리</option>
	               <option value="패션&잡화">패션&잡화</option>
	               <option value="인테리어 소품">인테리어 소품</option>
	               <option value="기타">기타</option>
	            </select>
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>작가 정보</span>
	         </td>
	         <td>    
	            <input type="text" name="sname" placeholder="작가명" id="sname">
	            <input type="text" name="semail" placeholder="작가 아이디" id="semail">
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>제목</span>
	         </td>
	         <td>    
	            <input type="text" name="ptitle" placeholder="제목을 입력해주세요 :)" id="ptitle">
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>내용</span>
	         </td>
	         <td>    
	            <textarea name="pcontent" id="pcontent" placeholder="내용을 입력해주세요(최대 1000자)"></textarea>
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>가격</span>
	         </td>
	         <td>    
	            <input type="text" name="pprice" placeholder="가격을 입력해주세요 :)" id="pprice">
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>옵션</span>
	         </td>
	         <td>    
	            <input type="text" name="opt1" id="opt1" placeholder="상품명을 입력해주세요 :)">
	            <input type="text" name="opt1_price" id="opt1_price" placeholder="추가 금액" class="add_price">
	            <input type="text" name="opt2" id="opt2" placeholder="상품명을 입력해주세요 :)">
	            <input type="text" name="opt2_price" id="opt2_price" placeholder="추가 금액" class="add_price" value=0>
	            <input type="text" name="opt3" id="opt3" placeholder="상품명을 입력해주세요 :)">
	            <input type="text" name="opt3_price" id="opt3_price" placeholder="추가 금액" class="add_price" value=0>
	            <input type="text" name="opt4" id="opt4" placeholder="상품명을 입력해주세요 :)">
	            <input type="text" name="opt4_price" id="opt4_price" placeholder="추가 금액" class="add_price" value=0>
	            <input type="text" name="opt5" id="opt5" placeholder="상품명을 입력해주세요 :)">
	            <input type="text" name="opt5_price" id="opt5_price" placeholder="추가 금액" class="add_price" value=0>
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span class="board_title"><span class="red">*</span>파일첨부</span>
	         </td>
	         <td>
	         	<div>
	        		<label for="file1" id="label_bfile1" class='btn_style'>파일 선택</label>   
	            	<input name="file1" type="file" id="file1">
	            </div>
	            <div>
	        		<label for="file2" class='btn_style'>파일 선택</label>   
	            	<input name="file2" type="file" id="file2">
	            </div>
	            <div>
	        		<label for="file3" class='btn_style'>파일 선택</label>   
	            	<input name="file3" type="file" id="file3">
	            </div>
	            <div>
	        		<label for="file4" class='btn_style'>파일 선택</label>   
	            	<input name="file4" type="file" id="file4">
	            </div>
	            <div>
	        		<label for="file5" class='btn_style'>파일 선택</label>   
	            	<input name="file5" type="file" id="file5">
	            </div>
	            <div>
	        		<label for="file6" class='btn_style'>파일 선택</label>   
	            	<input name="file6" type="file" id="file6">
	            </div>
	            <div>
	        		<label for="file7" class='btn_style'>파일 선택</label>   
	            	<input name="file7" type="file" id="file7">
	            </div>
	            <div>
	        		<label for="file8" class='btn_style'>파일 선택</label>   
	            	<input name="file8" type="file" id="file8">
	            </div>
	         </td>
	      </tr>
	      <tr>
	         <td colspan="2">
	            <button type="button" id="product_regist_btn" class="btn_style">작성</button>
	            <a href="product_mng_list.do"><button type="button" class="btn_style">취소</button></a>
	         </td>
	      </tr>
	   </table>
   </form>
   </div>
   
   <jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>
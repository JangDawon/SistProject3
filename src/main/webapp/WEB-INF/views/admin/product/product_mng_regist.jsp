<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 관리자</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/jihye.css">
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
</head>
<body id="product_mng_regist">
	
	<!-- aside -->
	<jsp:include page="../admin.jsp"></jsp:include>
	
	<a href="product_mng_list.do" class="h2_user"><h2 class="txt">상품 관리</h2></a>
	<p>상품등록</p>
	<form name="product_regist_form" action="#" method="GET">
		<table class="cs_table" id="admin_product_regist">
	      <tr>
	         <td>
	            <span><span class="red">*</span>카테고리</span>
	         </td>
	         <td>   
	            <select name="pcat" id="pcat">
	               <option>선택</option>
	               <option value="food">음식</option>
	               <option value="accessory">악세사리</option>
	               <option value="living">패션&잡화</option>
	               <option value="interior">인테리어 소품</option>
	               <option value="etc">기타</option>
	            </select>
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>작가 정보</span>
	         </td>
	         <td>    
	            <input type="text" name="sname" placeholder="작가명" id="sname">
	            <input type="text" name="sid" placeholder="작가 아이디" id="sid">
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
	            <textarea name="bcontent" placeholder="내용을 입력해주세요(최대 1000자)"></textarea>
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>가격</span>
	         </td>
	         <td>    
	            <input type="text" name="ptitle" placeholder="가격을 입력해주세요 :)" id="ptitle">
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>배송비 무료</span>
	         </td>
	         <td>    
	            <input type="text" name="dprice" id="dprice" placeholder="가격을 입력해주세요 :)">
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
	            <input type="text" name="opt2_price" id="opt2_price" placeholder="추가 금액" class="add_price">
	            <input type="text" name="opt3" id="opt3" placeholder="상품명을 입력해주세요 :)">
	            <input type="text" name="opt3_price" id="opt3_price" placeholder="추가 금액" class="add_price">
	            <input type="text" name="opt4" id="opt4" placeholder="상품명을 입력해주세요 :)">
	            <input type="text" name="opt4_price" id="opt4_price" placeholder="추가 금액" class="add_price">
	            <input type="text" name="opt5" id="opt5" placeholder="상품명을 입력해주세요 :)">
	            <input type="text" name="opt5_price" id="opt5_price" placeholder="추가 금액" class="add_price">
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span class="board_title"><span class="red">*</span>파일첨부</span>
	         </td>
	         <td>
	         	<div>
	        		<label for="bfile1" class='btn_style'>파일 선택</label>   
	            	<input name="bfile1" type="file" id="bfile1">
	            </div>
	            <div>
	        		<label for="bfile2" class='btn_style'>파일 선택</label>   
	            	<input name="bfile2" type="file" id="bfile2">
	            </div>
	            <div>
	        		<label for="bfile3" class='btn_style'>파일 선택</label>   
	            	<input name="bfile3" type="file" id="bfile3">
	            </div>
	            <div>
	        		<label for="bfile4" class='btn_style'>파일 선택</label>   
	            	<input name="bfile4" type="file" id="bfile4">
	            </div>
	            <div>
	        		<label for="bfile5" class='btn_style'>파일 선택</label>   
	            	<input name="bfile5" type="file" id="bfile5">
	            </div>
	            <div>
	        		<label for="bfile6" class='btn_style'>파일 선택</label>   
	            	<input name="bfile6" type="file" id="bfile6">
	            </div>
	            <div>
	        		<label for="bfile7" class='btn_style'>파일 선택</label>   
	            	<input name="bfile7" type="file" id="bfile7">
	            </div>
	            <div>
	        		<label for="bfile8" class='btn_style'>파일 선택</label>   
	            	<input name="bfile8" type="file" id="bfile8">
	            </div>
	         </td>
	      </tr>
	      <tr>
	         <td colspan="2">
	            <a href="product_mng_list.do"><button type="submit" class="btn_style">작성</button></a>
	            <a href="product_mng_list.do"><button type="button" class="btn_style">취소</button></a>
	         </td>
	      </tr>
	   </table>
   </form>
</body>
</html>
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
</head>
<body class="admin" id="product_mng_update">
	<!-- header -->
	<jsp:include page="../../header.jsp"></jsp:include>
	
	<div class="jihye_content">
	
	<!-- aside -->
	<jsp:include page="../admin.jsp"></jsp:include>
	
	<a href="product_mng_list.do" class="h2_user"><h2 class="txt">상품 관리</h2></a>
	<p class="mtitle">상품수정 ></p>
	<form name="product_update_form" action="#" method="GET">
		<table class="cs_table" id="admin_product_update">
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
	            <input type="text" name="sname" placeholder="작가명" id="sname" value="321팩토리 321factory">
	            <input type="text" name="sid" placeholder="작가 아이디" id="sid" value="321factory">
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>제목</span>
	         </td>
	         <td>    
	            <input type="text" name="ptitle" placeholder="제목을 입력해주세요 :)" id="ptitle" value="1+1🔥블랙아이보리 클로버 나비 마스크스트랩/목걸이">
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>내용</span>
	         </td>
	         <td>    
	            <textarea name="pcontent" id="pcontent" placeholder="내용을 입력해주세요(최대 1000자)">🔥포장안내 필독!!🔥
	기본포장은 제품 6개까지 오목상자 하나에 다 넣어서 포장됩니다.
	개별포장을 원하시는 분들은 꼭
	요청사항에 적어주세요
	요청사항에 안적혀있으면
	기본포장 합포장으로 발송됩니다.
	
	🔥미리블랙프라이데이🔥1+1 9900 특가 이벤트🔥
	
	*옵션선택방법*
	예) 아이보리나비와 블랙클로버 디자인 구매를
	원할 시
	디자인1. 옵션에서 아이보리나비를 선택해주시고
	디자인2. 옵션에서 블랙클로버를 선택해주세요.
	
	원래 개별 판매가보다
	하나 당 950원씩 다운된 가격이기때문에
	두개에 1900원이 절감됩니다.
	최저마진 금액이니
	예쁜 디자인의 마스크스트랩을
	착한 가격에 두개 득템하세용❤️</textarea>
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>가격</span>
	         </td>
	         <td>    
	            <input type="text" name="pprice" placeholder="가격을 입력해주세요 :)" id="pprice" value="17800">
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>배송비 무료</span>
	         </td>
	         <td>    
	            <input type="text" name="pdelivery" id="pdelivery" placeholder="가격을 입력해주세요 :)" value="40000">
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>옵션</span>
	         </td>
	         <td>    
	            <input type="text" name="opt1" id="opt1" placeholder="상품명을 입력해주세요 :)" value="블랙심플">
	            <input type="text" name="opt1_price" id="opt1_price" placeholder="추가 금액" class="add_price" value="0">
	            <input type="text" name="opt2" id="opt2" placeholder="상품명을 입력해주세요 :)" value="아이보리심플">
	            <input type="text" name="opt2_price" id="opt2_price" placeholder="추가 금액" class="add_price" value="0">
	            <input type="text" name="opt3" id="opt3" placeholder="상품명을 입력해주세요 :)" value="블랙클로버">
	            <input type="text" name="opt3_price" id="opt3_price" placeholder="추가 금액" class="add_price" value="2000">
	            <input type="text" name="opt4" id="opt4" placeholder="상품명을 입력해주세요 :)" value="아이보리클로버">
	            <input type="text" name="opt4_price" id="opt4_price" placeholder="추가 금액" class="add_price" value="2000">
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
	            <button type="button" id="product_update_btn" class="btn_style">수정</button>
	            <a href="product_mng_list.do"><button type="button" class="btn_style">취소</button></a>
	         </td>
	      </tr>
	   </table>
	</form>
	</div>
	
	<jsp:include page="../../footer.jsp"></jsp:include>
</body>
</html>
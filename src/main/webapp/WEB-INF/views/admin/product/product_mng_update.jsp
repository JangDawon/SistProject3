<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 관리자</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
<script>
	$(document).ready(function(){
		file();
		function file(){
			for(var i=1; i<9; i++){
				if($("label[for=file"+i+"]").attr("id") != ""){
					$("label[for=file"+i+"]").css("width", "70px").css("background-color", "#F87E35").css("color","white");
					$("label[for=file"+i+"]").text("첨부 완료");
				}
			}
		}
		
		$("input[type='file']").change(function(){
			var name = $(this).attr("name");
			$("label[for='"+name+"']").css("width", "70px").css("background-color", "#F87E35").css("color","white");
			$("label[for='"+name+"']").text("첨부 완료");
		})
	});
</script>
</head>
<body class="admin" id="product_mng_update">
	<!-- header -->
	<jsp:include page="../../header.jsp"></jsp:include>
	
	<div class="jihye_content">
	
	<!-- aside -->
	<jsp:include page="../admin.jsp"><jsp:param name="psfile" value="${psfile }" /></jsp:include>
	
	<a href="product_mng_list.do" class="h2_user"><h2 class="txt">상품 관리</h2></a>
	<p class="mtitle">상품수정 ></p>
	<form name="product_update_form" action="product_mng_update_proc.do" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="pid" value="${vo.pid }">
		<table class="cs_table" id="admin_product_update">
	      <tr>
	         <td>
	            <span><span class="red">*</span>카테고리</span>
	         </td>
	         <td>   
	            <select name="pcat" id="pcat">
	               <option>선택</option>
	               <option value="음식" <c:if test="${vo.pcat eq '음식' }"><c:out value="selected" /></c:if>>음식</option>
	               <option value="악세사리" <c:if test="${vo.pcat eq '악세사리' }"><c:out value="selected" /></c:if>>악세사리</option>
	               <option value="패션&잡화" <c:if test="${vo.pcat eq '패션&잡화' }"><c:out value="selected" /></c:if>>패션&잡화</option>
	               <option value="인테리어 소품" <c:if test="${vo.pcat eq '인테리어 소품' }"><c:out value="selected" /></c:if>>인테리어 소품</option>
	               <option value="기타" <c:if test="${vo.pcat eq '기타' }"><c:out value="selected" /></c:if>>기타</option>
	            </select>
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>작가 정보</span>
	         </td>
	         <td>    
	            <input type="text" name="sname" placeholder="작가명" id="sname" value="${vo.sname }">
	            <input type="text" name="semail" placeholder="작가 아이디" id="semail" value="${vo.semail }">
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>제목</span>
	         </td>
	         <td>    
	            <input type="text" name="ptitle" placeholder="제목을 입력해주세요 :)" id="ptitle" value="${vo.ptitle }">
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>내용</span>
	         </td>
	         <td>    
	            <textarea name="pcontent" id="pcontent" placeholder="내용을 입력해주세요(최대 1000자)">${vo.pcontent }</textarea>
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>가격</span>
	         </td>
	         <td>    
	            <input type="text" name="pprice" placeholder="가격을 입력해주세요 :)" id="pprice" value="${vo.pprice }">
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span><span class="red">*</span>옵션</span>
	         </td>
	         <td>    
	            <input type="text" name="opt1" id="opt1" placeholder="상품명을 입력해주세요 :)" value="${vo.opt1 }">
	            <input type="text" name="opt1_price" id="opt1_price" placeholder="추가 금액" class="add_price" value="${vo.opt1_price }">
	            <input type="text" name="opt2" id="opt2" placeholder="상품명을 입력해주세요 :)" value="${vo.opt2 }">
	            <input type="text" name="opt2_price" id="opt2_price" placeholder="추가 금액" class="add_price" value="${vo.opt2_price }">
	            <input type="text" name="opt3" id="opt3" placeholder="상품명을 입력해주세요 :)" value="${vo.opt3 }">
	            <input type="text" name="opt3_price" id="opt3_price" placeholder="추가 금액" class="add_price" value="${vo.opt3_price }">
	         </td>
	      </tr>
	      <tr>
	         <td>
	            <span class="board_title"><span class="red">*</span>파일첨부</span>
	         </td>
	         <td>
	         	<div>
	         		<label for="file1" class='btn_style' id="${vo.pfile1 }">파일 선택</label>
	            	<input name="file1" type="file" id="file1">
	            </div>
	            <div>
	        		<label for="file2" class='btn_style' id="${vo.pfile2 }">파일 선택</label>   
	            	<input name="file2" type="file" id="file2">
	            </div>
	            <div>
	        		<label for="file3" class='btn_style' id="${vo.pfile3 }">파일 선택</label>   
	            	<input name="file3" type="file" id="file3">
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
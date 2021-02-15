<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 마이페이지</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/woohyun.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/am-pagination.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/am-pagination.js"></script>
<script>
	   
	$(document).ready(function(){
		
		<c:if test="${!empty result}">
	      alert("${result}");
	   </c:if>
		
		var pager = jQuery("#ampaginationsm").pagination({
			maxSize : 5,
			totals : "${dbCount}",
			pageSize : "${pageSize}",
			page : "${reqPage}",
			
			lastText : '&raquo;&raquo;',
			firstText : '&laquo;&laquo;',
			prevText : '&laquo;',
			nextText : '&raquo;',
			
			btnSize : 'sm'
		});
		
		jQuery("#ampaginationsm").on('am.pagination.change', function(e){
			$(location).attr('href','http://localhost:9000/sistproject3/my_order.do?rpage=' + e.page);
		});
	});
</script>
<style>


td.img_td{
border:1px solid red;
text-align:center;}
</style>

</head>
<body>
<!-- aside -->
	<jsp:include page="../header.jsp" />
	

	<div class="mypage_content">
		<!-- aside -->
		<jsp:include page="mypage_aside.jsp"><jsp:param name="psfile" value="${psfile }" /></jsp:include>
	<h2>주문 내역</h2>
	<c:forEach var="vo" items="${list}">
	<table class="my_order">
	<tr>
	<td>
		<input type="hidden" name="uemail" value="${vo.uemail }">
		<input type = "hidden" name = "pid" value = "${vo.pid }">
		<input type = "hidden" name = "oid" value = "${vo.oid}">
		</td></tr>
		<tr>
			
			<td class = "date_td" height = "40"colspan=2>${vo.rdate }</td>
			<td colspan=2>${(vo.pprice+vo.opt1_price)*vo.opt1_qty+(vo.pprice+vo.opt2_price)*vo.opt2_qty+(vo.pprice+vo.opt3_price)*vo.opt3_qty}원</td>
		</tr>

		<tr>
			<td width = 120 class = "img_td"rowspan=2><img class = "p_img" src="http://localhost:9000/sistproject3/resources/upload/${vo.psfile1 }"></td>
			<td width ="300"class = "title_td"rowspan=2><b>${vo.ptitle }</b><br><span class = "prdt_option">${vo.opt1 }${vo.opt1_qty },${vo.opt2 }${vo.opt2_qty },${vo.opt3 }${vo.opt3_qty }</span></td>
			<td width="100"><a href="review_write.do?pid=${vo.pid}&oid=${vo.oid}" onclick = "window.open(this.href, '_blank',' width=460,height= 550,  left=800 top =150 resizeable=no'); return false"><span class = "write_button">리뷰쓰기</span></a></td>
			<td width ="100"><a href = "orderCancelProc.do?oid=${vo.oid}"><button type  ="submit" id = "cancelBtn" class="cancelBtn" >주문취소</button></a></td>
		</tr>
	</table>
	</c:forEach>
	<div class = "order_paging"><div id="ampaginationsm"></div></div>
			</div>

		<jsp:include page="../footer.jsp" />
</body>
</html>
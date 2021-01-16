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
<body id="product_mng_content">	
	
	<!-- aside -->
	<jsp:include page="../admin.jsp"></jsp:include>
	
	<a href="product_mng_list.do" class="h2_user"><h2 class="txt">상품 관리</h2></a>
	<table class="cs_table" id="admin_product_content">
		<tr>
			<th>제목</th>
			<td colspan="3">1+1🔥블랙아이보리 클로버 나비 마스크스트랩/목걸이</td>
		</tr>
		<tr>
			<th>작가명</th>
			<td>321팩토리 321factory</td>
			<th>등록일</th>
			<td>2021.01.16</td>
		</tr>
		<tr>
			<th>배송</th>
			<td colspan="3">40000원 이상 구매시 무료배송</td>
		</tr>
		<tr>
			<td colspan="4"><div>🔥포장안내 필독!!🔥
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
	착한 가격에 두개 득템하세용❤️
				<br><img src="http://localhost:9000/sistproject3/images/content2.jpg" style="height:100px; height:100px;">
				<img src="http://localhost:9000/sistproject3/images/content2.jpg" style="height:100px; height:100px;">
				<img src="http://localhost:9000/sistproject3/images/content2.jpg" style="height:100px; height:100px;">
				<img src="http://localhost:9000/sistproject3/images/content2.jpg" style="height:100px; height:100px;">
				<img src="http://localhost:9000/sistproject3/images/content2.jpg" style="height:100px; height:100px;">
			</div>
			</td>
		</tr>
		<tr>
			<th>옵션</th>
			<td colspan="3">
			<div>블랙심플</div>
			<div>아이보리심플</div>
			<div>블랙클로버(+2000)</div>
			<div>아이보리클로버(+2000)</div>
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<a href="product_mng_update.do"><button type="button" class="btn_style" id="product_update">수정</button></a>
				<a href="product_mng_list.do"><button type="button" class="btn_style" id="product_cancel">취소</button></a>
			</td>
		</tr>
	</table>
</body>
</html>
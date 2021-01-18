<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		* { margin:0px; padding:0px; font-family:"나눔바른고딕";		
	}
	footer{ 
		clear:both;
		background-color:rgb(253,252,240); padding-top:50px;
	}
	footer > div.top {
		width:100%; height:180px;
		background-color:rgb(255,236,198); 		
		text-align:center;
		margin-top:60px;
	}
	footer > div.top > img {
		margin-top : -60px;
	}
	footer > div.bg {
		width:100%; height:113px;
		background-image:url("http://localhost:9000/MyCGV/images/footer_img01.png");
		clear:both;
		border:1px solid red;
	}
	footer>nav>ul>li {
		display:inline-block;
	}
	footer>nav>ul>li>a {		
		text-decoration:none;
		font-size:13px;
		font-weight:bold;
		color:#333;	
		padding:0 8px 0 3px;	
	}
	footer>nav>ul>li>div {
		background-color:gray;
		width:1px; height:10px;
		display:inline-block;
	} 
	footer>nav {		
		padding:20px 0;
		text-align:center;
	}
	footer>div.info {
		width:1000px; margin:auto;
	}
	footer>div.info > img {
		float:left;
		padding:15px 20px;
	}
	footer>div.info > div {
		font-size:13px;
		padding:5px 5px;
	}
</style>
</head>
<body>
<footer>
		<div class="top">
			<img src="http://localhost:9000/MyCGV/images/B_980x240.png"></div>
		<nav>
			<ul>
				<li><a href="#">회사소개</a><div></div></li>
				<li><a href="#">IR</a><div></div></li>
				<li><a href="#">채용정보</a><div></div></li>
				<li><a href="#">광고/프로모션문의</a><div></div></li>
				<li><a href="#">제휴문의</a><div></div></li>
				<li><a href="#">출점문의</a><div></div></li>
				<li><a href="#">이용약관</a><div></div></li>
				<li><a href="#">편성기준</a><div></div></li>
				<li><a href="#">개인정보처리방침</a><div></div></li>
				<li><a href="#">법적고지</a><div></div></li>
				<li><a href="#">이메일주소무단수집거부</a><div></div></li>
				<li><a href="#">상생경영</a><div></div></li>
				<li><a href="#">사이트맵</a></li>
			</ul>
		</nav>
		<div class="info">
			<img src="http://localhost:9000/MyCGV/images/footer_logo.jpg">
			<div>(04377)서울특별시 용산구 한강대로 23길 55, 아이파크몰 6층(한강로동)</div>
			<div>대표이사 : 최병환사업자등록번호 : 104-81-45690통신판매업신고번호 : 2017-서울용산-0662 사업자정보확인</div>
			<div>호스팅사업자 : CJ올리브네트웍스개인정보보호 책임자 : 이동현대표이메일 : cjcgvmaster@cj.netCGV고객센터 : 1544-1122</div>
		</div>
		<div class="bg"></div>
	</footer>	
</body>
</html>
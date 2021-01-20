<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>작가 홈 | 아이디어스</title>
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
	</head>
	<body class="artist">
		<!-- header -->
		<jsp:include page="../header.jsp" />
		
		<section class="artist_home">
			<!-- aside -->
		 	<jsp:include page="artist_menu.jsp" />
	 	
			<div class="artist_main">
				<h3>판매중인 작품</h3>
			</div>
		</section>
		
		
		
		<!-- footer -->
		<jsp:include page="../footer.jsp" />
	</body>
</html>

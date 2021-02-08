<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Idus - ErrorPage</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>메인페이지</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp" />
	
	<!-- content -->
	<div class="error_content">
		<section class="error">
			<div>
				<ul>
					<li>
						<div>예기치 못한 오류가 발생했습니다 :( </div>
						<img src ="http://localhost:9000/sistproject3/images/error.png">
					</li>
					<li>
						<a href="http://localhost:9000/sistproject3/index.do"><button type="button" class="btn_style">메인</button></a>
					</li>
				</ul>
			</div>
		</section>
	</div>
	
	<!-- footer -->
	<jsp:include page="footer.jsp" />
</body>
</html>
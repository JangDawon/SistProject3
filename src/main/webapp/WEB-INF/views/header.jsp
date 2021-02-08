<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
</head>
<body class="header_body">
   <header>
      <nav class="navbar">
         <div class="navbar1">   
            <c:choose>
            <c:when test="${sessionScope.svo ne null}"> 
            <ul>
               <li><a href="#">안녕하세요~ ${sessionScope.svo.uname}님!!</a></li>
               <li><a href="http://localhost:9000/sistproject3/logout.do">로그아웃</a><div></div></li>
               <li><a href="http://localhost:9000/sistproject3/cs.do">고객센터</a><div></div></li>
			   <c:if test="${sessionScope.svo.uemail eq 'admin' }">
               <li><a href="http://localhost:9000/sistproject3/user_mng_list.do">Admin</a></li>
               </c:if>
            </ul>
            </c:when>
            <c:otherwise>
            <div class="navbar1_wrapper">
               <ul class="navbar_menu">
                  <li><a href="http://localhost:9000/sistproject3/login.do">로그인</a></li>
                  <li><a href="http://localhost:9000/sistproject3/join_choice.do">회원가입</a></li>
                  <li><a href="http://localhost:9000/sistproject3/cs.do">고객센터</a></li>
                  <li><a href="http://localhost:9000/sistproject3/user_mng_list.do">admin</a></li>
               </ul>
         	</div>
            </c:otherwise>
            </c:choose>
         </div>      
      
         <div class="navbar2">
            <div class="navbar2_wrapper">
               <div class="navbar_logo">
                  <a href="http://localhost:9000/sistproject3/index.do">
                  <img src="http://localhost:9000/sistproject3/images/logo.png"></a>
               </div>
               <div class="navbar_search">
                  <input type="text" name="se" id="header_search" placeholder="검색어를 입력해주세요.">
                  <button type="button" id="search_btn">
                  <img src="http://localhost:9000/sistproject3/images/search.png"></button>
               </div>
               <ul class="navbar_icons">
                  <li><a href="http://localhost:9000/sistproject3/mypage.do">
                  	<img src="http://localhost:9000/sistproject3/images/user.png"></a>
                  </li>
                  <li><a href="http://localhost:9000/sistproject3/cart_list.do">
                  	<img src="http://localhost:9000/sistproject3/images/cart.png"></a>
                  </li>
               </ul>
            </div>
         </div>
         <div class="navbar3">
            <div class="navbar3_wrapper">
               <ul class="navbar_category" id="c_test1">
                  <li><a href="http://localhost:9000/sistproject3/category_list.do?pcat=음식">음식</a></li>
                  <li><a href="http://localhost:9000/sistproject3/category_list.do?pcat=악세사리">악세사리</a></li>
                  <li><a href="http://localhost:9000/sistproject3/category_list.do?pcat=패션, 잡화">패션&잡화</a></li>
                  <li><a href="http://localhost:9000/sistproject3/category_list.do?pcat=인테리어 소품">인테리어 소품</a></li>
                  <li><a href="http://localhost:9000/sistproject3/category_list.do?pcat=기타">기타</a></li>
                  <li><a href="http://localhost:9000/sistproject3/product_best.do?pcat=total">인기 작품</a></li>
                  <li><a href="http://localhost:9000/sistproject3/product_new.do">최신 작품</a></li>
                  <li><a href="http://localhost:9000/sistproject3/artist_best.do">인기 작가</a></li>
               </ul>
            </div>
         </div>
      </nav>
   </header>
</body>
</html>
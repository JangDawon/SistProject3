<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://localhost:9000/sistproject3/images/logo.jpg"><title>아이디어스 - 고객센터</title>
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/jihye.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/sistproject3.css">
<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/am-pagination.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
<script src="http://localhost:9000/sistproject3/js/am-pagination.js"></script>
<script>
	$(document).ready(function(){
		//페이지 번호 및 링크
		var pager = jQuery("#ampaginationsm").pagination({
			maxSize : 5,
			totals : '${dbCount}',
			pageSize : '${pageSize}',
			page : '${ reqPage }',
			
			lastText : '&raquo;&raquo;',
			firstText : '&laquo;&laquo;',
			prevText : '&laquo;',
			nextText : '&raquo;',
			
			btnSize : 'sm'
		});
		
		//
		jQuery("#ampaginationsm").on('am.pagination.change', function(e){
			//$(location).attr('href','페이지 이름');	//location.href();
			$(location).attr('href','http://localhost:9000/sistproject3/cs.do?rpage=' + e.page);
		});
		
		
		$(".cs_row").click(function(){
			
			var sub_menu = $(this).next("tr.cs_hide");
			
			$("tr.cs_hide").css("background", "#F5F5F5").css("height", "250px");
			$("div.cs_hide_content").css("margin-left", "-50px");
			$("span.cs_hide_title").css("font-size", "16px").css("weight", "800");
			$("span.red").css("color", "red").css("margin-right", "5px");
			$("input.cs_hide_pw").css("width", "250px").css("height", "30px").css("margin", "0px 30px").css("border", "none").css("text-indent", "10px");
			$("button.cs_hide_btn").css("height", "30px").css("background-color", "#F87E35").css("border-radius","2px");
			$("button.cs_hide_btn").css("color", "white").css("border","none").css("width","70px");
			
			/* $(this).next("tr").toggleClass("cs_hide"); */
			
			if( sub_menu.is(":visible") ){
                sub_menu.slideUp();
            }else{
                sub_menu.slideDown();
            }

		});
		
		$(".cs_hide_btn").click(function(){
			var now = $(this).attr("id");
			var pw_id = "#cs_hide_"+now;
			var pass = "#cs_pw_"+now;
			
			if($(pw_id).val() == ""){
				alert("비밀번호를 입력해주세요:) ");
				$(pw_id).focus();
				return false;
			}else if($(pass).val() != $(pw_id).val()){
				alert("비밀번호가 일치하지 않습니다 :( ");
				$(pw_id).focus();
				return false;
			}else{
				location.href="http://localhost:9000/sistproject3/cs_content.do?id="+now;
			}
		});
		
	});
</script>
</head>
<body id="cs_board"> 
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="jihye_content">
	<!-- content -->
	<h2 class="txt">공지사항 및 1:1문의</h2>
	<div id="cs_search">
		<select id="sname">
			<option value="all">전체</option>
			<option value="btitle">제목</option>
			<option value="bcontent">내용</option>
			<option value="user_id">아이디</option>
			<option value="name">작성자</option>
		</select>
		<input type="text" id="svalue" placeholder="검색할 단어를 입력해주세요 :)">
		<button type="button" id="search_btn" class="btn_style">검색</button>
	</div>
	<table id="cs_list_table" class="cs_table">
		<tr>
			<td colspan='2'><span id='cs_count'>게시글 ${total }개</span></td>
			<td colspan='3'><a href="cs_write.do"><button type="button" id="cs_write_btn" class="btn_style">글쓰기</button></a></td>
		</tr>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="vo" items="${list }">
		<c:choose>
			<c:when test="${vo.bsecret eq 'on'}">
				<tr class="cs_row" id="cs_row1">
					<td>${vo.rno }</td>
					<td>${vo.btitle }</td>
					<td>${vo.uname }</td>
					<td>${vo.bdate }</td>
					<td>${vo.bhits }</td>
				</tr>
				<tr class="cs_hide">
					<td colspan='5'>
						<div class="cs_hide_content" id="cs_hide_content">
							<span class="cs_hide_title"><span class="red">*</span>비밀번호</span>
							<input type='password' id="cs_hide_${vo.bid}" class="cs_hide_pw" placeholder="비밀번호를 입력해주세요:)">
							<input type="hidden" id="cs_pw_${vo.bid}" value="${vo.bpass }">
							<button type='button' class="cs_hide_btn" id="${vo.bid }">확인</button>
						</div>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr class="cs_row" id="cs_row1" onclick="location.href='http://localhost:9000/sistproject3/cs_content.do?id=${vo.bid}'">
					<td>${vo.rno }</td>
					<td>${vo.btitle }</td>
					<td>${vo.uname }</td>
					<td>${vo.bdate }</td>
					<td>${vo.bhits }</td>
				</tr>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		<tr>
			<td colspan="5"><div id="ampaginationsm"></div></td>
		</tr>
	</table>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
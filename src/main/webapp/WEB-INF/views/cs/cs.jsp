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
		cs_list('all', '', '');
		
		function page(dbCount, pageSize, reqPage){
			//페이지 번호 및 링크
			var pager = jQuery("#ampaginationsm").pagination({
				maxSize : 5,
				totals : dbCount,
				pageSize : pageSize,
				page : reqPage,
				
				lastText : '&raquo;&raquo;',
				firstText : '&laquo;&laquo;',
				prevText : '&laquo;',
				nextText : '&raquo;',
				
				btnSize : 'sm'
			});
			
			jQuery("#ampaginationsm").on('am.pagination.change', function(e){
				/* $(location).attr('href','http://localhost:9000/sistproject3/cs.do?rpage=' + e.page); */
				cs_list($("#sname").val(), $("#svalue").val(), e.page)
			});
		}
		
		$(document).on("click",".cs_row",function(){
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
		
		$(document).on("click",".cs_hide_btn",function(){
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
				
		$("#cs_search_btn").click(function(){
			if($("#svalue").val() == ""){
				alert("검색할 단어를 입력해주세요 :)");
				$("#svalue").focus();
				return false;
			}else{
				var sname = $("#sname").val();
				var svalue = $("#svalue").val();
				
				cs_list(sname, svalue, "");
			}
		});		
	
		function cs_list(sname, svalue, rpage){
			$.ajax({
				url:"cs_search.do?sname=" + sname + "&svalue=" + svalue + "&rpage=" + rpage,
				success:function(result){
					var jdata = JSON.parse(result);
					
					//결과를 출력
					var output = '';
					for(var i in jdata.jlist){ 
						if(jdata.jlist[i].bsecret == 'on'){
							output += '<tr class="cs_row" id="cs_row1">';
							output += '<td>' + jdata.jlist[i].rno + '</td>';
							output += '<td> 🔑 ' + jdata.jlist[i].btitle + '</td>';
							output += '<td>' + jdata.jlist[i].uname + '</td>';
							output += '<td>' + jdata.jlist[i].bdate + '</td>';
							output += '<td>' + jdata.jlist[i].bhits + '</td>';
							output += '</tr>';
							output += '<tr class="cs_hide">';
							output += '<td colspan="5">';
							output += '<div class="cs_hide_content" id="cs_hide_content">';
							output += '<span class="cs_hide_title"><span class="red">*</span>비밀번호</span>';
							output += '<input type="password" id="cs_hide_' + jdata.jlist[i].bid + '" class="cs_hide_pw" placeholder="비밀번호를 입력해주세요:)">';
							output += '<input type="hidden" id="cs_pw_' + jdata.jlist[i].bid + '" value="' + jdata.jlist[i].bpass +'">';
							output += '<button type="button" class="cs_hide_btn" id="'+ jdata.jlist[i].bid +'">확인</button>';
							output += '</div>';
							output += '</td>';
							output += '</tr>';
						}else{
							if(jdata.jlist[i].uname == '관리자'){
								var url = "location.href='http://localhost:9000/sistproject3/cs_content.do?id=" + jdata.jlist[i].bid + "'";
								output += '<tr class="cs_row" id="cs_row1" onclick="' + url +'">';
								output += '<th>' + jdata.jlist[i].rno + '</th>';
								output += '<th><span class="orange">[공지사항]</span> ' + jdata.jlist[i].btitle + '</th>';
								output += '<th>' + jdata.jlist[i].uname + '</th>';
								output += '<th>' + jdata.jlist[i].bdate + '</th>';
								output += '<th>' + jdata.jlist[i].bhits + '</th>';
								output += '</tr>';
							}else{
								var url = "location.href='http://localhost:9000/sistproject3/cs_content.do?id=" + jdata.jlist[i].bid + "'";
								output += '<tr class="cs_row" id="cs_row1" onclick="' + url +'">';
								output += '<td>' + jdata.jlist[i].rno + '</td>';
								output += '<td>' + jdata.jlist[i].btitle + '</td>';
								output += '<td>' + jdata.jlist[i].uname + '</td>';
								output += '<td>' + jdata.jlist[i].bdate + '</td>';
								output += '<td>' + jdata.jlist[i].bhits + '</td>';
								output += '</tr>';
							}
						}
					} 
					
					output += '<tr id="cs_paging"><td colspan="6"><div id="ampaginationsm"></div></td></tr>';
					
					$(".cs_row").remove();
					$("#cs_paging").remove();
					$("#dbCount").text("").append(jdata.dbCount);
					$("#cs_ajax_here").after(output);
					
					
					page(jdata.dbCount, jdata.pageSize, jdata.reqPage);
				}
			});
		}
		
		
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
			<option value="uemail">아이디</option>
			<option value="uname">작성자</option>
		</select>
		<input type="text" id="svalue" placeholder="검색할 단어를 입력해주세요 :)">
		<button type="button" id="cs_search_btn" class="btn_style">검색</button>
	</div>
	<table id="cs_list_table" class="cs_table">
		<tr>
			<td colspan='2'><span id='cs_count'>게시글 <span id="dbCount"></span>개</span></td>
			<td colspan='3'><a href="cs_write.do"><button type="button" id="cs_write_btn" class="btn_style">글쓰기</button></a></td>
		</tr>
		<tr id="cs_ajax_here">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</table>
	</div>
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
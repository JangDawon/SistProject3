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
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script src="http://localhost:9000/sistproject3/js/jihye.js"></script>
<script>
	$(document).ready(function(){
		reply_list_ajax();
		
		$(document).on("click","#reply_write_btn",function(){
			if($("#r_content").val() == ""){
				alert("내용을 입력해주세요 :) ");
				$("#r_content").focus();
				return false;
			}else{
				$.ajax({
					url:"cs_reply_write.do?uemail=${sessionScope.svo.uemail}&uname=${sessionScope.svo.uname}&bid=${vo.bid}&rcontent=" + $("#r_content").val() + "&rsfile=${psfile}",
					success:function(result){
						if(result == 1) {
							alert("작성이 완료되었습니다:) ");
							$("#r_content").val("");
							reply_list_ajax();
						}
					}
				});
				
			}
		});
		
		$(document).on("click",".r_update_btn",function(){
			var rc_here = ".rc_here_" + $(this).val();
			var rc = "#rc_" + $(this).val();
			var text = $(rc).text();

			$(rc).remove();
			$(".r_update_btn").css("display","none");
			$(".r_delete_btn").css("display","none");
			$(rc_here).append("<textarea id='rcon_text' placeholder='댓글을 남겨주세요.(200자)' style='width:590px;'>" + text +"</textarea>");
			$(rc_here).append("<button type='button' id='r_update_proc_btn' class='btn_style' value='" + $(this).val() + "'>수정</button>")
			$(rc_here).append("<button type='button' id='r_cancel_btn' class='btn_style' value='" + $(this).val() + "'>취소</button>")
		   });
		
		$(document).on("click",".r_delete_btn",function(){
			var rid = $(this).val();

			$.ajax({
				url:"cs_reply_delete.do?rid="+rid,
				success:function(result){
					if(result == 1){
						alert("삭제완료");
						reply_list_ajax();
					}
				}
			});
		   });
		
		$(document).on("click","#r_cancel_btn",function(){
			reply_list_ajax();
		   });
		
		$(document).on("click","#r_update_proc_btn",function(){
			var rid = $("#r_update_proc_btn").val();
			
			if($("#rcon_text").val() == ""){
				alert("내용을 입력해주세요");
				$("#rcon_text").focus();
				return false;
			}
			
			$.ajax({
				url:"cs_reply_update.do?rid="+rid+"&rcontent="+$("#rcon_text").val(),
				success:function(result){
					if(result == 1){
						alert("수정완료");
						reply_list_ajax();
					}
				}
			});
		   });
		
		function reply_list_ajax(){
			$.ajax({
				url:"cs_reply_list.do?bid=${vo.bid}&login_uemail=${sessionScope.svo.uemail}",
				success:function(result){
					var jdata = JSON.parse(result);
					
					var output = "";
					output += "<table class='cs_reply_table' id='cs_reply_table'>";
					output += "<tr class='reply_total_count'><td colspan='7' id='reply_total_count'>댓글 " + jdata.rcount +"개</td></tr>";
					for(var i in jdata.jlist){
						output += "<div id='cs_rlist'>"
						output += "<tr>";
						if(jdata.jlist[i].rsfile != null){
							output += "<td><img src='http://localhost:9000/sistproject3/resources/upload/"+ jdata.jlist[i].rsfile +"' style='height:60px; width:60px;  border-radius:50%' class='r_img'></td>";
						}else{
							output += "<td><img src='http://localhost:9000/sistproject3/images/logo.jpg' style='height:60px; width:60px;  border-radius:50%' class='r_img'></td>";
						}
						output += "<td>" + jdata.jlist[i].uname + "</td>";
						output += "<td></td>";
						if(jdata.jlist[i].rresult == 'ok'){
							output += "<td><button type='button' name='r_update' class='r_update_btn' id='r_update_btn_"+ jdata.jlist[i].rid +"' value='"+ jdata.jlist[i].rid +"'>수정</button></td>";
							output += "<td><button type='button' name='r_delete' class='r_delete_btn id='r_delete_btn_"+ jdata.jlist[i].rid +"' value='"+ jdata.jlist[i].rid +"'>삭제</button></td>"
						}else{
							output += "<td></td>";
							output += "<td></td>";
						}
						output += "<td>" + jdata.jlist[i].rdate + "</td>";
						output += "</tr>";
						output += "<tr>";
						output += "<td class='rc_here_"+ jdata.jlist[i].rid +"' colspan='6'><div class='rc' id='rc_"+ jdata.jlist[i].rid +"'>" + jdata.jlist[i].rcontent + "</div></td>";
						output += "<td></td>";
						output += "</tr>";
						output += "</div>";
					}
					
					output += "</table>";
					$("#cs_reply_table").remove();
					$("#here").after(output);
				}
			});
		}
	});
</script>
<style>
	#rcon_text {margin-left:60px; margin-right:20px;}
	#r_update_proc_btn {margin-top:65px; margin-right:10px;}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div class="jihye_content">
	<!-- content -->
	<h2 class="txt">공지사항 및 1:1문의</h2>
	<section id="cs_content">
		<table class="cs_table" id="cs_content_table">
			<tr>
				<th colspan="4" id="cs_title"><c:if test="${vo.uemail eq 'admin' }"><span class="orange">[공지사항] </span></c:if>${vo.btitle }</th>
				<td colspan="2" id="cs_title_small">
				<span class="orange">작성자 : </span>${vo.uname } | <span class="orange">작성일 : </span> ${vo.bdate } | <span class="orange">조회수 : </span> ${vo.bhits+1 }
				</td>
			</tr>
			<tr class="cs_content_second_tr">
				<td colspan="6" class="cs_content_second_tr"">
					<div id="bcontent">
					${vo.bcontent }
					<c:if test="${vo.bsfile ne null }">	
						<br>
						<img src="http://localhost:9000/sistproject3/resources/upload/${vo.bsfile }" style="width:200px; height:200px; padding-top:20px;">
					</c:if>
					</div>
				</td>
			</tr>
			<tr class="cs_content_btnlist">
				<td colspan="6">	
					<c:choose>
						<c:when test="${result eq 'user'}">
							<a href="cs_update.do?id=${vo.bid }"><button type="button" class="btn_style">수정</button></a>
							<a href="cs.do"><button type="button" class="btn_style">목록</button></a>
							<a href="cs_delete.do?id=${vo.bid }"><button type="button" name="r_delete" id="rd1"class="btn_style">삭제</button></a>
						</c:when>
						<c:when test="${result eq 'admin'}">
							<a href="cs.do"><button type="button" class="btn_style">목록</button></a>
							<a href="cs_delete.do?id=${vo.bid }"><button type="button" name="r_delete" id="rd1"class="btn_style">삭제</button></a>
						</c:when>
						<c:otherwise>
							<a href="cs.do"><button type="button" class="btn_style">목록</button></a>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="6" id="last">
					<div id="here"></div>
					<c:if test="${reply_ok eq 'ok' }">
					<div id="reply_form">
					<c:choose>
						<c:when test="${psfile ne null }">
							<img src="http://localhost:9000/sistproject3/resources/upload/${psfile }" id="user_img">
						</c:when>
						<c:otherwise>
							<img src="http://localhost:9000/sistproject3/images/logo.jpg" id="user_img">
						</c:otherwise>
					</c:choose>
					<textarea id="r_content" placeholder="댓글을 남겨주세요.(200자)"></textarea>
					<button type="button" id="reply_write_btn" class="btn_style">작성</button>
					</div>
					</c:if>
				</td>
			</tr>
		</table>
	</section>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
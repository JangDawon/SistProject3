<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="http://localhost:9000/sistproject3/images/logo.jpg">
<title>아이디어스 - 리뷰쓰기</title>
<link rel="stylesheet"
	href="http://localhost:9000/sistproject3/css/woohyun.css">
<script src="http://localhost:9000/sistproject3/js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function() {

		var rfileName = "";
		

	 	$("input[type=file]#file1").on('change', function() {
			if (window.FileReader) {
				rfileName = $(this)[0].files[0].name;
			}
		});
		$("#writeBtn").click(function() {
			if ($("#rstar").val() == "선택") {
				alert("별점을 선택해주세요.");
				$("#rstar").focus();
				return false;
			} else if ($("#rcontent").val() == "") {
				alert("후기를 작성해주세요.");
				$("#rcontent").focus();
				return false;
			} else if (rfileName == "") {
				alert("리뷰사진을 입력해주세요,");
				$("#file1").focus();
				return false;
			}else{
				review_write_form.submit();
			}
		});
	});
</script>
<style>
table.review_write{
margin-left:13px;}
</style>
</head>
<body>
	<div class="review_content">
		<h2>리뷰를 남겨주세요</h2>
		<form name="review_write_form" action="review_write_proc.do"
			method="post" enctype="multipart/form-data">
			<table class="review_write">
				<tr>
					<td><img
						src="http://localhost:9000/sistproject3/images/item_img.PNG"></td>
					<td>♥<b>[입점할인]뚠뚠이 캐릭터 그림 일러스트 초상화</b><br>
					</td>
				</tr>
				<tr>
					<td class="td_center" colspan=2>상품은 만족하셨나요?</td>
				</tr>
				<tr>
					<td class="td_center" colspan=2><select name="rstar"
						class="rstar" id="rstar">
							<option value="선택">선택</option>
							<option value="1">★</option>
							<option value="2">★★</option>
							<option value="3">★★★</option>
							<option value="4">★★★★</option>
							<option value="5">★★★★★</option>
					</select></td>
				</tr>

				<tr>
					<td class="td_center" colspan=2>어떤점이 좋았나요?</td>
				</tr>
				<tr>
					<td colspan=2 class="td_center"><textarea id="rcontent"
							name="rcontent" cols=55 rows=10></textarea></td>
				</tr>
				<tr>
					<td colspan=2><input type="file" id="file1" name="file1"></td>
				</tr>
				<tr>
					<td colspan=2 class="td_center"><button type="button"
							class="writeBtn" id="writeBtn">등록</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
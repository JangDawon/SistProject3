<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>디저트, 베이커리</title>
		<link rel="stylesheet" href="http://localhost:9000/sistproject3/css/dw.css">
	</head>
	<body class="category">
		<section class="category_menu">
			<div class="category_top_menu">
				<h2>디저트, 베이커리</h2>
				<div class="filter_top">
					<ul>
						<li>
							<label>배송</label>
							<input type="checkbox" name="free" value="무료배송" class="f"><span class="rchk">무료배송</span>
						</li>
						<li>
							<label>가격대</label>
							<input type="checkbox" name="price" value="1만원미만"><span class="rchk">1만원미만</span>
							<input type="checkbox" name="price" value="1만원대"><span class="rchk">1만원대</span>
							<input type="checkbox" name="price" value="2만원대"><span class="rchk">2만원대</span>
							<input type="checkbox" name="price" value="3만원대"><span class="rchk">3만원대</span>
							<input type="checkbox" name="price" value="4만원대"><span class="rchk">4만원대</span>
							<input type="checkbox" name="price" value="5만원 이상"><span class="rchk">5만원 이상</span>
						</li>
					</ul>
				</div>
				
				<div class="filter_bottom">
					<div class="check_images">
						<button class="img_btn">
							<div>
								<input type="checkbox" name="image" value="false">
								<span class="rchk">이미지만 볼래요</span>
							</div>
						</button>
					</div>
					
					<div class="selector">
						<select id="selector">
							<option value="popular">인기순</option>
							<option value="new_product">최신순(NEW)</option>
							<option value="favorite">즐겨찾기 많은 순</option>
							<option value="review">구매후기 많은 순</option>
							<option value="purchase">판매수 많은 순</option>
							<option value="low_price">낮은 가격 순</option>
							<option value="high_price">높은 가격 순</option>
						</select>
					</div>
				</div>
			</div>
		</section>
		
		<section class="category_content">
			<div class="category_content">
				<div class="product">
					<a href="">
						<div class="prod_img">
							<div>
								<img src="/resource/images/content1.jsp">
							</div>
							<div>
								<button class="favorite_btn">아이콘</button>
							</div>
						</div>
						<div class="prod_info">
							<div class="prod_info_name">2대가 함께하는 창원생과방</div>
							<div class="prod_info_title">시즌 한정 생딸기망개떡</div>
							<div class="prod_info_price">15,000원</div>
							<div class="prod_info_review">
								<div>후기</div>
								<div>이야,,, 정말 좋네요.. 흠 뭐랄까...</div>
							</div>
						</div>
					</a>
				</div>
				
				<div class="product">
					<a href="">
						<div class="prod_img">
							<div>
								<img src="/resource/images/content1.jsp">
							</div>
							<div>
								<button class="favorite_btn">아이콘</button>
							</div>
						</div>
						<div class="prod_info">
							<div class="prod_info_name">2대가 함께하는 창원생과방</div>
							<div class="prod_info_title">시즌 한정 생딸기망개떡</div>
							<div class="prod_info_price">15,000원</div>
							<div class="prod_info_review">
								<div>후기</div>
								<div>이야,,, 정말 좋네요.. 흠 뭐랄까...</div>
							</div>
						</div>
					</a>
				</div>
				
				<div class="product">
					<a href="">
						<div class="prod_img">
							<div>
								<img src="/resource/images/content1.jsp">
							</div>
							<div>
								<button class="favorite_btn">아이콘</button>
							</div>
						</div>
						<div class="prod_info">
							<div class="prod_info_name">2대가 함께하는 창원생과방</div>
							<div class="prod_info_title">시즌 한정 생딸기망개떡</div>
							<div class="prod_info_price">15,000원</div>
							<div class="prod_info_review">
								<div>후기</div>
								<div>이야,,, 정말 좋네요.. 흠 뭐랄까...</div>
							</div>
						</div>
					</a>
				</div>
				
				<div class="product">
					<a href="">
						<div class="prod_img">
							<div>
								<img src="/resource/images/content1.jsp">
							</div>
							<div>
								<button class="favorite_btn">아이콘</button>
							</div>
						</div>
						<div class="prod_info">
							<div class="prod_info_name">2대가 함께하는 창원생과방</div>
							<div class="prod_info_title">시즌 한정 생딸기망개떡</div>
							<div class="prod_info_price">15,000원</div>
							<div class="prod_info_review">
								<div>후기</div>
								<div>이야,,, 정말 좋네요.. 흠 뭐랄까...</div>
							</div>
						</div>
					</a>
				</div>
				
				<div class="product">
					<a href="">
						<div class="prod_img">
							<div>
								<img src="/resource/images/content1.jsp">
							</div>
							<div>
								<button class="favorite_btn">아이콘</button>
							</div>
						</div>
						<div class="prod_info">
							<div class="prod_info_name">2대가 함께하는 창원생과방</div>
							<div class="prod_info_title">시즌 한정 생딸기망개떡</div>
							<div class="prod_info_price">15,000원</div>
							<div class="prod_info_review">
								<div>후기</div>
								<div>이야,,, 정말 좋네요.. 흠 뭐랄까...</div>
							</div>
						</div>
					</a>
				</div>
				
				<div class="product">
					<a href="">
						<div class="prod_img">
							<div>
								<img src="/resource/images/content1.jsp">
							</div>
							<div>
								<button class="favorite_btn">아이콘</button>
							</div>
						</div>
						<div class="prod_info">
							<div class="prod_info_name">2대가 함께하는 창원생과방</div>
							<div class="prod_info_title">시즌 한정 생딸기망개떡</div>
							<div class="prod_info_price">15,000원</div>
							<div class="prod_info_review">
								<div>후기</div>
								<div>이야,,, 정말 좋네요.. 흠 뭐랄까...</div>
							</div>
						</div>
					</a>
				</div>
			</div>
			
		</section>
	</body>
</html>
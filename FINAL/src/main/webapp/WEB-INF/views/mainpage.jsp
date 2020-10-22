<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%@ include file="header.jsp" %>
<!doctype html>
<head>
<meta charset="utf-8">
<title>main page</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<style type="text/css">
.swiper-slide {
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
</head>
<body>
	<div id="content">
		<div class="swiper-container swiper1">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="http://oldmidi.cdn3.cafe24.com/p/0283.jpg">
				</div>
				<div class="swiper-slide">
					<img src="http://ktsmemo.cdn3.cafe24.com/p/0462.jpg">
				</div>
				<div class="swiper-slide">
					<img src="http://oldmidi.cdn3.cafe24.com/p/0797.jpg">
				</div>
				<div class="swiper-slide">
					<img src="http://ktsmemo.cdn3.cafe24.com/p/0484.jpg">
				</div>
				<div class="swiper-slide">
					<img src="https://ktsmemo.cafe24.com/p/0276.jpg">
				</div>
			</div>

			<!-- 네비게이션 버튼 -->
			<div class="swiper-button-next"></div>
			<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
			<div class="swiper-button-prev"></div>
			<!-- 이전 버튼 -->

			<!-- 페이징 -->
			<div class="swiper-pagination"></div>
		</div>
		<h1>촉박 경매</h1>
		<div class="swiper-container swiper2">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img src="http://oldmidi.cdn3.cafe24.com/p/0429.jpg">
				</div>
				<div class="swiper-slide">
					<img src="http://oldmidi.cdn3.cafe24.com/p/0549.jpg">
				</div>
				<div class="swiper-slide">
					<img src="http://ktsmemo.cdn3.cafe24.com/p/0011.jpg">
				</div>
				<div class="swiper-slide">
					<img src="http://ktsmemo.cdn3.cafe24.com/p/0724.jpg">
				</div>
				<div class="swiper-slide">
					<img src="http://ktsmemo.cdn3.cafe24.com/p/0064.jpg">
				</div>
				<div class="swiper-slide">
					<img src="http://ktsmemo.cdn3.cafe24.com/p/0287.jpg">
				</div>
				<div class="swiper-slide">
					<img src="https://ktsmemo.cafe24.com/p/0751.jpg">
				</div>
				<div class="swiper-slide">
					<img src="https://ktsmemo.cafe24.com/p/0053.jpg">
				</div>
				<div class="swiper-slide">
					<img src="https://ktsmemo.cafe24.com/p/0540.jpg">
				</div>
				<div class="swiper-slide">
					<img src="http://oldmidi.cdn3.cafe24.com/p/0678.jpg">
				</div>
				<div class="swiper-slide">
					<img src="http://oldmidi.cdn3.cafe24.com/p/0166.jpg">
				</div>
				<div class="swiper-slide">
					<img src="http://ktsmemo.cdn3.cafe24.com/p/0484.jpg">
				</div>
				<div class="swiper-slide">
					<img src="https://ktsmemo.cafe24.com/p/0600.jpg">
				</div>
				<div class="swiper-slide">
					<img src="http://ktsmemo.cdn3.cafe24.com/p/0785.jpg">
				</div>
				<div class="swiper-slide">
					<img src="https://ktsmemo.cafe24.com/p/0526.jpg">
				</div>
			</div>

			<!-- 네비게이션 -->
			<div class="swiper-button-next"></div>
			<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
			<div class="swiper-button-prev"></div>
			<!-- 이전 버튼 -->

			<!-- 페이징 -->
			<div class="swiper-pagination"></div>
		</div>
		<script>
			new Swiper('.swiper2', {

				slidesPerView : 5, // 동시에 보여줄 슬라이드 갯수
				spaceBetween : 30, // 슬라이드간 간격
				slidesPerGroup : 5, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

				// 그룹수가 맞지 않을 경우 빈칸으로 메우기
				// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
				loopFillGroupWithBlank : true,

				loop : true, // 무한 반복

				pagination : { // 페이징
					el : '.swiper-pagination',
					clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
				},
				navigation : { // 네비게이션
					nextEl : '.swiper-button-next', // 다음 버튼 클래스명
					prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
				},
			});

			new Swiper('.swiper1', {
				loop : true,
				pagination : { // 페이징 설정
					el : '.swiper-pagination',
					clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
				},
				navigation : { // 네비게이션 설정
					nextEl : '.swiper-button-next', // 다음 버튼 클래스명
					prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
				},
			});
		</script>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>
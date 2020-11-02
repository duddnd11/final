<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD
<!Doctype html>
<html>
=======
<!doctype html>
>>>>>>> branch 'main' of https://github.com/duddnd11/final.git
<head>
<meta charset="UTF-8">
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

.swiper1 {
   width:900px;
   height:800px;
}

#content {
   margin:0 80px 80px 80px;
}

h2, small {
   display:inline-block;
}

h2 {
    color: #000;
    font-size: 20px;
    font-weight: 700;
    line-height: 1;
    vertical-align: middle;
    font-family: "Nanum Barun Gothic", sans-serif;
    letter-spacing: 1px;
    text-transform: uppercase;
    margin-top:80px;
    margin-bottom:50px;
}

small {
   color: gray;
    font-size: 15px;
    line-height: 1;
    vertical-align: middle;
    font-family: "Nanum Barun Gothic", sans-serif;
    letter-spacing: 1px;
    text-transform: uppercase;
    margin:80px 0 50px 30px;
}
<<<<<<< HEAD
	img {
		width: 200px;
    	height: 200px;
	}
=======
img {
	width: 200px;
	height: 200px;
}

>>>>>>> branch 'main' of https://github.com/duddnd11/final.git
</style>
</head>
<body>
   <div id="content">
      <div class="swiper-container swiper1">
         <div class="swiper-wrapper">
            <div class="swiper-slide">
				<c:forEach begin="0" end="4" var="showPop" items="${showPop }">
						<c:if test="${showPop.image ne null }">
							<a href="showDetail?pno=${showPop.pno }"><img src="${showPop.image }"/></a>	
						</c:if>
						<c:if test="${showPop.image eq null }">
							<a href="showDetail?pno=${showPop.pno }"><img src="resources/images/${showPop.img1 }"/></a> <br/>
						</c:if>
				</c:forEach>
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
      <h2>촉박 경매</h2>
      <small>옥션이 선정한 경매 작품들을 소개합니다.</small>
      <div class="swiper-container swiper2">
         <div class="swiper-wrapper">
            <div class="swiper-slide">
				<c:forEach var="showHurry" items="${showHurry }">
						<c:if test="${showHurry.image ne null }">
							<a href="showDetail?pno=${showHurry.pno }"><img src="${showHurry.image }"/></a>	
						</c:if>
						<c:if test="${showHurry.image eq null }">
							<a href="showDetail?pno=${showHurry.pno }"><img src="resources/images/${showHurry.img1 }"/></a> <br/>
						</c:if>
					</c:forEach>               
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
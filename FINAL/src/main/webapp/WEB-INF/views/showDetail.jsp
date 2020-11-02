<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script src="resources/js/jquery-3.5.1.min.js"></script>
<script src="resources/js/plmi.js"></script>

<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<title>Insert title here</title>

</head>
<style>
   img {
      width: 400px;
      height: 400px;
   }
   table{
      font-size: 20px;
   }
   td{
      padding: 5px;
      padding-left: 20px;
   }
   th{
      text-align: left;
   }
</style>
<script>
$(document).ready(function(){
	  msg_time();
	  tid=setInterval('msg_time()',1000); // 타이머 1초간격으로 수행
	});
	
var stDate = new Date().getTime();
var edDate = new Date('${vo.deadlinedate}').getTime(); // 종료날짜
var RemainDate = edDate-stDate;
// 86400000 ==>24시간

function msg_time() {
  var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
  var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
  var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
  if(hours <10){
	hours = '0'+hours;
	  }
  if(miniutes < 10){
	  miniutes = '0'+miniutes;
	}
  if(seconds <10){
	seconds = '0'+seconds;
	}
  m = hours + ":" +  miniutes + ":" + seconds ; 
  document.all.timer.innerHTML = m;   
  
  if (RemainDate < 0) {      //시간 종료
    location.href="rejectAction?pno=${vo.pno}";
    clearInterval(tid);   // 타이머 해제
  }else{
    RemainDate = RemainDate - 1000; // 남은시간 -1초
  }
}
</script>
<body>
<div style="margin-left: 300px;  margin-top: 200px;">
<<<<<<< HEAD
   <span style="font-size: 20px;"><b>${vo.pno }</b></span>
   <span style="margin-left: 30px; font-size: 20px;">${vo.pname }</span>
   <div style="margin-top: 10px;">
   <c:if test="${vo.image ne null }">
      <img src="${vo.image }"/>      
   </c:if>   
   <c:if test="${vo.image eq null }">
      <img src="resources/images/${vo.img1 }"/>
      <img src="resources/images/${vo.img2 }"/> <br/>
   </c:if>
   <br/>
   </div>
   
   <c:set var="up" value="${vo.uploaddate }"/>
   <c:set var="dead" value="${vo.deadlinedate }"/>
   <c:if test="${vo.auctionmenu eq '일반' }">
   <table style="margin-left: 500px; margin-top: -350px;">
      <tr>
         <th>D-day </th> <td>${vo.timeout }</td>
      </tr>
      <tr>
         <th>판매자</th> <td>${vo.ID }</td>
      </tr>
      <tr>
         <th>날짜</th> <td>${fn:substring(up,0,10) } ~ ${fn:substring(dead,0,10) }</td>
      </tr>
      <tr>
         <th>현재가</th>
         <c:choose>
            <c:when test="${vo.bestmoney == 0  }">
               <td><fmt:formatNumber value="${vo.startmoney }" pattern="#,###" /></td>
            </c:when>
            <c:otherwise>
               <td><fmt:formatNumber value="${vo.bestmoney }" pattern="#,###" /></td>
            </c:otherwise>
         </c:choose>       
      </tr>
      <tr>
         <th>상한가</th><td><fmt:formatNumber value="${vo.lastmoney }" pattern="#,###" /></td>
      </tr>
      <tr>
         <th>입찰 단위</th> <td><fmt:formatNumber value="${vo.moneyup }" pattern="#,###" /></td>
      </tr>
      <tr>
         <th>입찰 수 </th> <td>${vo.count }</td>
      </tr>
   </table>

   <div style="display: flex;">
      <button style="margin-left: 500px; width: 200px; height: 40px; margin-top: 20px;" >관심상품</button>
      <button style="margin-left: 20px; width: 200px; height: 40px; margin-top: 20px;"  onclick="alertMsg()">입찰</button>
   </div>
   </c:if>
   
   <c:if test="${vo.auctionmenu eq '블라인드' }">
   <table style="margin-left: 500px; margin-top: -350px;">
      <tr>
         <th>D-day </th> <td>${vo.timeout }</td>
      </tr>
      <tr>
         <th>판매자</th> <td>${vo.ID }</td>
      </tr>
      <tr>
         <th>날짜</th> <td>${fn:substring(up,0,10) } ~ ${fn:substring(dead,0,10) }</td>
      </tr>
      <tr>
         <th>입찰 수 </th> <td>${vo.count }</td>
      </tr>
   </table>
   <div class="spinner" style="margin-left: 500px; margin-top: 40px;">
      <button type="button" class="sp-sub-minus" onclick="optnQtyMinus($(this));" style="width: 40px; height: 32px;">
         <b>-</b>
      </button>
         <input style=" width: 200px; height: 30px;margin-left: 0px;" type="tel" class="num" value="0" name="moneyup" id="btnQtyC3_1000020518522" data-max-qty="1000000" stoc-qty="3091">
         <button type="button" class="sp-sub-plus" onclick="optnQtyPlus($(this), '3091');" style="width: 40px; height: 32px;">
            <b>+</b>
         </button><br/>
      <button style=" width: 100px; height: 40px; margin-top: 20px; margin-left: 30px;" >관심상품</button>
      <button style="margin-top: 20px;  margin-left: 20px; width: 100px; height: 40px;"
      id="btn" onclick="alertMsgBlind()">입찰</button>   
   </div>
   </c:if>

=======
	<span style="font-size: 20px;"><b>${vo.pno }</b></span>
	<span style="margin-left: 30px; font-size: 20px;">${vo.pname }</span>
	<div style="margin-top: 10px;">
	<c:if test="${vo.image ne null }">
		<img src="${vo.image }"/>		
	</c:if>	
	<c:if test="${vo.image eq null }">
		<c:if test="${vo.img1 ne '(이름없음)' }">
		<img src="resources/images/${vo.img1 }"/>
		</c:if>
		<c:if test="${vo.img2 ne '(이름없음)' }">
		<img src="resources/images/${vo.img2 }"/> <br/>
		</c:if>
	</c:if>
	<br/>
	</div>
	
	
	<c:set var="up" value="${vo.uploaddate }"/>
	<c:set var="dead" value="${vo.deadlinedate }"/>
	<c:if test="${vo.auctionmenu eq '일반' }">
	<table style="margin-left: 500px; margin-top: -350px;">
		<tr>
			<th>D-day </th> 
			<c:choose>
			<c:when test="${vo.timeout >1}">
				<td>${vo.timeout }</td>
			</c:when>
			<c:otherwise>
				<td><span id="timer"></span></td>
			</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<th>판매자</th> <td>${vo.ID }</td>
		</tr>
		<tr>
			<th>날짜</th> <td>${fn:substring(up,0,10) } ~ ${fn:substring(dead,0,10) }</td>
		</tr>
		<tr>
			<th id="price">현재가</th>
			<c:choose>
				<c:when test="${vo.bestmoney == 0  }">
					<td><fmt:formatNumber value="${vo.startmoney }" pattern="#,###" /></td>
				</c:when>
				<c:otherwise>
					<td><fmt:formatNumber value="${vo.bestmoney }" pattern="#,###" /></td>
				</c:otherwise>
			</c:choose>		 
		</tr>
		<tr>
			<th>상한가</th><td><fmt:formatNumber value="${vo.lastmoney }" pattern="#,###" /></td>
		</tr>
		<tr>
			<th>입찰 단위</th> <td><fmt:formatNumber value="${vo.moneyup }" pattern="#,###" /></td>
		</tr>
		<tr>
			<th>입찰 수 </th> <td>${vo.count }</td>
		</tr>
	</table>

	<div style="display: flex;">
		<c:choose>
			<c:when test="${vo.deal == 2 }">
				<button style="margin-left: 500px; width: 200px; height: 40px; margin-top: 20px; background-color: lightgray;" >관심상품</button>
				<button style="margin-left: 20px; width: 200px; height: 40px; margin-top: 20px; background-color: lightgray;"  onclick="deadline()">마감</button>
			</c:when>
			
			<c:when test="${ID.ID eq null || ID.ID eq vo.ID || ID.ID eq vo.getcustomer}">
				<button style="margin-left: 500px; width: 200px; height: 40px; margin-top: 20px;" >관심상품</button>
				<button style="margin-left: 20px; width: 200px; height: 40px; margin-top: 20px;"  onclick="rejectAlert()">입찰</button>
			</c:when>
			
			<c:otherwise>
				<button style="margin-left: 500px; width: 200px; height: 40px; margin-top: 20px;" >관심상품</button>
				<button style="margin-left: 20px; width: 200px; height: 40px; margin-top: 20px;"  onclick="alertMsg()">입찰</button>
			</c:otherwise>
		</c:choose>
		
	</div>
	</c:if>
	
	<c:if test="${vo.auctionmenu eq '블라인드' }">
	<table style="margin-left: 500px; margin-top: -350px;">
		<tr>
			<th>D-day </th> 
			<c:choose>
			<c:when test="${vo.timeout >1}">
				<td>${vo.timeout }</td>
			</c:when>
			<c:otherwise>
				<td><span id="timer"></span></td>
			</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<th>판매자</th> <td>${vo.ID }</td>
		</tr>
		<tr>
			<th>날짜</th> <td>${fn:substring(up,0,10) } ~ ${fn:substring(dead,0,10) }</td>
		</tr>
		<tr>
			<th>입찰 수 </th> <td>${vo.count }</td>
		</tr>
	</table>
	<div class="spinner" style="margin-left: 500px; margin-top: 40px;">
		<button type="button" class="sp-sub-minus"  style="width: 40px; height: 32px;">
			<b>-</b>
		</button>
			<input style=" width: 200px; height: 30px;margin-left: 0px;" type="tel" class="num" value="0" name="moneyup" id="btnQtyC3_1000020518522" data-max-qty="1000000" stoc-qty="3091">
			<button type="button" class="sp-sub-plus" style="width: 40px; height: 32px;">
				<b>+</b>
			</button><br/>
		
		<c:choose>
			<c:when test="${vo.deal == 2 }">
				<button style="margin-left: 500px; width: 200px; height: 40px; margin-top: 20px; background-color: lightgray;" >관심상품</button>
				<button style="margin-left: 20px; width: 200px; height: 40px; margin-top: 20px; background-color: lightgray;"  onclick="deadline()">마감</button>
			</c:when>
			
			<c:when test="${ID.ID eq null || ID.ID eq vo.ID || ID.ID eq vo.getcustomer}">
				<button style="margin-left: 500px; width: 200px; height: 40px; margin-top: 20px;" >관심상품</button>
				<button style="margin-left: 20px; width: 200px; height: 40px; margin-top: 20px;"  onclick="rejectAlert()">입찰</button>
			</c:when>
			
			<c:otherwise>
				<button style="margin-left: 500px; width: 200px; height: 40px; margin-top: 20px;" >관심상품</button>
				<button style="margin-left: 20px; width: 200px; height: 40px; margin-top: 20px;"  onclick="alertMsg()">입찰</button>
			</c:otherwise>
		</c:choose>
	</div>
	</c:if>

>>>>>>> branch 'main' of https://github.com/duddnd11/final.git
</div>
<<<<<<< HEAD

   <c:if test="${ID.ID eq 'admin' }">

      <div style="width: 1000px; height: 1000px; margin-top: 200px; margin-left: 200px;">   

      <canvas id="myChart"></canvas>
      </div>

   </c:if>

=======

	<c:if test="${ID.ID eq 'admin' }">
		<div style="width: 1000px; height: 1000px; margin-top: 200px; margin-left: -20px;">	
		<canvas id="myChart"></canvas>
		</div>
	</c:if>

>>>>>>> branch 'main' of https://github.com/duddnd11/final.git
<script>
<<<<<<< HEAD
<c:if test="${result == 2 }">
   alert("입찰됨!!!");
</c:if>

var myprice = $("#btnQtyC3_1000020518522").val();
=======
function deadline(){
	alert("=====마감=====");
}
function rejectAlert(){
	alert("입찰 못하심ㅎㅅㅎ");
}

var myprice2 = 0;
<c:choose>
	<c:when test="${vo.bestmoney == 0  }">
		myprice2 = ${vo.startmoney };
	</c:when>
	<c:otherwise>
		myprice2 = ${vo.bestmoney };
	</c:otherwise>
</c:choose>	
>>>>>>> branch 'main' of https://github.com/duddnd11/final.git
function alertMsg(){
   if (confirm("입찰하겠?")) {
        // 확인 버튼 클릭 시 동작
<<<<<<< HEAD
      location.href='insertAuction?pno=${vo.pno}&myprice=${vo.bestmoney }';
=======
		location.href='insertAuction?pno=${vo.pno}&myprice='+myprice2+'&moneyup=${vo.moneyup }';
>>>>>>> branch 'main' of https://github.com/duddnd11/final.git
    } else {
        // 취소 버튼 클릭 시 동작
    }
}
function alertMsgBlind(){
   alert($(this).prev().prev().prev().val());
   if (confirm("입찰하겠?")) {
        // 확인 버튼 클릭 시 동작
<<<<<<< HEAD
      location.href='insertAuction?pno=${vo.pno}&myprice='+myprice;
=======
		location.href='insertAuction?pno=${vo.pno}&myprice='+$("#btnQtyC3_1000020518522").val()+'&moneyup=0';
>>>>>>> branch 'main' of https://github.com/duddnd11/final.git
    } else {
        // 취소 버튼 클릭 시 동작
    }
}

   var data1 = new Array();
   var labels1 = new Array();
   var backColor = new Array();
<c:forEach var="list" items="${list}">
   data1.push(${list.getMyprice()});
   labels1.push('${list.getBuydate()}');
   backColor.push('#6B66FF');
</c:forEach>

   
$(document).ready(function(){
   const ctx = $('#myChart');
   //첫번째 인자는 내 태그(선택자), 두번째 인자는 옵션
   const myChart = new Chart(ctx, {
      type: 'line',
      data : {
         datasets : [{
            label : "날짜별 응찰 가격", 
            backgroundColor : backColor,   
            borderColor : ['#FF0000'],
            data : data1,
            fill : false,
         }],
         labels: labels1
      },
      options :{
         scales :{
            yAxes: [{
                ticks : { max: 15000000, stepSize: 1000000, min:0 },   // 차트의 최대치와 최소치
            }]
         }
      }
   })
});
</script>
</body>
</html>
   <%@ include file="footer.jsp" %>


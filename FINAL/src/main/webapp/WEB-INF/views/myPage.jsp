<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
</head>
<body>
<div style="margin-top: 200px;">
	<!-- <input type="button" value="회원정보수정"/>
	<input type="button" value="거래내역"/>
	<input type="button" value="문의내역"/>
	<input type="button" value="관심상품"/>
	<input type="button" onclick="location.href='applyProduct'" value="상품등록"/> -->
	<main id="contents" class="wrapper-sub">
       	<div id="pattern" class="pattern">
			<h1 style="text-align: center;">마이페이지</h1>    	
		</div>
		
			<div id="" style="margin-left: 350px;margin-top: 100px;width: 850px;boader: 1px solid black;display: block;">
			<h2 style="font-weight: 700; font-size: 35px;">내정보</h2><hr>
			<img src="http://placehold.it/600x600" alt="Image Alt Text" style="width: 160px; height: 160px; float: left;">
			<div style="width: 400px;margin-left: 150px;">
         <p style="margin-left: 55px; font-weight: 700; font-size: 35px; float: left;"></p>
         <p style=" margin-left: 15px;font-weight: 700; font-size: 35px; float: left;"><span>${member.name}님</span></p>
         </div>
         <div style="width: 300px;margin-left: 600px;text-align: left;">
         <p style="font-size: 18px;">이름: ${member.name} </p>
         <p style="font-size: 18px;">전화번호: ${member.phonenum}</p>
         <p style="font-size: 18px;">이메일: ${member.email}</p>
         <p style="font-size: 18px;">주소: ${member.addr}</p>
         </div>
<<<<<<< HEAD
         </div>
      </main>
      <div style=" width: 900px; margin-left: 350px;  margin-top: 100px; width: 600px; display: block;">
         <h2 style="font-weight: 700; font-size: 35px;">기본정보</h2>
         <p style="margin-top: 20px;">프로필사진, 이름, 이메일, 주소, 휴대전화 등의 정보를 수정합니다.
         <button style="float: right;width: 50px;hegiht: 40px;margin-right: -250px;"><a href="">수정</a></button>            
      </div>
      <div style=" width: 600px; margin-left: 350px;  margin-top: 100px; width: 600px; display: block;">
         <h2 style="font-weight: 700; font-size: 35px;">거래내역</h2>
         <div style="margin-top: 20px; width: 700px;">
            <div>
               <table style="width: 900px;">
                  <tr>
                     <td style="width: 150px; height: 100px; border-bottom: 1px solid black;"><img src="" alt="Image Alt Text" 
                     style="width: 100px; height: 100px; margin-left: 0px;  margin-top: 20px; margin-bottom: 20px;"/>               
                     </td>
                     <td style="width: 420px; border-bottom: 1px solid black;"><p style="margin-left: 20px; font-size: 15px;"><b>상품이름</b></p></td>
                     <!-- <td style="border-bottom: 1px solid black;"><p style="margin-left: 20px; font-size: 15px;"><b></b>  개  </p></td> -->
                     <td style="border-bottom: 1px solid black;"><p style="margin-left: 20px; font-size: 15px;"><b>원 </b></p></td>
                     <td style="border-bottom: 1px solid black;"><p style="margin-right: 10px;">구매</p></td>
                                 
                  </tr>
               </table>
                  
            </div>
         </div>            
      </div>
      
      <div style=" width: 600px; margin-left: 350px;  margin-top: 100px; width: 600px; display: block;">
         <h2 style="font-weight: 700; font-size: 35px;">관심상품</h2>
         <div style="margin-top: 20px; width: 700px;">
            <div>
               <table style="width: 900px;">
                  <tr>
                     <td style="width: 150px; height: 100px; border-bottom: 1px solid black;"><img src="" alt="Image Alt Text" 
                     style="width: 100px; height: 100px; margin-left: 0px;  margin-top: 20px; margin-bottom: 20px;"/>               
                     </td>
                     <td style="width: 420px; border-bottom: 1px solid black;"><p style="margin-left: 20px; font-size: 15px;"><b>상품이름</b></p></td>
                     <td style="border-bottom: 1px solid black;"><p style="margin-left: 20px; font-size: 15px;"><b>원 </b></p></td>                                 
                  </tr>
               </table>      
            </div>
         </div>            
      </div>
      <div style=" width: 900px; margin-left: 350px;  margin-top: 100px; width: 600px; display: block;">
         <h2 style="font-weight: 700; font-size: 35px;">상품등록</h2>
         <p style="margin-top: 20px;">판매할 상품을 등록하세요.
         <button style="float: right;width: 50px;hegiht: 40px;margin-right: -250px;"><a href='applyProduct'">이동</a></button>            
      </div>
=======
			</div>
		</main>
		<div style=" width: 900px; margin-left: 350px;  margin-top: 100px; width: 600px; display: block;">
			<h2 style="font-weight: 700; font-size: 35px;">기본정보</h2>
			<p style="margin-top: 20px;">프로필사진, 이름, 이메일, 주소, 휴대전화 등의 정보를 수정합니다.
			<button style="float: right;width: 50px;hegiht: 40px;margin-right: -250px;"><a href="memberupdate">수정</a></button>				
		</div>
		<!-- <div style=" width: 600px; margin-left: 350px;  margin-top: 100px; width: 600px; display: block;">
			<h2 style="font-weight: 700; font-size: 35px;">거래내역</h2>
			<div style="margin-top: 20px; width: 700px;">
				<div>
					<table style="width: 900px;">
						<tr>
							<td style="width: 150px; height: 100px; border-bottom: 1px solid black;"><img src="" alt="Image Alt Text" 
							style="width: 100px; height: 100px; margin-left: 0px;  margin-top: 20px; margin-bottom: 20px;"/>					
							</td>
							<td style="width: 420px; border-bottom: 1px solid black;"><p style="margin-left: 20px; font-size: 15px;"><b>상품이름</b></p></td>
							<td style="border-bottom: 1px solid black;"><p style="margin-left: 20px; font-size: 15px;"><b></b>  개  </p></td>
							<td style="border-bottom: 1px solid black;"><p style="margin-left: 20px; font-size: 15px;"><b>원 </b></p></td>
							<td style="border-bottom: 1px solid black;"><p style="margin-right: 10px;">구매</p></td>
											
						</tr>
					</table>
						
				</div>
			</div>				
		</div> -->
		
		<div style=" width: 900px; margin-left: 350px;  margin-top: 100px; width: 600px; display: block;">
			<h2 style="font-weight: 700; font-size: 35px;">거래내역</h2>
			<button style="float: right;width: 50px;hegiht: 40px;margin-right: -250px; margin-top: -60px;"><a href="">이동</a></button>				
		</div>
		
		<div style=" width: 600px; margin-left: 350px;  margin-top: 100px; width: 600px; display: block;">
			<h2 style="font-weight: 700; font-size: 35px;">관심상품</h2>
			<div style="margin-top: 20px; width: 700px;">
				<div>
					<table style="width: 900px;">
						<tr>
							<td style="width: 150px; height: 100px; border-bottom: 1px solid black;"><img src="" alt="Image Alt Text" 
							style="width: 100px; height: 100px; margin-left: 0px;  margin-top: 20px; margin-bottom: 20px;"/>					
							</td>
							<td style="width: 420px; border-bottom: 1px solid black;"><p style="margin-left: 20px; font-size: 15px;"><b>상품이름</b></p></td>
							<td style="border-bottom: 1px solid black;"><p style="margin-left: 20px; font-size: 15px;"><b>원 </b></p></td>											
						</tr>
					</table>		
				</div>
			</div>				
		</div>
		<div style=" width: 900px; margin-left: 350px;  margin-top: 100px; width: 600px; display: block;">
			<h2 style="font-weight: 700; font-size: 35px;">상품등록</h2>
			<p style="margin-top: 20px;">판매할 상품을 등록하세요.
			<button style="float: right;width: 50px;hegiht: 40px;margin-right: -250px;"><a href="http://localhost:9090/final/applyProduct">이동</a></button>				
		</div>
>>>>>>> refs/remotes/origin/main
</div>
	
</body>
</html>
<%@ include file="footer.jsp" %>
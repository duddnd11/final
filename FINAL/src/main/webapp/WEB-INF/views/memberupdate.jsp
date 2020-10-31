<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/login";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#pw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#pw").focus();
					return false;
				}
				if($("#name").val()==""){
					alert("성명을 입력해주세요.");
					$("#name").focus();
					return false;
				}
			});
			
				
			
		})
	</script>

<body>
	<form action = "memberaction">
		<div class="form-group has-feedback">
					<label class="control-label" for="ID">아이디</label>
					<input class="form-control" type="text" id="ID" name="ID" value="${member.ID}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="pw">패스워드</label>
					<input class="form-control" type="password" id="pw" name="pw" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="name">성명</label>
					<input class="form-control" type="text" id="name" name="name" value="${member.name}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="addr">주소</label>
					<input class="form-control" type="text" id="addr" name="addr" value="${member.addr}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="phonenum">전화번호</label>
					<input class="form-control" type="text" id="phonenum" name="phonenum" value="${member.phonenum}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="email">이메일</label>
					<input class="form-control" type="text" id="email" name="email" value="${member.email}"/>
				</div>
				
				
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
	</form>
</body>
</html>
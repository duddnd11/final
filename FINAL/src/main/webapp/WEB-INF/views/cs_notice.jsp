<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="content">
		<%@ include file="aside.jsp"%>
		<main>
			<section class="content_header no_border">
				<h3>��������</h3>
				<small class="list_count"> �� 180�� </small>
			</section>
			<table class="item_list">
				<thead>
					<tr>
						<th class="classify">����</th>
						<th class="subject">����</th>
						<th class="date">�����</th>
					</tr>
				</thead>
				<tbody id="notice_list">
					<tr class="top">
						<td class="classify">����</td>
						<td class="title"><a href="������">��������</a></td>
						<td class="date">2020.10.21</td>
					</tr>
				</tbody>
			</table>
			<div class="pagination"></div>
		</main>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
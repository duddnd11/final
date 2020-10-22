<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#spreadBtn01").click(function() {
			if ($("#hiddenFAQ01").is(":visible")) {
				$("#hiddenFAQ01").slideUp();
			} else {
				$("#hiddenFAQ01").slideDown();
			}
		});
	});
	$(document).ready(function() {
		$("#spreadBtn02").click(function() {
			if ($("#hiddenFAQ02").is(":visible")) {
				$("#hiddenFAQ02").slideUp();
			} else {
				$("#hiddenFAQ02").slideDown();
			}
		});
	});
</script>
</head>
<body>
	<div class="content">
		<%@ include file="aside.jsp"%>
		<main class="cs_main">
			<div class="cs_main_faq faq" id="faq_list">
				<section class="content_header">
					<h3>���� ã�� ����</h3>
				</section>
				<div id="faq-wrap">
					<div id="spreadBtn01" class="btn">�������� ������� � �ð��� ��� �ǳ���?</div>
					<hr>
					<div id="hiddenFAQ01" class="faq-con" style="display: none;">
						<p>�ȳ��ϼ��� ����, ������Դϴ�. � �ð��� ������~�Ͽ��� 10:30~19:00�Դϴ�.</p>
					</div>
					<div id="spreadBtn02" class="btn">ȸ������ �� ��� ������ �ֳ���?</div>
					<hr>
					<div id="hiddenFAQ02" class="faq-con" style="display: none;">
						<p>������ ������ �� �ֽ��ϴ�.</p>
					</div>
				</div>
			</div>
		</main>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>
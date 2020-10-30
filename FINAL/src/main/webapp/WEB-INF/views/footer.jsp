<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
footer {
    border-top: 6px solid #000;
    margin-top: 140px;
    display: block;
}

footer .foot_wrap {
    display: table;
    font-size: 12px;
    font-family: Roboto,"Malgun Gothic",sans-serif;
    margin: 0 auto;
    position: relative;
    width: 1240px;
}

footer .foot_wrap .group {
    display: table-cell;
    padding: 90px 0 90px;
    vertical-align: top;
}

footer .foot_wrap .group:nth-child(1) ul {
    margin: 25px 0 25px;
}

footer .foot_wrap .group:nth-child(1) ul.agreements li {
    float: left;
    margin-bottom: 15px;
    margin-right: 13px;
}

footer .foot_wrap .group:nth-child(1) ul.agreements li a {
    color: #333;
    font-size: 12px;
    font-family: Roboto,"Malgun Gothic",sans-serif;
    text-align: left;
    text-decoration: none;
}

footer .foot_wrap .group:nth-child(1) ul.agreements li a:hover {
	text-decoration:underline;
}

footer .foot_wrap .group:nth-child(1) ul.information {
    margin-top: 35px;
}

footer .foot_wrap .group:nth-child(1) ul.information li {
    color: #999;
    font-size: 11px;
    font-family: Roboto,"Malgun Gothic",sans-serif;
    margin-bottom: 2px;
}

#copyright {
    color: #333;
    font-size: 11px;
    font-family: Roboto,"Malgun Gothic",sans-serif;
    margin-left:40px;
}

footer .foot_wrap .group h6 {
    color: #000;
    font-size: 11px;
    font-family: Futura Medium,"Trebuchet MS",Arial,sans-serif;
    letter-spacing: 1px;
    margin-bottom: 35px;
    text-transform: uppercase;
    margin-left:40px;
}

footer .foot_wrap .group:nth-child(2) address {
    margin-bottom: 35px;
}

footer .foot_wrap .group:nth-child(2) ul {
    color: #999;
    font-size: 12px;
    font-family: Roboto,"Malgun Gothic",sans-serif;
    width: 300px;
}
</style>
</head>
<body>
	<footer class="footer">
		<div class="foot_wrap">
			<div class="group">
				<ul class="agreements">
					<li><a href="#">�����̿���</a></li>
					<li><a href="#">�¶��ΰ�ž��</a></li>
					<li><a href="#">��ż��񽺿��ħ</a></li>
					<li><a href="#">����������޹�ħ</a></li>
				</ul>
				<ul class="information">
					<br/><br/>
					<li>��ȣ : �趯��</li>
					<li>��ǥ�̻� : Ȳ����</li>
					<li>����ڵ�Ϲ�ȣ : 123-45-67890</li>
					<li>����Ǹž��Ű� : 2016-���ﰭ��-12345</li>
				</ul>
				<div id="copyright">Copyright �� 2020 Auction Co., Ltd. All
					Rights Reserved.</div>
			</div>
			<div class="group">
				<h6>CONTACT</h6>
				<address>
					<ul>
						<li>����Ư���� ������ ������ 136<br /> ���̺�Ƽ�� 2��,3��
						</li>
						<li>��ǥ���� : 02-313-7300</li>
						<li>��������å���� : ����ȯ<br /> Email : koreais@koreaedugroup.com
						</li>
					</ul>
				</address>
			</div>
		</div>
	</footer>
</body>
</html>
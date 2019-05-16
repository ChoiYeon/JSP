<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head lang="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서대여관리 프로그램</title>
<link rel="stylesheet" href="css/index.css" />
</head>
<body>
	<div id="wrap">
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />	
		<section>
			<div id="title">
				<h2>도서대여관리 프로그램</h2>
			</div>
			<p>도서서관 회원정보, 도서정보, 대여정보 데이터베이스를 구축하고 도서관리 프로그램을 작성하는 프로그램이다.</p>
			<p>프로그램 작성순서</p>
			<ol>
				<li>회원정보 테이블을 생성한다.</li>
				<li>도서정보 테이블을 생성한다.</li>
				<li>대여정보 테이블을 생성한다.</li>
				<li>회원정보, 도서정보, 대여정보 테이블에 제시된 문제지와 참조데이터를 추가 생성한다.</li>
				<li>도서대여정보 입력화면 프로그램을 작성한다.</li>
				<li>회원관리 프로그램을 작성한다.</li>
				<li>도서관리 프로그램을 작성한다.</li>
				<li>도서대여정보 조회 프로그램을 작성한다.</li>
			</ol>
		</section>
	<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
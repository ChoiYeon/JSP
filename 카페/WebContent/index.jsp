<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css" />
</head>
<body>
<div id="wrap">
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<div id="title">
		<h2>카페 프렌차이즈 관리 프로그램</h2>
	</div>
	<section>
		<p>카페 프렌차이즈 관리를 위한 메뉴, 메장, 매출관리를 위한 데이터베이스를 구축하고 카페 매출관리 프로그램을 작성하는 프로그램이다. </p>
		<p>프로그램 작성순서</p>
		<ol>
			<li>메뉴정보 테이블을 생성한다.</li>
			<li>매장정보 테이블을 생성한다.</li>
			<li>매출정보 테이블을 생성한다.</li>
			<li>매출정보 테이블에 제시된 문제지의 참조데이터를 추가한다.</li>
			<li>매장등록 프로그램을 작성한다.</li>
			<li>메뉴관리(등록,수정,삭제) 프로그램을 작성한다.</li>
			<li>매출현황 조회 프로그램을 작성한다.</li>
		</ol>
	</section>
	<jsp:include page="footer.jsp" />

</div>
</body>
</html>
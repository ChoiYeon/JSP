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
<section>
	<div id="title">
		<h1>매장별 커피 판매관리 프로그램</h1>
	</div>
<p>매장별 커피 판매를 관리하기 위한 프로그램이다.</p>
<br />
<ol>
	<li>상품테이블, 매장테이블, 판매테이블을 추가한다.</li>
	<li>판매등록, 판매현황, 매장별판매액, 상품별판매액 페이지를 작성한다.</li>
	<li>올바르게 구현되었는지 확인한다.</li>
</ol>
</section>
<jsp:include page="footer.jsp" />
</div>
</body>
</html>
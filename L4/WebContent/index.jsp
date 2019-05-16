<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css" />
</head>
<body>
<div id="wrap">
<div id="title"><h1>생산 관리 시스템</h1></div>

<section>	
<fieldset id="index">
<legend>생산관리 메인메뉴</legend>

		<button class="btn" onclick="location.href='insert_form.jsp'">제품 입력</button>
		<button class="btn" onclick="location.href='select_update.jsp'">제품 조회</button>
		<button class="btn" onclick="location.href='first_product.jsp'">우선생산제품</button>
		<button class="btn" onclick="location.href='rank.jsp'">이익 순위</button>
		<button class="btn" onclick="location.href='amount.jsp'">그룹별제고수량</button>
</fieldset>
</section>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<%
	String sql="select c.saleno,c.pcode,to_char(c.saledate,'YYYY-MM-DD'),c.scode,a.name,c.amount,to_char((c.amount*a.cost),'999,999,999') from tbl_product_01 a , tbl_shop_01 b,tbl_salelist_01 c where a.pcode=c.pcode and b.scode=c.scode";
	Connection conn = dbconnection.conn();
	ResultSet rs = dbconnection.rs(sql);
%>
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
	<div id="title"><h1>판매현황</h1></div>
	<table id="state">
		<tr>
			<th>비번호</th>
			<th>상품코드</th>
			<th>판매날짜</th>
			<th>매장코드</th>
			<th>상품명</th>
			<th>판매수량</th>
			<th>총판매액</th>
		</tr>
		<% while(rs.next()){%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
		</tr>
		<%} %>
	</table>
</section>
<jsp:include page="footer.jsp" />
</div>
</body>
</html>
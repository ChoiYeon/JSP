<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<%
	String sql="select a.pcode,a.name,to_char(sum(b.amount*a.cost),'999,999,999') from tbl_product_01 a , tbl_salelist_01 b where a.pcode=b.pcode group by a.pcode,a.name";
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
	<div id="title"><h1>상품별 판매액</h1></div>
	<table id="product">
		<tr>
			<th>상품코드</th>
			<th>상품명</th>
			<th>상품별 판매액</th>
		</tr>
		<% while(rs.next()){%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
		</tr>
		<%} %>
	</table>
</section>
<jsp:include page="footer.jsp" />
</div>
</body>
</html>
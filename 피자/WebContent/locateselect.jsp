<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBKG.dbconnection" %>
<%
	String sql="select a.store_cd,a.store_nm, sum(b.price*c.sale_cnt) AS price from store_tbl_002 a ,pizza_tbl_002 b, sale_tbl_001 c where a.store_cd = c.sale_store_cd and b.pizza_cd=c.sale_pizza_cd group by a.STORE_CD,a.STORE_NM ORDER BY STORE_CD";
	Connection conn = dbconnection.conn();
	ResultSet rs = dbconnection.rs(sql);
	
%>
<!DOCTYPE html>
<html lang="">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="css/index.css" />
</head>
<body>
	<div id="wrap">
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<section>
		<div id="title">
			<h2>지점별매출현황</h2>
		</div>
		<table id="lselect">
			<colgroup>
				<col style="width:33%"/>
				<col style="width:33%"/>
				<col style="width:33%"/>
			</colgroup>
			<tr>
				<th>지점 코드</th>
				<th>지점 명</th>
				<th>총매출액</th>
				
			</tr>
			<%
				while(rs.next()){
					String code = rs.getString("store_cd");
					String name = rs.getString("store_nm");
					String price = rs.getString("price");
				
			%>
			<tr>
				<td><%=code %></td>
				<td><%=name %></td>
				<td class="right"><%=price %></td>
			</tr>
			<%
				}
			%>
		</table>
	</section>
	<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
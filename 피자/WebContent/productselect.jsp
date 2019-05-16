<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBKG.dbconnection" %>
<%@ page import="java.sql.*" %>
<%
	String sql="select a.pizza_cd , a.pizza_nm, a.price*sum(b.sale_cnt) AS price  from pizza_tbl_002 a, sale_tbl_001 b where a.pizza_cd=b.sale_pizza_cd group by a.pizza_cd ,a.pizza_nm,a.price order by a.pizza_cd ";
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
			<h1>상품별매출현황</h1>
		</div>
		<table id="pselect">
			<colgroup>
				<col style="width:33%"/>
				<col style="width:33%"/>
				<col style="width:33%"/>
			</colgroup>
			<tr>
				<th>피자 코드</th>
				<th>피자 명</th>
				<th>총매출액</th>
			</tr>
			<%
			while(rs.next()){
				String code = rs.getString("pizza_cd");
				String name = rs.getString("pizza_nm");
				String price =rs.getString("price");
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
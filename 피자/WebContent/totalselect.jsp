<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBKG.dbconnection" %>
<%
	String sql = "SELECT a.SALE_NO,a.SALE_STORE_CD,a.SALE_YMD,a.SALE_PIZZA_CD,b.PIZZA_NM,a.SALE_CNT,b.price*a.SALE_CNT AS price FROM SALE_TBL_001 a,PIZZA_TBL_002 b WHERE a.SALE_PIZZA_CD=b.PIZZA_CD GROUP BY b.PIZZA_NM,a.SALE_NO,a.SALE_STORE_CD,a.SALE_YMD,a.SALE_PIZZA_CD,a.SALE_CNT,b.price order by a.sale_no";
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
			<h1>통합매출현황조회</h1>
		</div>
		<table id="tselect">
			<colgroup>
				<col style="width:15%"/>
				<col style="width:15%"/>
				<col style="width:15%"/>
				<col style="width:10%"/>
				<col style="width:20%"/>
				<col style="width:10%"/>
				<col style="width:15%"/>
			</colgroup>
			<tr>
				<th>매출전표번호</th>
				<th>지점</th>
				<th>판매일자</th>
				<th>피자코드</th>
				<th>피자명</th>
				<th>판매수량</th>
				<th>매출액</th>
			</tr>
			<%
				while(rs.next()){
					String code=rs.getString("sale_no");
					String name= rs.getString("sale_store_cd");
					String date= rs.getString("sale_ymd");
					String pcode =rs.getString("sale_pizza_cd");
					String count = rs.getString("sale_cnt");
					String pname = rs.getString("pizza_nm");
					String price = rs.getString("price");
			%>
			<tr>
				<td><%=code %></td>
				<td><%=name %></td>
				<td><%=date %></td>
				<td><%=pcode %></td>
				<td><%=pname %></td>
				<td class="right"><%=count %></td>
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
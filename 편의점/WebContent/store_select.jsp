<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<%
	Connection conn = dbconnection.getConnction();
	String sql="SELECT b.store_nm,to_char(sum(decode(a.pay_type,'01',sale_cnt, 0)*c.goods_price*decode(a.sale_fg,'1',1,'2',-1)),'999,999,999')||'원' AS cash_amt,to_char(sum(decode(a.pay_type,'02',sale_cnt, 0)*c.goods_price*decode(a.sale_fg,'1',1,'2',-1)),'999,999,999')||'원' AS card_amt,to_char(sum(decode(a.pay_type,'01',sale_cnt, 0)*c.goods_price*decode(a.sale_fg,'1',1,'2',-1))+sum(decode(a.pay_type,'02',sale_cnt, 0)*c.goods_price*decode(a.sale_fg,'1',1,'2',-1)),'999,999,999')||'원' AS total_amt FROM sale_tbl_003 a,store_tbl_003 b, goods_tbl_003 c WHERE a.store_cd=b.store_cd  AND a.goods_cd=c.goods_cd GROUP BY b.STORE_NM ORDER BY total_amt desc";
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
		<div id="title">
			<h2>점포별 매출 현황</h2>
		</div>
			<table id="store_tbl">
				<tr>
					<th>점포명</th>
					<th>현금매출</th>
					<th>카드매출</th>
					<th>총매출</th>
				</tr>
				<% while(rs.next()){ 
					if(!rs.getString(4).trim().equals("0원")){
						
				%>
				
					<tr>
						<td><a href="store_plue_select.jsp?name=<%=rs.getString(1)%>"><%=rs.getString(1) %></a></td>
						<td class="right"><%=rs.getString(2) %></td>
						<td class="right"><%=rs.getString(3) %></td>
						<td class="right"><%=rs.getString(4) %></td>
					</tr>
					
					
				<%}} %>
			</table>
		
	</section>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>
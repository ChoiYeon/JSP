<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
 <%@page import = "DBKG.DBConnection" %>
 <%
 	Connection conn= DBConnection.conn();
  	PreparedStatement pstmt = null;
	String sql = "select a.custno,a.custname, decode(a.grade,'A','VIP','B','일반','C','직원','')grade, SUM(b.price) price from member_tbl_02 a, money_tbl_02 b where a.custno = b.custno group by a.custno,a.custname,a.grade order by price desc";
	ResultSet rs = DBConnection.rs(sql);
	
 %>
<html>
<head>
<meta charset=UTF-8">
<title>매출조회</title>
<link rel="stylesheet" href="css/index.css">
</head>
<body>
<div id="wrap">
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
<table id="money">
		<tr>
			<th>고객 번호</th>
			<th>고객 이름</th>
			<th>고객 등급</th>
			<th>매출</th>
		</tr>
<%	
			while(rs.next()){
				String custno = rs.getString("custno");
				String custname = rs.getString("custname");;
				String grade = rs.getString("grade");
				String price = rs.getString("price");
				%>
				
					<tr>
						<td><%=custno %></td>
						<td><%=custname %></td>
						<td><%=grade %></td>
						<td><%=price %></td>
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
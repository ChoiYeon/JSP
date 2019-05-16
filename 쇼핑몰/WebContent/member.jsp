<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.sql.*" %>
    <%@page import = "DBKG.DBConnection" %>
    <%
    	String sql = "select custno,custname,phone,address,to_char(joindate, 'yyyy-mm-dd')joindate,grade,city from member_tbl_02";
    	Connection conn = DBConnection.conn();
    	ResultSet rs= DBConnection.rs(sql);
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
	<table id="member">
		<tr>
			<th>고객번호</th>
			<th>고객이름</th>
			<th>전화번호</th>
			<th>고객주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>도시번호</th>
		</tr>
	<%
		while(rs.next()){
			String custno = rs.getString("custno");
			String custname = rs.getString("custname");
			String phone = rs.getString("phone");
			String address =  rs.getString("address");
			String joindate=rs.getString("joindate");
			String grade = rs.getString("grade");
			String city = rs.getString("city");
			%>
			<tr>
				<td><a href="modifyform.jsp?custname=<%=custname%>" id="custno"><%=custno %></a></td>
				<td><%=custname%></a></td>
				<td><%=phone %></td>
				<td><%=address %></td>
				<td><%=joindate %></td>
				<td><%=grade %></td>
				<td><%=city %></td>
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
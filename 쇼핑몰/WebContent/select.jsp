<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "yun";
		String password = "1111";
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from member_tbl_02";
		ResultSet rs = null;
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection(url, user, password);
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String custno = rs.getString("custno");
				String custname = rs.getString("custname");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				String joindate = rs.getString("joindate");
				String grade = rs.getString("grade");
				String city = rs.getString("city");
				%>
				<table>
					<tr>
						<td><%=custno %></td>
						<td><%=custname %></td>
						<td><%=phone %></td>
						<td><%=address %></td>
						<td><%=joindate %></td>
						<td><%=grade %></td>
						<td><%=city %></td>
					</tr>
				</table>
				<% 
			}
		
		
	%>
</body>
</html>
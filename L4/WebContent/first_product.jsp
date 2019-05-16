<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<%
	Connection conn= dbconnection.conn();
	String sql = "select pname,(pnum-jnum)as amount from product where jnum<pnum*0.2";
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
<div id="title">
	<h1>우선생산제품</h1>
</div>
	<table id="ftbl">
		<tr>
			<th>제품이름</th>
			<th>생산해야할 수량</th>
		</tr>
		<%
			while(rs.next()){
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td class="right"><%=rs.getString(2) %></td>
		</tr>
		<%
			}
		%>
		<tr>
		<td colspan="2">
			<div id="homebtn">
				<input class="btn" type="button" value="홈으로" onclick="location.href='index.jsp'"/>
			</div>
		</td>
		</tr>
	</table>
</div>
</body>
</html>
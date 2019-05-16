<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBKG.dbconnection" %>
<%
	Connection conn = dbconnection.conn();
	String sql="select p_id,c_name,c_email,c_tel from custom_01";
	ResultSet rs = dbconnection.rs(sql);
	
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#wrap{
	width:1000px;
	margin:0 auto;}
	table{
	wdith:900px;
	margin:0 auto;
	}
	td,th{
		text-align: center;
		border:1px solid black;
		border-collapse: collapse;
	}
	#title{
	width:100%;
	height:100px;
	text-align: center;
	line-height: 100px;}
	
</style>
</head>
<body>
<div id="wrap">
<div id="title">
	<h1>회원목록조회</h1>
</div>
	<table>
		<tr>
			<th>회원아이디</th>
			<th>회원이름</th>
			<th>이메일</th>
			<th>연락처</th>
		</tr>
		<%
			while(rs.next()){
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
		</tr>
		<%
			}
		%>
	</table>
	</div>
</body>
</html>
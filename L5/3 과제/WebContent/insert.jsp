<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="DBKG.dbconnection" %>
    <%
    	Connection conn=dbconnection.conn();
    	String action=request.getParameter("action");
    	if(action!=null){
    		String sql="insert into custom_01 values(?,?,?,?,?)";
    		PreparedStatement pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, request.getParameter("id"));
    		pstmt.setString(2, request.getParameter("pw"));
    		pstmt.setString(3, request.getParameter("name"));
    		pstmt.setString(4, request.getParameter("email"));
    		pstmt.setString(5, request.getParameter("phone"));
    		pstmt.executeQuery();
    		
    		out.println("<script>alert('완료');location.href='select.jsp'</script>");
    	}
    	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#wrap{
		width:1000px;
		margin:0 auto;
	}
	#title{
	width:100%;
	text-align: center;
	}
	table{
		width:800px;
		margin:0 auto;
	}
	table td,th{
		border:1px solid black;
		border-collapse: collapse;
	}
</style>
</head>
<body>
<div id="wrap">
<div id="title"><h1>회원등록</h1></div>
<form action="insert.jsp">
	<table>
		<colgroup>
			<col style="width:20%"/>
			<col style="width:80%"/>
		</colgroup>
		<tr>
			<th>아이디</th>
			<td><input type="text" name = "id" size="20"/></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" name = "pw"  size="20"/></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><input type="text" name = "name" size="20"/></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name = "email" size="30"/></td>
		</tr>
		<tr>
			<th>연락쳐</th>
			<td><input type="text" name = "phone" size="20"/></td>
		</tr>
		<tr>

			<td colspan="2">
			<input type="submit" />
			<input type="button" value="조회" onclick="location.href='select.jsp'"/>
			</td>
		</tr>
	</table>
	<input type="hidden" name="action" values="insert" />
</form>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<%
	String sql="select menu_cd,menu_nm,to_char(price,'FM999,999,999')||'원',decode(menu_fg,'0','커피','1','티') from menu_tbl_007";
	Connection conn = dbconnection.getConnection();
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
		<h2>메뉴 등록/수정</h2>
	</div>
		<table id="menu_select">
			<colgroup>
				<col style="width:22%"/>
				<col style="width:34%"/>
				<col style="width:22%"/>
				<col style="width:22%"/>
			</colgroup>
			<tr>
				<th>메뉴코드</th>
				<th>메뉴명</th>
				<th>메뉴가격</th>
				<th>메뉴구분</th>
			</tr>
			<%while(rs.next()){ %>
			<tr>
				<td><a href="menu_update.jsp?cd=<%=rs.getString(1) %>"><%=rs.getString(1) %></a></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
			</tr>
			<%} %>
			<tr>
				<td colspan="4">
					<div id="btn">
						<input type="button" value="등록" onclick="location.href='menu_insert.jsp'" />
					</div>
				</td>
			</tr>
		</table>
	</section>
	<jsp:include page="footer.jsp" />

</div>
</body>
</html>
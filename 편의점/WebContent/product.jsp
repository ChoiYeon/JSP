<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import="DBPKG.dbconnection" %>
<%
	Connection conn = dbconnection.getConnction();
	String sql = "select goods_cd,goods_nm,goods_price,cost,to_char(in_date,'YYYY-MM-DD') from goods_tbl_003";
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
			<h2>상품관리</h2>
		</div>
		<table id="pro_tbl">
			<colgroup>
				<col style="width:14%"/>
				<col style="width:12%"/>
				<col style="width:21%"/>
				<col style="width:34%"/>
				<col style="width:19%"/>
			</colgroup>
			<tr>
				<th>상품코드</th>
				<th>상품명</th>
				<th>단가</th>
				<th>원가</th>
				<th>입고일자</th>
			</tr>
			<%
				while(rs.next()){
			%>
				<tr>
					<td><a href="product_update.jsp?code=<%=rs.getString(1)%>"><%=rs.getString(1)%></a></td>
					<td><%=rs.getString(2) %></td>
					<td class="right">￦ <%=rs.getString(3) %></td>
					<td class="right">￦ <%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
				</tr>
			<%
				}
			%>
			<tr>
				<td colspan="5"><button onclick="location.href='product_insert.jsp'">등록</button></td>
			</tr>
		</table>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>
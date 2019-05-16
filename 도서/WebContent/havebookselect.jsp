<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBKG.dbconnection" %>
<%
	String sql = "select book_code,book_name,decode(book_type,'A','에세이','B','인문','C','소설','')book_type,book_author,to_char(in_date,'YYYY-MM-DD'),stat_fg from book_tbl_001";
	Connection conn = dbconnection.getConnection();
	ResultSet rs = dbconnection.rs(sql);
	
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보관리</title>
<link rel="stylesheet" href="css/index.css" />
</head>
<body>
<div id="wrap">
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
	<div id="title">
		<span id="title_btn"><input type="button" onclick="location.href='havebookinsert_form.jsp'" value="회원등록"/> </span>
	</div>
	<table id="book_tbl">
		<colgroup>
			<col style="width:15%"/>
			<col style="width:23%"/>
			<col style="width:15%"/>
			<col style="width:15%"/>
			<col style="width:17%"/>
			<col style="width:15%"/>
		</colgroup>
		<tr>
			<th>도서코드</th>
			<th>도서명</th>
			<th>장르</th>
			<th>작가</th>
			<th>입고일자</th>
			<th>도서상태</th>
		</tr>
<%
while(rs.next()){
	String bookcode = rs.getString("book_code");
	String bookname = rs.getString("book_name");
	String booktype = rs.getString("book_type");
	String bookauthor = rs.getString("book_author");
	String indate = rs.getString("to_char(in_date,'YYYY-MM-DD')");
	String state = rs.getString("stat_fg");
	
%>
	<tr>
		<td><a href="havebookupdate.jsp?bookcode=<%=bookcode%>"><%=bookcode %></a></td>
		<td><%=bookname %></td>
		<td><%=booktype %></td>
		<td><%=bookauthor%></td>
		<td><%=indate %></td>
		<td><%=state %></td>
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
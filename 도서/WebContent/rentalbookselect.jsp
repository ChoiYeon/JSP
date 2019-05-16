<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBKG.dbconnection" %>
<%
	String sql = "select c.rent_ymd, c.rent_no,b.book_code,b.book_name,a.cust_no,a.cust_name,c.close_ymd from member_tbl_001 a,book_tbl_001 b,rental_tbl_001 c where rent_rent=cust_no and rent_book=book_code and c.return_fg!='1' order by c.rent_ymd,c.rent_no,b.book_code";
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
	<table id="rental_tbl">
		<colgroup>
			<col style="width:13%"/>
			<col style="width:13%"/>
			<col style="width:13%"/>
			<col style="width:22%"/>
			<col style="width:13%"/>
			<col style="width:13%"/>
			<col style="width:13%"/>
		</colgroup>
		<tr>
			<th>대여일자</th>
			<th>대여번호</th>
			<th>도서코드</th>
			<th>대여도서명</th>
			<th>고객번호</th>
			<th>대여고객명</th>
			<th>반납기한</th>
		</tr>
<%
while(rs.next()){
	String rentymd = rs.getString("rent_ymd");
	String rentno = rs.getString("rent_no");
	String bookno = rs.getString("book_code");
	String bookname = rs.getString("book_name");
	String custno = rs.getString("cust_no");
	String custname = rs.getString("cust_name");
	String close = rs.getString("close_ymd");
	
%>
	<tr>
		<td><%=rentymd %></td>
		<td><%=rentno %></td>
		<td><%=bookno %></td>
		<td><%=bookname%></td>
		<td><%=custno %></td>
		<td><%=custname %></td>
		<td><%=close %></td>
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
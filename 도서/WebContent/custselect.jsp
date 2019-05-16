<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBKG.dbconnection" %>
<%
	String sql = "select cust_no,cust_name,phone,address,to_char(join_date,'YYYY-MM-DD'),decode(stat_fg,'0','정상','1','휴면','2','탈퇴')stat_fg from member_tbl_001";
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
		<span id="title_btn"><input type="button" onclick="location.href='custinsert_form.jsp'" value="회원등록"/> </span>
	</div>
	<table id="cust_tbl">
		<colgroup>
			<col style="width:14%"/>
			<col style="width:14%"/>
			<col style="width:19%"/>
			<col style="width:19%"/>
			<col style="width:19%"/>
			<col style="width:14%"/>
		</colgroup>
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>핸드폰번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>상태구분</th>
		</tr>
<%
while(rs.next()){
	String custno = rs.getString("cust_no");
	String custname = rs.getString("cust_name");
	String phone = rs.getString("phone");
	String address = rs.getString("address");
	String joindate = rs.getString("to_char(join_date,'YYYY-MM-DD')");
	String state = rs.getString("stat_fg");
	
%>
	<tr>
		<td><a href="custupdate.jsp?custno=<%=custno%>"><%=custno %></a></td>
		<td><%=custname %></td>
		<td><%=phone %></td>
		<td><%=address %></td>
		<td><%=joindate %></td>
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
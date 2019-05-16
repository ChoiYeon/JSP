<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBKG.dbconnection" %>
<%@ page import="java.sql.*" %>
<%
String rentno = null;
String action = request.getParameter("action");
String sql2="select to_char(sysdate,'YYYYMMDD') AS rendate from dual";
String sql3="select to_char(sysdate+7,'YYYYMMDD') AS redate from dual";
String sql4="select to_char(max(rent_no+1),'00000') AS rentno from rental_tbl_001";
ResultSet rs = dbconnection.rs(sql3);
rs.next();
String returndate=rs.getString("redate");

ResultSet rs2 = dbconnection.rs(sql2);
rs2.next();
String date=rs2.getString("rendate");

ResultSet rs3 = dbconnection.rs(sql4);
rs3.next();
	rentno=rs3.getString("rentno");
	
if(rentno==null){
	rentno="00001";
}
rentno=rentno.trim();
if(action!=null){
	
	
	PreparedStatement pstmt = null;
	Connection conn=dbconnection.getConnection();
	String sql="insert into rental_tbl_001 (rent_ymd,rent_no,rent_book,rent_rent,close_ymd,return_fg)values(? ,? ,? ,?, ?, ?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,request.getParameter("rentaldate"));
	pstmt.setString(2,request.getParameter("rentalno"));
	pstmt.setString(3,request.getParameter("bookno"));
	pstmt.setString(4,request.getParameter("custno"));
	pstmt.setString(5,request.getParameter("returndate"));
	pstmt.setString(6,"0");
	
	
	pstmt.executeQuery();
	out.println("<script>alert('등록완료')</script>");
}
%>
<html>
<head lang="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서대여관리 프로그램</title>
<link rel="stylesheet" href="css/index.css" />
</head>
<body>
	<div id="wrap">
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />	
		<section>
			<div id="title">
				<h2>대여도서 등록</h2>
			</div>
			<form action="rentalbookinsert_form.jsp">
				<table id="insert_tbl">
					<colgroup>
						<col style="width:40%"/>
						<col style="width:60%"/>
					</colgroup>
					<tr>
						<th>대여일자</th>
						<td><input type="text" name="rentaldate" size="15" readonly="readonly" value="<%=date %>"/></td>
					</tr>
					<tr>
						<th>대여번호(자동생성)</th>
						<td><input type="text" name="rentalno" size="15" readonly="readonly" value="<%=rentno %>"/></td>
					</tr>
					<tr>
						<th>도서코드</th>
						<td><input type="text" name="bookno" size="15"/></td>
					</tr>
					<tr>
						<th>고객번호</th>
						<td><input type="text" name="custno" size="19"/></td>
					</tr>
					<tr>
						<th>반납기한</th>
						<td><input type="text" name="returndate" size="15" readonly="readonly" value="<%=returndate %>"/></td>
					</tr>
					<tr>
						<td colspan="2" id="btn">
							<input type="submit" value="등록" />
							<input type="button" value="조회" onclick="location.href='rentalbookselect.jsp'"/>
						</td>
					</tr>
				</table>
				<input type="hidden" name="action" value="insert"/>
			</form>
		</section>
	<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
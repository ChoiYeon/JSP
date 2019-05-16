<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBKG.dbconnection" %>
<%@ page import="java.sql.*" %>
<%
String action = request.getParameter("action");

if(action!=null){

	
	PreparedStatement pstmt = null;
	Connection conn=dbconnection.getConnection();
	String sql="insert into book_tbl_001 values(? ,? ,? ,?, ?, ?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,request.getParameter("bookcode"));
	pstmt.setString(2,request.getParameter("bookname"));
	pstmt.setString(3,request.getParameter("booktype"));
	pstmt.setString(4,request.getParameter("bookauthor"));
	pstmt.setString(5,request.getParameter("indate"));
	pstmt.setString(6,request.getParameter("state"));
	
	
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
				<h2>보유도서관리(등록)</h2>
			</div>
			<form action="havebookinsert_form.jsp">
				<table id="insert_tbl">
					<colgroup>
						<col style="width:40%"/>
						<col style="width:60%"/>
					</colgroup>
					<tr>
						<th>도서코드(자동채변)</th>
						<td><input type="text" name="bookcode" size="15" readonly="readonly"/></td>
					</tr>
					<tr>
						<th>도서명</th>
						<td><input type="text" name="bookname" size="15" "/></td>
					</tr>
					<tr>
						<th>장르(A:에세이,B:인문,C:소설)</th>
						<td><input type="text" name="booktype" size="15"/></td>
					</tr>
					<tr>
						<th>작가</th>
						<td><input type="text" name="bookauthor" size="19"/></td>
					</tr>
					<tr>
						<th>입고일자</th>
						<td><input type="text" name="indate" size="15" /></td>
					</tr>
					<tr>
						<th>도서상태</th>
						<td>
							<select name="state">
								<option value="대여가능">대여가능</option>
								<option value="대여중">대여중</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" id="btn">
							<input type="submit" value="등록" />
							<input type="button" value="조회" onclick="location.href='custselect.jsp'"/>
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
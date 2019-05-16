<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBKG.dbconnection" %>
<%@ page import="java.sql.*" %>
<%
String action = request.getParameter("action");

if(action!=null){

	
	PreparedStatement pstmt = null;
	Connection conn=dbconnection.getConnection();
	String sql="insert into member_tbl_001 values(? ,? ,? ,?, ?, ?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,request.getParameter("custno"));
	pstmt.setString(2,request.getParameter("custname"));
	pstmt.setString(3,request.getParameter("phone"));
	pstmt.setString(4,request.getParameter("address"));
	pstmt.setString(5,request.getParameter("joindate"));
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
				<h2>회원정보관리(등록)</h2>
			</div>
			<form action="custinsert_form.jsp">
				<table id="insert_tbl">
					<colgroup>
						<col style="width:40%"/>
						<col style="width:60%"/>
					</colgroup>
					<tr>
						<th>회원번호</th>
						<td><input type="text" name="custno" size="15" "/></td>
					</tr>
					<tr>
						<th>회원성명</th>
						<td><input type="text" name="custname" size="15" "/></td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td><input type="text" name="phone" size="15"/></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="address" size="19"/></td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td><input type="text" name="joindate" size="15" /></td>
					</tr>
					<tr>
						<th>상태구분</th>
						<td>
							<select name="state">
								<option value="0">정상</option>
								<option value="1">휴면</option>
								<option value="2">탈퇴</option>
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
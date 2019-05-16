<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="DBKG.DBConnection" %>
    <%@page import="java.sql.*" %>
    <%
    	String custname=null;
    	String custno=null;
    	String phone=null;
    	String joindate=null;
    	String address=null;
    	String city=null;
    	String grade=null;
    	String name = request.getParameter("custname");
    	String sql="select * from member_tbl_02 where custname=\'"+name+"\'";
    
    	Connection conn=DBConnection.conn();
    	ResultSet rs = DBConnection.rs(sql);
    	while(rs.next()){
    		custname=rs.getString("custname");
    		custno=rs.getString("custno");
    		phone=rs.getString("phone");
    		address=rs.getString("address");
    		joindate=rs.getString("joindate");
    		city=rs.getString("city");
    		grade=rs.getString("grade");
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
	<div id="title"><h1>홈쇼핑 회원 정보 수정</h1></div>
	<form action="modify.jsp">
		<table id="modify">
			<colgroup>
				<col width="40%" />
				<col width="60%" />
			</colgroup>
			<tr>
				<th>회원번호</th>
				<td><input type="text" value="<%=custno %>" size="13"/></td>
			</tr>
			<tr>
				<th>회원성명</th>
				<td><input type="text" value="<%=custname %>" size="13"/></td>
			</tr>
			<tr>
				<th>회원전화</th>
				<td><input type="text" value="<%=phone %>" size="16"/></td>
			</tr>
			<tr>
				<th>회원주소</th>
				<td><input type="text" value="<%=address %>" size="18"/></td>
			</tr>
			<tr>
				<th>가입일자</th>
				<td><input type="text" value="<%=joindate %>" size="13" /></td>
			</tr>
			<tr>
				<th>고객등급 [A:VIP,B:일반,C:직원]</th>
				<td><input type="text" value="<%=grade %>" size="13" /></td>
			</tr>
			<tr>
				<th>지역번호</th>
				<td><input type="text" value="<%=city %>" size="13"/></td>
			</tr>
			<tr>
				<td colspan="2" id="btn">
					<input type="submit" value="수정" />
					<input type="button" value="조회" onclick="location.href='member.jsp'" />
				</td>
			</tr>
		</table>

		<% 
    }%>
    </form>
	</section>
<jsp:include page="footer.jsp" />
</div>
</body>
</html>
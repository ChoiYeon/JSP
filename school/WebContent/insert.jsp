<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="DBPKG.dbconnection" %>
<%
	Connection conn = dbconnection.conn();
	String action = request.getParameter("action");
	String select = "select max(substr(st_no,4,2))+1 as num from student_tbl_004";
	ResultSet rs = dbconnection.rs(select);
	rs.next();
	String num = rs.getString(1).trim();
	if(Integer.parseInt(num)<10){
		num='0'+num;
	}
	if(action!=null){
		String sql = "insert into student_tbl_004 values(?,?,?,?,?,?,to_char(sysdate,'YYYY-MM-DD'),?)";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("grade")+"0"+request.getParameter("classes").trim()+num.trim());
		pstmt.setString(2, request.getParameter("major"));
		pstmt.setString(3, request.getParameter("name"));
		pstmt.setString(4, request.getParameter("address"));
		pstmt.setString(5, request.getParameter("phone"));
		pstmt.setString(6, request.getParameter("email"));
		pstmt.setString(7, " ");
		pstmt.executeQuery();
		out.println("<script>alert('완료');location.href='index.jsp'</script>");
	}
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
<form action="insert.jsp">
	<table id="indate">
		<colgroup>
			<col style="width:45%"/>
			<col style="width:55%"/>
		</colgroup>
		<tr>
			<th colspan="2">학생정보 등록</th>
		</tr>
		<tr>
			<th>학년</th>
			<td><select name="grade">
				<option value="1">1학년</option>
				<option value="2">2학년</option>
				<option value="3">3학년</option>
			</select></td>
		</tr>
		<tr>
			<th>반</th>
			<td><select name="classes">
				<option value="1">1반</option>
				<option value="2">2반</option>
				<option value="3">3반</option>
				<option value="4">4반</option>
				<option value="5">5반</option>
				<option value="6">6반</option>
			</select></td>
		</tr>
		<tr>
			<th>번호(자동)</th>
			<td><input type="text" name="num" size="12" value="<%=rs.getString(1)%>" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>전공</th>
			<td><input type="text" name="major" size="12"/></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" size="12"/></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" size="15"/></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" size="15"/></td>
		</tr>
		<tr>
			<th>이메일주소</th>
			<td><input type="text" name="email" size="15"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<div id="btn">
					<input type="submit" value='등록'/>
				</div>
			</td>
		</tr>
		
	</table>
	<input type="hidden" name="action" value="insert" />
</form>
</div>
</body>
</html>
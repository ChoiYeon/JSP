<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<%
	String action = request.getParameter("action");
	String num = request.getParameter("number");
	Connection conn = dbconnection.conn();
	String sql = "select substr(st_no,1,1)AS 학년, to_char(substr(st_no,2,2),'9999')AS 반 ,to_char(substr(st_no,4,2),'999')AS 번호,st_major,st_nm,st_addr,st_phone,st_email from student_tbl_004 where st_no='"+num+"'";
	ResultSet rs = dbconnection.rs(sql);
	rs.next();
	if(action!=null){
		String update = "update student_tbl_004 set st_major = ? ,st_nm = ?, st_addr = ? , st_phone = ? , st_email = ? where st_no ='"+num+"'";
		PreparedStatement pstmt = conn.prepareStatement(update);
		pstmt.setString(1, request.getParameter("major"));
		pstmt.setString(2, request.getParameter("name"));
		pstmt.setString(3, request.getParameter("address"));
		pstmt.setString(4, request.getParameter("phone"));
		pstmt.setString(5, request.getParameter("email"));
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
<form action="update.jsp">
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
			<td><select name="grade" disabled="disabled">
				<option value="1" <%if(rs.getString(1).equals("1")){ %>selected="selected" <%}%>>1학년</option>
				<option value="2" <%if(rs.getString(1).equals("2")){ %>selected="selected" <%}%>>2학년</option>
				<option value="3" <%if(rs.getString(1).equals("3")){ %>selected="selected" <%}%>>3학년</option>
			</select></td>
		</tr>
		<tr>
			<th>반</th>
			<td><select name="classes" disabled="disabled">
				<option value="1" <%if(rs.getString(2).trim().equals("1")){ %>selected="selected" <%}%>>1반</option>
				<option value="2" <%if(rs.getString(2).trim().equals("2")){ %>selected="selected" <%}%>>2반</option>
				<option value="3" <%if(rs.getString(2).trim().equals("3")){ %>selected="selected" <%}%>>3반</option>
				<option value="4" <%if(rs.getString(2).trim().equals("4")){ %>selected="selected" <%}%>>4반</option>
				<option value="5" <%if(rs.getString(2).trim().equals("5")){ %>selected="selected" <%}%>>5반</option>
				<option value="6" <%if(rs.getString(2).trim().equals("6")){ %>selected="selected" <%}%>>6반</option>
			</select></td>
		</tr>
		<tr>
			<th>번호(자동)</th>
			<td><input type="text" name="num" size="12"  value="<%=rs.getString(3).trim()%>" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>전공</th>
			<td><input type="text" name="major" size="12"  value="<%=rs.getString(4)%>"/></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" size="12"  value="<%=rs.getString(5)%>"/></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" size="15"  value="<%=rs.getString(6)%>"/></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" size="15"  value="<%=rs.getString(7)%>"/></td>
		</tr>
		<tr>
			<th>이메일주소</th>
			<td><input type="text" name="email" size="15"  value="<%=rs.getString(8)%>"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<div id="btn">
					<input type="submit" value='등록'/>
				</div>
			</td>
		</tr>
		
	</table>
	<input type="hidden" name="action" value="update" />
	<input type="hidden" name="number" value="<%=num %>" />
</form>
</div>
</body>
</html>
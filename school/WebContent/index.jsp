<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<%
	Connection conn=dbconnection.conn();
	String sql = "SELECT substr(st_no,1,1)AS 학년, to_char(substr(st_no,2,2),'9999')AS 반 ,to_char(substr(st_no,4,2),'999')AS 번호,st_major,st_nm,NULL AS 출석여부 FROM STUDENT_TBL_004";
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
	<table id="select">
		<colgroup>
			<col style="width:16%"/>
			<col style="width:16%"/>
			<col style="width:16%"/>
			<col style="width:20%"/>
			<col style="width:16%"/>
			<col style="width:16%"/>
		</colgroup>
		<tr>
			<th>학년</th>
			<th>반</th>
			<th>번호</th>
			<th>전공</th>
			<th>이름</th>
			<th>출석</th>
		</tr>
		<%
		while(rs.next()){
			String num = rs.getString(3).trim();
			String attendance = rs.getString(6);
			if(attendance==null){
				attendance=" ";
			}
			if(Integer.parseInt(num)<10){
				num='0'+num;
			}
			System.out.println(num);
			
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><a href="update.jsp?number=<%=rs.getString(1).trim()+"0"+rs.getString(2).trim()+num%>"><%=rs.getString(3) %> </a></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=attendance %></td>
		</tr>
		
		<%
		}
		%>
		<tr>
			<td colspan="6">
				<div id="btn">
					<input type="button" value="학생등록" onclick="location.href='insert.jsp'" />
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
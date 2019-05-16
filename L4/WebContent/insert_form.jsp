<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<%
	String action = request.getParameter("action");
	if(action!=null){
		Connection conn = dbconnection.conn();
		String sql = "insert into product values(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("code"));
		pstmt.setString(2, request.getParameter("name"));
		pstmt.setString(3, request.getParameter("price"));
		pstmt.setString(4, request.getParameter("goal"));
		pstmt.setString(5, request.getParameter("cnt"));
		pstmt.setString(6, request.getParameter("nowcnt"));
		pstmt.setString(7, request.getParameter("group"));
		pstmt.executeQuery();
		out.println("<script>alert('완료');location.href='select.jsp'</script>");
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
<div id="title"><h1>생산 관리 시스템</h1></div>

<section>
	<form action="insert_form.jsp">
		<fieldset id="formfield">
			<legend>생산관리 등록화면</legend>
			<ul id="form">
			
				<li>제품코드 <input type="text" name="code" /> </li>
				<li>제품이름 <input type="text" name="name" /></li>
				<li>제품원가 <input type="text" name="price" /></li>
				<li>목표수량 <input type="text" name="goal" /></li>
				<li>재고수량 <input type="text" name="cnt" /></li>
				<li>출고가 <input type="text" name="nowcnt" /></li>
				<li>그룹코드 <select name="group">
					<option value="A">A</option>
					<option value="B">B</option>
					<option value="C">C</option>
				</select>
				</li>
			</ul>
			<input type="hidden" name="action" value="insert"/>
			<div id="btn">
			<input class="btn" type="submit" value="등록" />
			<input class="btn" type="button" value="메인화면" onclick="location.href='index.jsp'" />
			</div>
		</fieldset>
	</form>
</section>
</div>
</body>
</html>
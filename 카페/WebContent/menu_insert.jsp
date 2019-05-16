<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<%
	Connection conn = dbconnection.getConnection();
	String action=request.getParameter("action");
	String type="select menu_fg,decode(menu_fg,'0','커피','1','차') from menu_tbl_007 group by menu_fg";
	String num="select max(menu_cd)+1 from menu_tbl_007";
	ResultSet fg=dbconnection.rs(type);
	ResultSet number=dbconnection.rs(num);
	number.next();
	if(action!=null){
		String sql="insert into menu_tbl_007 values(menu_seq.nextval+1,?,?,?)";
		PreparedStatement pstmt= conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("name"));
		pstmt.setString(2, request.getParameter("price"));
		pstmt.setString(3, request.getParameter("type"));
		pstmt.executeQuery();
		out.println("<script>alert('입력이 완료되었습니다.');location.href='menu_indate.jsp'</script>");
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
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	
	<section>
	<div id="title">
		<h2>매뉴 등록</h2>
	</div>
	<form action="menu_insert.jsp"">
		<table id="insert">
			<colgroup>
				<col style="width:50%"/>
				<col style="width:50%"/>
			</colgroup>
			<tr>
				<th>메뉴코드(자동채번)</th>
				<td><input type="text" name="code" value="<%=number.getString(1) %>" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>메뉴명</th>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<th>메뉴가격</th>
				<td><input type="text" name="price" /></td>
			</tr>
			<tr>
				<th>메뉴구분</th>
				<td>
				<select name="type" >
				<option value="">선택</option>
				<%
					while(fg.next()){
				%>
					<option value="<%=fg.getString(1)%>"><%=fg.getString(2)%></option>
				<%
					}
				%>
				</select>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<div id="btn">
						<input type="submit" value="등록" />
						<input type="button" value="조회" onclick="location.href='menu_indate.jsp'"/>
					</div>
				</td>
			</tr>
		</table>
		<input type="hidden" name="action" value="insert" />
		</form>
	</section>
	<jsp:include page="footer.jsp" />

</div>
</body>
</html>
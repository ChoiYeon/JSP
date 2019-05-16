<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<%
	Connection conn=dbconnection.conn();
	String action=request.getParameter("action");
	String select="select max(saleno)+1,to_char(sysdate,'YYYYMMDD') from tbl_salelist_01";
	ResultSet input = dbconnection.rs(select);
	input.next();
	if(action!=null){
		String sql="insert into tbl_salelist_01 values(?,?,?,?,?)";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("num"));
		pstmt.setString(2, request.getParameter("product"));
		pstmt.setString(3, request.getParameter("date"));
		pstmt.setString(4, request.getParameter("store"));
		pstmt.setString(5, request.getParameter("amount"));
		pstmt.executeUpdate();
		out.println("<script>alert('입력이 완료되었습니다.');location.href='saleinsert.jsp'</script>");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css" />
<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
<div id="wrap">
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<section>
	<div id="title">
		<h1>판매등록</h1>
	</div>
	<form action="saleinsert.jsp" name="frm">
		<table id="insert">
			<colgroup>
				<col style="width:30%"/>
				<col style="width:70%"/>
			</colgroup>
			<tr>
				<th>비번호</th>
				<td><input type="text" name="num" value="<%=input.getString(1) %>" style="width:100%" onfocus="return oneerror();"/></td>
			</tr>
			<tr>
				<th>상품코드</th>
				<td><input type="text" name="product" style="width:100%"/></td>
			</tr>
			<tr>
				<th>판매날짜</th>
				<td><input type="text" name="date" value="<%=input.getString(2) %>" style="width:100%" onfocus="return twoerror();" /></td>
			</tr>
			<tr>
				<th>매장코드</th>
				<td><input type="text" name="store" style="width:100%"/></td>
			</tr>
			<tr>
				<th>판매수량</th>
				<td><input type="text" name="amount" style="width:100%"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="btn">
						<input type="submit" value="등록" />
						<input type="reset" value="다시쓰기"/>
					</div>
				</td>
			</tr>
		</table>
		<input type="hidden" name="action" value="action" />
	</form>
</section>
<jsp:include page="footer.jsp" />
</div>
</body>
</html>
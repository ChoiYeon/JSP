<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<%
	Connection conn = dbconnection.getConnction();
	String action = request.getParameter("action");
	String sql2 = "select max(goods_cd+1) as cd, to_char(sysdate,'YYYY-MM-DD') from goods_tbl_003";
	ResultSet rs = dbconnection.rs(sql2);
	rs.next();
	
	if(action!=null){
		String sql="insert into goods_tbl_003 values(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("code"));
		pstmt.setString(2, request.getParameter("product"));
		pstmt.setString(3, request.getParameter("amt"));
		pstmt.setString(4, request.getParameter("price"));
		pstmt.setString(5, request.getParameter("date"));

		
		pstmt.executeQuery();
		out.println("<script>alert('매출이 정상적으로 저장되엇습니다.');location.href='product.jsp'</script>");
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
			<h2>상품정보등록</h2>
		</div>
		<form action="product_insert.jsp">
			<table id="product">
			<colgroup>
				<col style="width:40%"/>
				<col style="width:60%"/>
			</colgroup>
				<tr>
					<th>상품코드(자동채번)</th>
					<td><input type="text" name="code" value="<%=rs.getString(1) %>" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="product" /></td>
				</tr>
				<tr>
					<th>단가</th>
					<td><input type="text" name="amt" /></td>
				</tr>
				<tr>
					<th>원가</th>
					<td><input type="text" name="price" /></td>
				</tr>
				<tr>
					<th>입고일자(변경불가)</th>
					<td><input type="text" name="date" value="<%=rs.getString(2) %>" readonly="readonly" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="저장"/>
						<button onclick="location.href='product.jsp'">상품목록</button>
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
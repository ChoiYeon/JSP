<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<%
	String action = request.getParameter("action");
	String code=request.getParameter("code");
	Connection conn=dbconnection.getConnction();
	String sql="select goods_nm,goods_price,cost,to_char(in_date,'YYYY-MM-DD') from goods_tbl_003 where goods_cd = '"+code+"'";
	ResultSet rs = dbconnection.rs(sql);
	
	rs.next();
	if(action!=null){
		String sql2="update goods_tbl_003 set goods_nm=? ,goods_price = ? ,cost = ? , in_date = ? where goods_cd = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1, request.getParameter("product"));
		pstmt.setString(2, request.getParameter("amt"));
		pstmt.setString(3, request.getParameter("price"));
		pstmt.setString(4, request.getParameter("date"));
		pstmt.setString(5, code);
		
		pstmt.executeQuery();
		out.println("<script>alert('완료');loaction.href='product.jsp'</script>");
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
			<h2>상품정보수정</h2>
		</div>
		<form action="product_update.jsp">
			<table id="product">
			<colgroup>
				<col style="width:40%"/>
				<col style="width:60%"/>
			</colgroup>
				<tr>
					<th>상품코드(자동채번)</th>
					<td><input type="text" name="code" value="<%=code %>" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="product" value="<%=rs.getString(1) %>" /></td>
				</tr>
				<tr>
					<th>단가</th>
					<td><input type="text" name="amt" value="<%=rs.getString(2) %>" /></td>
				</tr>
				<tr>
					<th>원가</th>
					<td><input type="text" name="price" value="<%=rs.getString(3) %>" /></td>
				</tr>
				<tr>
					<th>입고일자(변경불가)</th>
					<td><input type="text" name="date" value="<%=rs.getString(4) %>" readonly="readonly" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="저장"/>
						<button onclick="location.href='product.jsp'">상품목록</button>
					</td>
				</tr>
			</table>
			<input type="hidden" name="action" value="update" />
		</form>
			
		
	</section>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>
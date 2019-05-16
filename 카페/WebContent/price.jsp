<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<%
	String num=request.getParameter("number");
	String sql="select a.sale_ymd,a.sale_no,a.store_cd,a.menu_cd,a.size_cd,a.sale_cnt,to_char((a.SALE_CNT*b.PRICE),'FM999,999,999')||'원'AS price,decode(a.pay_type,'01','현금','02','카드'),decode(a.sale_fg,'1','판매','2','취소') from sale_tbl_003 a, MENU_TBL_007 b WHERE a.MENU_CD=b.MENU_CD order by sale_no desc";
	Connection conn = dbconnection.getConnection();
	ResultSet rs = dbconnection.rs(sql);
	if(num!=null){
		String update = "update sale_tbl_003 set sale_fg = 2 where sale_no=?";
		PreparedStatement pstmt= conn.prepareStatement(update);
		pstmt.setString(1, num);
		pstmt.executeQuery();
		out.println("<script>alert('해당매출을 취소하시겟습니까?');location.href='price.jsp'</script>");
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
		<h2>매출현황</h2>
	</div>
		<table id="select_price">
			<colgroup>
				<col style="width:11%"/>
				<col style="width:11%"/>
				<col style="width:14%"/>
				<col style="width:14%"/>
				<col style="width:9%"/>
				<col style="width:11%"/>
				<col style="width:11%"/>
				<col style="width:11%"/>
				<col style="width:8%"/>
			</colgroup>
			<tr>
				<th>판매일자</th>
				<th>판매번호</th>
				<th>점포명</th>
				<th>판매메뉴</th>
				<th>사이즈</th>
				<th>판매수량</th>
				<th>판매금액</th>
				<th>수취구분</th>
				<th>판매구분</th>
			</tr>
			<%
				while(rs.next()){
			%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%if(!rs.getString(9).equals("취소")){ %><a href="price.jsp?number=<%=rs.getString(2)%>"><%=rs.getString(2) %></a><%}else{%><%=rs.getString(2) %><%} %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(6) %></td>
					<td><%=rs.getString(7) %></td>
					<td><%=rs.getString(8) %></td>
					<td><%=rs.getString(9) %></td>
				</tr>
			
			<%} %>
		</table>
	</section>
	<jsp:include page="footer.jsp" />

</div>
</body>
</html>
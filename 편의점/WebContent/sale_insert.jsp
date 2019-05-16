<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<%
	Connection conn = dbconnection.getConnction();
	String action = request.getParameter("action");
	
	String sql2 = "select to_char(max(sale_no)+1,'0000'), to_char(sysdate,'YYYY-MM-DD') from sale_tbl_003";
	String sql3 = "select goods_cd , goods_nm from goods_tbl_003";
	ResultSet rs = dbconnection.rs(sql2);
	ResultSet rs2 = dbconnection.rs(sql3);
	rs.next();
	if(action!=null){
		String sql4 = "select to_char(saleno.nextval,'0000') from dual";
		ResultSet rs3= dbconnection.rs(sql4);
		rs3.next();
		System.out.println(rs3.getString(1).trim());
		String sql="insert into sale_tbl_003 values(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, rs3.getString(1).trim());
		pstmt.setString(2, request.getParameter("saledate"));
		pstmt.setString(3, request.getParameter("fg"));
		pstmt.setString(4, request.getParameter("store"));
		pstmt.setString(5, request.getParameter("product"));
		pstmt.setString(6, request.getParameter("count"));	
		pstmt.setString(7, request.getParameter("pay"));
		
		pstmt.executeQuery();
		out.println("<script>alert('매출이 정상적으로 저장되엇습니다.');location.href='store_select.jsp'</script>");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css" />
<script src="js/index.js"></script>
</head>
<body>
<div id="wrap">
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<section>
		<div id="title">
			<h2>매출 등록</h2>
		</div>
		<form name="frm" onsubmit="return input();">
			<table id="insert">
			<colgroup>
				<col style="width:50%"/>
				<col style="width:50%"/>
			</colgroup>
				<tr>
					<th>판매번호(자동발생)</th>
					<td><input type="text" readonly="readonly" name="saleno" value="<%=rs.getString(1).trim() %>" /></td>
				</tr>
				<tr>
					<th>판매일자(자동발생)</th>
					<td><input type="text" readonly="readonly" name="saledate" value="<%=rs.getString(2) %>" /></td>
				</tr>
				<tr>
					<th>판매구분</th>
					<td>
					<select name="fg">
						<option value="">선택</option>
						<option value="1">판매</option>
						<option value="2">판매취소</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>판매점포</th>
					<td>
					<select name="store">
						<option value="">선택</option>
						<option value="A001">이태원점</option>
						<option value="A002">한남점</option>
						<option value="A003">도원점</option>
						<option value="B001">혜화점</option>
						<option value="C001">방배점</option>
						<option value="D001">사당점</option>
						<option value="D002">흑석점</option>
						<option value="E001">금호점</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>판매상품</th>
					<td>
					<select name="product">
						<option value="">선택</option>
						<%
							while(rs2.next()){
						%>
						<option value="<%=rs2.getString(1)%>"><%=rs2.getString(2) %></option>
						<%}
						%>
					</select>
					</td>
				</tr>
				<tr>
					<th>판매수량</th>
					<td><input type="text" name="count"/></td>
				</tr>
				<tr>
					<th>수취구분</th>
					<td>
					<select name="pay">
						<option value="">선택</option>
						<option value="01">현금</option>
						<option value="02">카드</option>
					</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" id="btn">
						<input type="submit" value="등록" />
						<input type="button" onclick="location.href='store_select.jsp'" value="조회" />
					</td>
				</tr>
			</table>
			<input type="hidden" value="action" name="action" />
		</form>
		
	</section>
	<jsp:include page="footer.jsp" />
	
</div>
</body>
</html>
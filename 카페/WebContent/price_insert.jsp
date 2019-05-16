<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<%
	Connection conn = dbconnection.getConnection();
	String action=request.getParameter("action");
	String store ="select store_cd,store_nm from store_tbl_007";
	String menu ="select menu_cd,menu_nm from menu_tbl_007";
	String size ="select size_cd,size_nm from size_tbl_007";
	String input="select to_char(max(sale_no)+1,'FM0000'),to_char(sysdate,'YYYYMMDD') from sale_tbl_003";
	ResultSet in_rs = dbconnection.rs(input);
	ResultSet st_rs = dbconnection.rs(store);
	ResultSet mn_rs = dbconnection.rs(menu);
	ResultSet sz_rs = dbconnection.rs(size);
	in_rs.next();
	if(action!=null){
		String sql="insert into sale_tbl_003 (sale_ymd,sale_no,store_cd,menu_cd,size_cd,sale_cnt,pay_type)values(?,to_char(sale_seq.nextval,'FM0000'),?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("date"));
		pstmt.setString(2, request.getParameter("store"));
		pstmt.setString(3, request.getParameter("menu"));
		pstmt.setString(4, request.getParameter("size"));
		pstmt.setString(5, request.getParameter("amount"));
		pstmt.setString(6, request.getParameter("pay"));
		pstmt.executeQuery();
		out.println("<script>alert('매출이 정상적으로 저장되었습니다.');location.href='price.jsp'</script>");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css" />
<script>
		function sub(){
			var amount=document.frm.amount;
			if(!amount.value){
				alert("판매수량을 입력하지 않았습니다.");
				amount.focus();
				return false;
			}
		}
</script>
</head>
<body>
<div id="wrap">
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	
	<section>
	<div id="title">
		<h2>매출 등록</h2>
	</div>
	<form action="price_insert.jsp" name="frm" onsubmit="return sub();">
		<table id="insert">
			<colgroup>
				<col style="width:50%"/>
				<col style="width:50%"/>
			</colgroup>
			<tr>
				<th>판매일자(자동발생)</th>
				<td><input type="text" value="<%=in_rs.getString(2) %>" name="date" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>판매번호(자동채번)</th>
				<td><input type="text" value="<%=in_rs.getString(1) %>" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>판매점포</th>
				<td>
				<select name="store">
					<option value="">선택</option>
					<%
						while(st_rs.next()){
					%>
						<option value="<%=st_rs.getString(1)%>"><%=st_rs.getString(2)%></option>
					<%
						}
					%>
				</select>
				</td>
			</tr>
			<tr>
				<th>메뉴코드</th>
				<td>
				<select name="menu">
					<option value="">선택</option>
					<%
						while(mn_rs.next()){
					%>
						<option value="<%=mn_rs.getString(1)%>"><%=mn_rs.getString(2)%></option>
					<%
						}
					%>
				</select>
				</td>
			</tr>
			<tr>
				<th>사이즈</th>
				<td>
				<select name="size">
					<option value="">선택</option>
					<%
						while(sz_rs.next()){
					%>
						<option value="<%=sz_rs.getString(1)%>"><%=sz_rs.getString(2)%></option>
					<%
						}
					%>
				</select>
				</td>
			</tr>
			<tr>
				<th>판매수량</th>
				<td><input type="text" name="amount" /></td>
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
				<td colspan="2">
					<div id="btn">
						<input type="submit" value="등록" />
						<input type="button" value="조회" onclick="location.href='price.jsp'"/>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBKG.dbconnection" %>
    <%
    	Connection conn=dbconnection.getConnection();
    	String custno = request.getParameter("custno");
    	String sql= "select cust_name,phone,address,to_char(join_date,'YYYYMMDD') from member_tbl_001 where cust_no ='"+custno+"'";
    	ResultSet rs = dbconnection.rs(sql);
    	rs.next();
    	String custname = rs.getString("cust_name");
    	String phone = rs.getString("phone");
    	String address = rs.getString ("address");
    	String joindate = rs.getString("to_char(join_date,'YYYYMMDD')");
  		
    	
    	String action = request.getParameter("action");
    	if(action!=null){
    		PreparedStatement pstmt = null;
    		String sql2= "update member_tbl_001 set cust_name=?,phone =?,address=?,join_date=?, stat_fg=? where cust_no= ?" ;
    		pstmt=conn.prepareStatement(sql2);
    		pstmt.setString(1, request.getParameter("custname"));
    		pstmt.setString(2, request.getParameter("phone"));
    		pstmt.setString(3, request.getParameter("address"));
    		pstmt.setString(4, request.getParameter("joindate"));
    		pstmt.setString(5, request.getParameter("state"));
    		pstmt.setString(6, custno);
    		
    		pstmt.executeQuery();
    		
    		out.println("<script>alert('수정완료')</script>");
    	}
    %>
<html>
<head lang="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서대여관리 프로그램</title>
<link rel="stylesheet" href="css/index.css" />
</head>
<body>
	<div id="wrap">
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />	
		<section>
			<div id="title">
				<h2>회원정보관리(수정)</h2>
			</div>
			<form action="custupdate.jsp">
				<table id="insert_tbl">
					<colgroup>
						<col style="width:40%"/>
						<col style="width:60%"/>
					</colgroup>
					<tr>
						<th>회원번호</th>
						<td><input type="text" name="custno" size="15" value="<%=custno%>" /></td>
					</tr>
					<tr>
						<th>회원성명</th>
						<td><input type="text" name="custname" size="15"value="<%=custname%> "/></td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td><input type="text" name="phone" size="15" value="<%=phone%>"/></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="address" size="19" value="<%=address%>"/></td>
					</tr>
					<tr>
						<th>가입일자</th>
						<td><input type="text" name="joindate" size="15" value="<%=joindate%>"/></td>
					</tr>
					<tr>
						<th>상태구분</th>
						<td>
							<select name="state">
								<option value="0">정상</option>
								<option value="1">휴면</option>
								<option value="2">탈퇴</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" id="btn">
							<input type="submit" value="등록" />
							<input type="button" value="조회" onclick="location.href='custselect.jsp'"/>
						</td>
					</tr>
				</table>
				<input type="hidden" name="action" value="insert"/>
			</form>
		</section>
	<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
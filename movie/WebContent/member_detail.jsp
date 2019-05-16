<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBKG.dbconnection" %>
<%
	Connection conn=dbconnection.conn();
	String action =request.getParameter("action");
	String code = request.getParameter("code");
	String custno="";
	String custnm="";
	String phone="";
	String address="";
	String joindate="";
	String point="";
	String joinroute="";
	String grade="";
	int stat=0;
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
<form action="member_detail.jsp">
<% if(code!=null && code.equals("insert")){
	//인설트
	String query="select max(cust_no)+1,to_char(sysdate,'YYYY-MM-DD') from member_tbl_005";
	ResultSet rs=dbconnection.rs(query);
	rs.next();
	custno=rs.getString(1);
	joindate=rs.getString(2);
		%>
		<input type="hidden" value="insert" name="action"/>
		<% 
	}else if(action != null && action.equals("update")){
		//업데이트 액션
		String sql="update member_tbl_005 set cust_nm=?, phone=?,address=?,join_date=?,join_route=? where cust_no=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("custnm"));
		pstmt.setString(2, request.getParameter("phone"));
		pstmt.setString(3, request.getParameter("address"));
		pstmt.setString(4, request.getParameter("joindate"));
		pstmt.setString(5, request.getParameter("route"));
		pstmt.setString(6, request.getParameter("custno"));
		pstmt.executeQuery();
		out.println("<script>alert('수정완료');location.href='member.jsp'</script>");
	}else if(action != null && action.equals("insert")){
		//인설트 액션
		String sql="insert into member_tbl_005 values(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("custno"));
		pstmt.setString(2, request.getParameter("custnm"));
		pstmt.setString(3, request.getParameter("phone"));
		pstmt.setString(4, request.getParameter("address"));
		pstmt.setString(5, request.getParameter("joindate"));
		pstmt.setString(6, request.getParameter("point"));
		pstmt.setString(7, request.getParameter("route"));
		pstmt.executeQuery();
		out.println("<script>alert('입력완료');location.href='member.jsp'</script>");

	}else if(code!=null &&  !code.equals("insert")){
		//업데이트 
		%>
		<input type="hidden" value="update" name="action"/>
		<% 
		String sql = "SELECT CUST_NO,CUST_NM,phone,ADDRESS,to_char(JOIN_DATE,'YYYY-MM-DD') AS ymd,POINT,decode(JOIN_ROUTE,'01','액션','02','드라마','03','공포') AS genre ,CASE WHEN point > 10000 THEN 'VVIP' WHEN point > 5000 THEN 'VIP' ELSE '일반' END AS grade FROM MEMBER_TBL_005 where cust_no='"+code+"'";
		ResultSet rs = dbconnection.rs(sql);
		rs.next();
		custno=rs.getString(1);
		custnm=rs.getString(2);
		phone=rs.getString(3);
		address=rs.getString(4);
		joindate=rs.getString(5);
		point=rs.getString(6);
		joinroute=rs.getString(7);
		grade=rs.getString(8);
		stat=1;
	}
	
%>
	<table id="insert">
		<tr>
			<th colspan="2">회원정보</th>
		</tr>
		<tr>
			<th>고객번호(자동채번)</th>
			<td><input type="text" name="custno" readonly="readonly" value="<%=custno %>" /></td>
		</tr>
		<tr>
			<th>고객명</th>
			<td><input type="text" name="custnm" value="<%=custnm %>"/></td>
		</tr>
		<tr>
			<th>핸드폰번호</th>
			<td><input type="text" name="phone" value="<%=phone %>"/></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" value="<%=address %>"/></td>
		</tr>
		<tr>
			<th>가입일자(자동설정)</th>
			<td><input type="text" name="joindate" readonly="readonly" value="<%=joindate %>"/></td>
		</tr>
		<tr>
			<th>누적포인트(자동설정)</th>
			<td><input type="text" name="point" readonly="readonly" <%if(stat==1){ %>value="<%=point %>"<%}else{ %>value='0'<%} %>/></td>
		</tr>
		<tr>
			<th>선호영화</th>
			<td>
			<select name="route">
				<option value="">선택</option>
				<option value="01" <%if(joinroute !=null && joinroute.equals("액션")){%> selected="selected"<%} %>>액션</option>
				<option value="02" <%if(joinroute !=null && joinroute.equals("드라마")){%> selected="selected"<%} %>>드라마</option>
				<option value="03" <%if(joinroute !=null && joinroute.equals("공포")){%> selected="selected"<%} %>>공포</option>
			</select>
			</td>
		</tr>
		<tr>
			<th>등급(자동설정)</th>
			<td><input type="text" name="grade" readonly="readonly" <%if(stat==1){ %>value="<%=grade %>"<%}else{ %>value='일반'<%} %>/></td>
		</tr>
		<tr>
			<td colspan="2"  id="btn">
			<input type="submit" value="전송" />
			<input type="button" value="돌아가기" onclick="location.href='member.jsp'"/>
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>
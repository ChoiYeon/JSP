<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBKG.dbconnection" %>
<%
	Connection conn=dbconnection.conn();
	String mnm="select movie_cd,movie_nm from movie_tbl_005";
	String infor="select to_char(max(r_seq)+1,'0000'),to_char(sysdate,'YYYYMMDD') from reserve_tbl_005";
	ResultSet information=dbconnection.rs(infor);
	information.next();
	ResultSet movie = dbconnection.rs(mnm);
	String action=request.getParameter("action");
	if(action!=null){
		String sql="insert into reserve_tbl_005 values(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("ymd"));
		pstmt.setString(2, request.getParameter("resernum"));
		pstmt.setString(3, request.getParameter("custno"));
		pstmt.setString(4, request.getParameter("mcd"));
		pstmt.setString(5, request.getParameter("moning_fg"));
		System.out.println(request.getParameter("ymd")+request.getParameter("custno")+request.getParameter("resernum")+request.getParameter("mcd")+"  ");
		pstmt.executeQuery();
		out.println("<script>alert('등록완료');location.href='index.jsp'</script>");
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
<form action="reserve.jsp" method="post">
	<table id="insert">
		<tr>
			<th colspan="2">예매등록</th>
		</tr>
		<tr>
			<th>예매일자(자동설정)</th>
			<td><input type="text" name="ymd" readonly="readonly" value="<%=information.getString(2)%>"/></td>
		</tr>
		<tr>
			<th>예매번호(자동채번)</th>
			<td><input type="text" name="resernum" readonly="readonly" value="<%=information.getString(1).trim()%>"/></td>
		</tr>
		<tr>
		<th>영화제목</th>
		<td>
			<select name="mcd">
				<option value="">선택</option>
				<%
				while(movie.next()){
					%><option value="<%=movie.getString(1)%>"><%=movie.getString(2) %></option><%
				}
				%>
			</select>
			</td>
		</tr>
		<tr>
			<th>조조할인 여부</th>
			<td><select name="morning_fg">
				<option value="">선택</option>
				<option value="Y">Y</option>
				<option value="N">N</option>
				
			</select></td>
		</tr>
		<tr>
			<th>예매회원번호</th>
			<td><input type="text" name="custno" value=""/></td>
		</tr>
		<tr>
			<td colspan="2" id="btn">
				<input type="submit" value="저장" />	
				<input type="button" value="돌아가기" />
			</td>
		</tr>
	</table>
	<input type="hidden" name="action" value="insert"/>
	</form>
</div>
</body>
</html>
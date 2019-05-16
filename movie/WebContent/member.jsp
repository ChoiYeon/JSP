<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBKG.dbconnection" %>
<%
	Connection conn =dbconnection.conn();
	String sql="SELECT CUST_NO,CUST_NM,substr(phone,'1','3')||'-'||substr(phone,'4','4')||'-'||substr(phone,'8','4'),ADDRESS,to_char(JOIN_DATE,'YYYY-MM-DD') AS ymd,to_char(POINT,'999,999,999'),decode(JOIN_ROUTE,'01','액션','02','드라마','03','공포') AS genre ,CASE WHEN point > 10000 THEN 'VVIP' WHEN point > 5000 THEN 'VIP' ELSE '일반' END AS grade FROM MEMBER_TBL_005";
	ResultSet rs = dbconnection.rs(sql);
	
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
<div id="title">
	<h1>영화 예매 순위</h1>
</div>
	<table id="member">
		<colgroup>
			<col style="width:10%"/>
			<col style="width:9%"/>
			<col style="width:17%"/>
			<col style="width:17%"/>
			<col style="width:13%"/>
			<col style="width:12%"/>
			<col style="width:12%"/>
			<col style="width:10%"/>
		</colgroup>
		<tr>
			<th>고객번호</th>
			<th>고객명</th>
			<th>핸드폰번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>누적포인트</th>
			<th>선호영화</th>
			<th>등급</th>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><a href="member_detail.jsp?code=<%=rs.getString(1)%>"><%=rs.getString(1) %></a></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td class="right"><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
			<td><%=rs.getString(8) %></td>
		</tr>
		<%} %>
		<tr>
			<td colspan="8">
				<div id="btn">
					<input type="button" value="신규등록" onclick="location.href='member_detail.jsp?code=insert'" />
					<input type="button" value="돌아가기" onclick="location.href='index.jsp'" />
				</div>
			</td>
		</tr>
	</table>




</div>
</body>
</html>
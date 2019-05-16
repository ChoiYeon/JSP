<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBKG.dbconnection" %>
<%
	Connection conn =dbconnection.conn();
	String sql="SELECT RANK() OVER (ORDER BY sum(cnt) DESC) AS ranking,movie_nm, round(sum(cnt)/(SELECT count(*) FROM reserve_tbl_005)*100, 1)||'%' per,sum(cnt)||'건' cntnum, ymd FROM ( SELECT movie_nm, count(*) cnt,to_char(play_date, 'yyyy-mm-dd') ymd FROM reserve_tbl_005 a, movie_tbl_005 b WHERE a.r_movie_cd = b.movie_cd GROUP BY movie_nm, play_date UNION ALL SELECT movie_nm, 0, to_char(play_date, 'yyyy-mm-dd') FROM movie_tbl_005 ) GROUP BY movie_nm, ymd";
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
	<table id="rank">
		<colgroup>
			<col style="width:19%"/>
			<col style="width:22%"/>
			<col style="width:18%"/>
			<col style="width:19%"/>
			<col style="width:22%"/>
		</colgroup>
		<tr>
			<th>순위</th>
			<th>영화제목</th>
			<th>예매율</th>
			<th>예매건수</th>
			<th>개봉일</th>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td class="right"><%=rs.getString(3) %></td>
			<td class="right"><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
		</tr>
		<%} %>
		<tr>
			<td colspan="5">
				<div id="btn">
					<input type="button" value="회원관리" onclick="location.href='member.jsp?code=insert'" />
					<input type="button" value="예매등록" onclick="location.href='reserve.jsp'" />
				</div>
			</td>
		</tr>
	</table>




</div>
</body>
</html>
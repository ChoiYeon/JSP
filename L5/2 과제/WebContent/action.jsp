<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>

<%
	Connection con = dbconnection.conn();
	String name = null;
	String date = null;
	String code = request.getParameter("code");
	String sql2 ="select to_char(sysdate,'hh:mi:ss')as ymd from dual";
	ResultSet rs2=dbconnection.rs(sql2);
	
	String sql= "select name,to_char(sysdate,'hh:mi:ss')as ymd from a where code='"+code+"'";
	 
	ResultSet rs = dbconnection.rs(sql);
	if(rs.next()){
		name=rs.getString(1);
		
		
	}else{
		rs2.next();
		name="등록되지 않은 제품 입니다!!";
		
	}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
window.onload=function(){
var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
                ];
var day =["Sun","Mon","Tue","Wed","Thu","Fri","Sat"];

                var d = new Date();
                var date=month[d.getMonth()]+" "+day[d.getDay()%7]+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds()+" KST "+d.getFullYear();
                tbl.rows[3].cells[1].innerHTML=date;
}
</script>
<style>
	table td{
		border:1px solid black;
		border-collapse: collapse;
	}
#wrap{
width:1000px;
height:1500px;
}
</style>
</head>
<body>
<div id="wrap">
	<table id="tbl">
		<col width:15%/>
		<col width:85%/>
		<tr>
			<td colspan="2">제조사 조회 결과</td>
		</tr>
		<tr>
			<td>제품코드</td>
			<td><%=code %></td>
		</tr>
		<tr>
			<td>제조사명</td>
			<td><%=name %></td>
		</tr>
		<tr>
			<td>조회일시</td>
			<td></td>
		</tr>
	</table>

</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<%
	Connection conn= dbconnection.conn();
	ResultSet rs= null;
	String action = request.getParameter("action");
	String code = "";
	String name ="";
	String price ="";
	String goal ="";
	String cnt ="";
	String nowcnt ="";
	String group ="";
	if(action!=null && action.equals("select")){
		code = request.getParameter("code");
		String sql = "select * from product where code='"+code+"'";
		rs = dbconnection.rs(sql);
		if(rs.next()){
		name=rs.getString(2);
		price=rs.getString(3);
		goal=rs.getString(4);
		cnt=rs.getString(5);
		nowcnt=rs.getString(6);
		group=rs.getString(7);
		}else{
			out.println("<script>alert('해당 재품은 존재하지 않습니다.')</script>");
		}
	}else if(action!=null && action.equals("update")){
		code = request.getParameter("code");
		name = request.getParameter("name");
		price = request.getParameter("price");
		goal = request.getParameter("goal");
		cnt = request.getParameter("cnt");
		nowcnt = request.getParameter("nowcnt");
		group = request.getParameter("group");
		String sql="update product set pname = ? , cost = ? , pnum = ? , jnum = ? , sale = ? , gcode = ? where code=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, price);
		pstmt.setString(3, goal);
		pstmt.setString(4, cnt);
		pstmt.setString(5, nowcnt);
		pstmt.setString(6, group);
		pstmt.setString(7, code);
		pstmt.executeQuery();
		out.println("<script>alert('완료');location.href='select_update.jsp'</script>");
		
	}else if(action!=null && action.equals("delete")){
		String sql = "delete from product where code= ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("code"));
		pstmt.executeQuery();
		out.println("<script>alert('완료');location.href='select_update.jsp'</script>");
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css" />
<script>
	window.onload=function(){
		var code = document.getElementById("code");
		var del = document.getElementById("delete");
		var update = document.getElementById("update");
		var name = document.getElementById("name");
		
		update.addEventListener('click', function(event){
			if(!code.value){
				alert("코드를 입력해주세요!");
				event.preventDefault();
			}else{
			document.getElementById("action").value="update";
			}
		})
		del.addEventListener('click', function(event){
			if(!code.value){
				alert("코드를 입력해주세요!");
				event.preventDefault();
			}else{
			document.getElementById("action").value="delete";
			}
		})
	}
</script>
</head>
<body>
<div id="wrap">
<div id="title"><h1>생산 관리 시스템</h1></div>

<section>
	<form action="select_update.jsp">
		<fieldset id="formfield">
			<legend>생산관리 등록화면</legend>
			<ul id="form">
				<li>제품코드 <input type="text" name="code" id="code" value="<%=code %>"  /> </li>
				<li>제품이름 <input type="text" name="name" value="<%=name%>" /></li>
				<li>제품원가 <input type="text" name="price" value="<%=price%>" /></li>
				<li>목표수량 <input type="text" name="goal" value="<%=goal%>" /></li>
				<li>재고수량 <input type="text" name="cnt" value="<%=cnt%>" /></li>
				<li>출고가 <input type="text" name="nowcnt" value="<%=nowcnt%> "/></li>
				<li>그룹이름 <select name="group">
					<option value="A" <%if(group.equals("A  ")){%> selected="selected"<% }%>>컴퓨터</option>
					<option value="B" <%if(group.equals("B  ")){%> selected="selected"<% }%>>냉장고</option>
					<option value="C" <%if(group.equals("C  ")){%> selected="selected"<% }%>>냉장소모품</option>
				</select>
				</li>
			</ul>
			<input type="hidden" name="action" id="action" value="select"/>
			
			<div id="btn">
			<input class="btn" type="submit" value="조회" />
			<input class="btn" type="submit" value="수정" id="update"/>
			<input class="btn" type="submit" value="삭제" id="delete"/>
			<input class="btn" type="button" value="메인화면" onclick="location.href='index.jsp'" />
			</div>
		</fieldset>
	</form>
</section>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBKG.dbconnection" %>
<%@ page import="java.sql.*" %>
<%
	String action = request.getParameter("action");
	Connection conn = dbconnection.conn();
	if(action!=null){
	String sql = "insert into sale_tbl_001 values(?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("num"));
	pstmt.setString(2, request.getParameter("code"));
	pstmt.setString(3, request.getParameter("date"));
	pstmt.setString(4, request.getParameter("pizza"));
	pstmt.setString(5, request.getParameter("amount"));
	pstmt.executeUpdate();
	
	out.println("<script>alert('등록이 완료되었습니다.');location.href='totalselect.jsp'</script>");
	}
%>
<!DOCTYPE html>
<html lang="">
<head>
<meta charset="UTF-8">
<title>피자 전문점 판매 관리 프로그램 전표 등록</title>
<link rel="stylesheet" href="css/index.css" />

</head>
<body>
<div id="wrap">
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<section>
		<div id="title">
			<h2>매출전표등록</h2>
		</div>
		<form action="insert_form.jsp" name="frm" onsubmit="return input();">
			<table id="insert">
				<colgroup>
					<col style="width:30%" />
					<col style="width:70%"/>
				</colgroup>
				<tr>
					<td class="label">매출전표번호</td>
					<td><input type="text" size="10" class="input" name="num" /></td>
				</tr>
				<tr>
					<td class="label">지점코드</td>
					<td><input type="text" size="10" class="input" name="code" /></td>
				</tr>
				
				<tr>
					<td class="label">판매일자</td>
					<td><input type="text" size="12" class="input" name="date" /></td>
				</tr>
				
				<tr>
					<td class="label">피자코드</td>
					<td>
						<select name="pizza" id="spizza">
							<option value="">피자선택</option>
							<option value="A0001">[A0001]고르골졸라피자</option>
							<option value="A0002">[A0002]치즈피자</option>
							<option value="A0003">[A0003]페퍼로니피자</option>
							<option value="A0004">[A0004]콤비네이션피자</option>
							<option value="A0005">[A0005]고구마피자</option>
							<option value="A0006">[A0006]포테이초피자</option>
							<option value="A0007">[A0007]불고기피자</option>
							<option value="A0008">[A0008]나폴리피자</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td class="label">판매수량</td>
					<td><input type="text" size="12" class="input" name="amount"/></td>
				</tr>
				
				<tr>
					<td colspan="2" class="label">
						<input type="submit" value="전표등록" name="submit"/>
						<input type="reset" value="다시쓰기">
					</td>
				</tr> 
				
			</table>
			<input type="hidden" name="action" value="insert" />
		</form>
	</section>
	<jsp:include page="footer.jsp" />
	</div>
	<script src="js/index.js"></script>
</body>
</html>
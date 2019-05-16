<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.dbconnection" %>
<% 
	String storenm = request.getParameter("name");
	String sql="select decode(c.sale_fg,'1','판매','2','판매취소','')salefg,c.sale_no,to_char(c.sale_ymd,'YYYY-MM-DD'),a.goods_nm,c.sale_cnt AS cnt,to_char(sum(sale_cnt*goods_price),'999,999,999,999')as price,decode(c.pay_type,'01','현금','02','카드','')as pay from goods_tbl_003 a,store_tbl_003 b,sale_tbl_003 c where c.STORE_CD=b.STORE_CD AND c.GOODS_CD=a.GOODS_CD AND b.STORE_NM='"+storenm+"'  GROUP BY a.GOODS_NM,b.store_cd,c.SALE_FG,c.SALE_NO,c.SALE_YMD,c.SALE_CNT,c.PAY_TYPE";
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
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<section>
	<div id="title">
			<h2><%=storenm %>의 상세 매출 조회</h2>
		</div>
		<table id="plus_tbl">
			<colgroup>
				<col style="width:14%"/>
				<col style="width:14%"/>
				<col style="width:16%"/>
				<col style="width:14%"/>
				<col style="width:14%"/>
				<col style="width:14%"/>
				<col style="width:14%"/>
			</colgroup>
			<tr>
				<th>판매구분</th>
				<th>판매번호</th>
				<th>판매일자</th>
				<th>상품명</th>
				<th>판매수량</th>
				<th>판매금액</th>
				<th>수취구분</th>
			</tr>
			<%while(rs.next()){ %>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td class="right"><%=rs.getString(6) %></td>
				<td><%=rs.getString(7) %></td>
			</tr>
			<%} %>
		</table>
	</section>
	<jsp:include page="footer.jsp" />
</div>
</body>
</html>
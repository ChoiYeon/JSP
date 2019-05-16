<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import= "java.sql.*" %>
    <% 
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "yun";
		String password = "1111";
		Connection conn = null;
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection(url, user, password);
		}catch(Exception e){
		  out.println("오류발생");
		}		
		%>
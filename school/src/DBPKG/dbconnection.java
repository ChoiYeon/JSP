package DBPKG;

import java.sql.*;


public class dbconnection {
	public static Connection conn() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "1111");
		return conn;
	}
	public static ResultSet rs(String args) throws Exception{
		ResultSet rs  = null;
		Connection conn = conn();
		PreparedStatement pstmt  =conn.prepareStatement(args);
		rs=pstmt.executeQuery();
		
		return rs;
		
	}
	
}

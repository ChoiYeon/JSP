package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class dbconnection {
	public static Connection conn() throws Exception{
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "system";
		String password = "1111";
		Connection conn = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection(url, user, password);
			
		return conn;
	}
	public static ResultSet rs(String args)throws Exception{
		ResultSet rs = null;
		Connection conn= dbconnection.conn();
	  	PreparedStatement pstmt = null;
		String sql = args;
		pstmt=conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		return rs;
		
	}
	
}

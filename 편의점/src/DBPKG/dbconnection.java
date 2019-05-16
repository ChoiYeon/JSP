package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class dbconnection {
	static Connection con = null;
	
	public static Connection getConnction() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1111");
		return con;
	}
	
	public static ResultSet rs(String args) throws Exception{
		con=getConnction();
		ResultSet rs = null;
		PreparedStatement pstmt = con.prepareStatement(args);
		rs= pstmt.executeQuery();
		return rs;
	}
}

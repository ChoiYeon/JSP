package DBKG;
import java.sql.*;;

public class DBConnection {
	static Connection conn;
	
	public static Connection conn() throws Exception{
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "yun";
		String password = "1111";
		conn = null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection(url, user, password);
			
		return conn;
	}
	
	public static ResultSet rs(String args)throws Exception{
		ResultSet rs = null;
		Connection conn= DBConnection.conn();
	  	PreparedStatement pstmt = null;
		String sql = args;
		pstmt=conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		return rs;
		
	}
		
}

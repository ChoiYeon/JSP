package DBKG;
import java.sql.*;


public class dbconnection {

	public static Connection getConnection() throws Exception{ 
		   Class.forName("oracle.jdbc.OracleDriver");
		   Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1111"); 
		   return con;  
		   
		   }
	
	public static ResultSet rs(String args) throws Exception{
		Connection con=getConnection();
		ResultSet rs = null;
		rs = con.prepareStatement(args).executeQuery();
		
		return rs;
	}
	
	
	
	
}

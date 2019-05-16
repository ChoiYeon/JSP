package DBPKG;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class dbconnection {

	public static Connection  getConnection() throws Exception{ 
		   Class.forName("oracle.jdbc.OracleDriver");
		   Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234"); 
		   return con;  
		   }
	
	public static ResultSet rs(String args) throws Exception{
		Connection con= getConnection();
		ResultSet rs = null;
		rs = con.prepareStatement(args).executeQuery();
		
		return rs;
	}
	
	
	
	
}

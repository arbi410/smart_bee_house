package BD;

import java.sql.*;



	public class BDI {

	    // Méthode pour obtenir la connexion à la base de données
	    public   Connection getConnection()  {
	    	Connection con=null;
	  	  try {

	  	  Class.forName("com.mysql.jdbc.Driver");
	  	  
	  	    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/beee_house","root","");
	  	  }

    	
    	
    	
    	catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
  	  
  	  return con;
    }

}

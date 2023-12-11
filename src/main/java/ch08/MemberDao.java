package ch08;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class MemberDao {
   public Connection getConnection() {
         Connection conn = null;
         PreparedStatement pstmt = null;

         try {
            Class.forName("oracle.jdbc.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "kic", "1111");
            return conn;
         } catch (ClassNotFoundException e) {

            e.printStackTrace();
         } catch (SQLException e) {

            e.printStackTrace();
         }

         return null;
      }
public int insertMember(KicMember kicmem) throws UnsupportedEncodingException, SQLException {
      	
      Connection conn = getConnection();
          
         PreparedStatement pstmt = conn.prepareStatement("insert into kicmember "
        		  + "values (?,?,?,?,?,?, null)");
         //mapping
         pstmt.setString(1,kicmem.getId());
         pstmt.setString(2,kicmem.getPass());
         pstmt.setString(3,kicmem.getName());
         pstmt.setInt(4,kicmem.getGender());
         pstmt.setString(5,kicmem.getTel());
         pstmt.setString(6,kicmem.getEmail());
         //4)excute
         int num = pstmt.executeUpdate();
         return num;
                  
   }
}// class end
package ch07;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class GuestBookDao {

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

	public int insertBook(HttpServletRequest request) throws UnsupportedEncodingException, SQLException {

		Connection conn = getConnection();
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		if (name != null && !name.equals("")) {
			PreparedStatement pstmt = conn.prepareStatement("insert into guestbook values(?,?,?,sysdate)");
			// mapping
			pstmt.setString(1, name);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			// 4) excute
			int num = pstmt.executeUpdate();
			return num;
		}
		return 0;
	}

	public ResultSet selectBook() throws SQLException {
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement("select * from guestbook");
		// 4)excute
		ResultSet rs = pstmt.executeQuery();

		return rs;
	}
}

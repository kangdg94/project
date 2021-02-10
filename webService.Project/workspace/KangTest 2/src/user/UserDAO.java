package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword ="1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String UserID, String UserPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE UserID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, UserID);
			rs = pstmt.executeQuery(); //db 조회 (검색)
			if (rs.next()) {
				if(rs.getString(1).equals(UserPassword))
					return 1;
				else
					return 0;
				
			}
			return -1; //no id
		}catch(Exception e) {
		
			e.printStackTrace();
		}
		return -2; //db error
	}
	
	
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?, false, false)"; //마지막2개 checked , admin
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  user.getUserID());
			pstmt.setString(2,  user.getUserPassword());
			pstmt.setString(3,  user.getUserName());
			pstmt.setString(4,  user.getUserGender());
			pstmt.setString(5,  user.getUserEmail());
			pstmt.setString(6,  user.getUserEmailHash());
			return pstmt.executeUpdate(); //db 업데이트 데이터 개수 반환 (성공이면 한개의 데이터가 생겼으니 1이 반환)
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db error
		
	}

	
	public boolean getuserEmailChecked(String userID) {
		String SQL = "SELECT userEmailChecked FROM USER WHERE UserID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getBoolean(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; //db error
		
	}
	
	public String getuserEmail(String userID) {
		String SQL = "SELECT userEmail FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
			return rs.getString(1);}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; //db error
	}
	
	public boolean setuserEmailChecked(String userID) {
		String SQL = "UPDATE USER SET userEmailChecked = 1 WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.executeUpdate();
			return true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; //db error
		
	}
}
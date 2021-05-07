package teamproject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Member_DBManager {
	public void Cus_signin(String id,String pw,String name,String phone) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DriverManager.getConnection(DBInfo.mysql_url, DBInfo.mysql_id, DBInfo.mysql_pw);
			Class.forName(DBInfo.mysql_class);
			
			pstmt = conn.prepareStatement(
					"INSERT INTO "+ 
					"member "+
					"(ID,PW,NAME,PHONE)"+
					"VALUES "+
					"(?,?,?,?)");
			
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			pstmt.setString(3,name);
			pstmt.setString(4,phone);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				
			}
		}
	}
	public void Emp_Signin(String employee_id,String name,String ssnumber,String phone,String address,String Withdrawal_date) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			System.out.println("일로오나?");
			conn = DriverManager.getConnection(DBInfo.mysql_url, DBInfo.mysql_id, DBInfo.mysql_pw);
			Class.forName(DBInfo.mysql_class);
			System.out.println("일로오나?");
			
			pstmt = conn.prepareStatement(
					"INSERT INTO "+ 
					"employee "+
					"(EMPLOYEE_ID,NAME,SSNUMBER,PHONE,ADDRESS,WITHDRAWAL_DATE)"+
					"VALUES "+
					"(?,?,?,?,?,?)");
			
			pstmt.setString(1,employee_id);
			pstmt.setString(2,name);
			pstmt.setString(3,ssnumber);
			pstmt.setString(4,phone);
			pstmt.setString(5,address);
			pstmt.setString(6,Withdrawal_date);
			pstmt.executeUpdate();
			
			System.out.println("일로오나?");
		}catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				
			}
		}
	}
}


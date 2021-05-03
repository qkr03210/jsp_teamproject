package teamproject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBManager {
	String ora_class = "oracle.jdbc.driver.OracleDriver";
	String mysql_class ="com.mysql.cj.jdbc.Driver";
	
//	conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/spro","root","1234");
	
	String ora_url = "jdbc:oracle:thin:@localhost:1521:xe";
	//보통 쓰는  id pw
	String ora_id="AI";
	String ora_pw="1234";
	
	String mysql_url="jdbc:mysql://127.0.0.1:3306/spro?useUnicode=yes&characterEncoding=UTF8";
	String mysql_id="root";
	String mysql_pw="1234";
	
	public Member cklogin(String id, String pw) {
		Member member = null;
		
		
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
//			Class.forName("com.mysql.jdbc.Driver");
			Class.forName(mysql_class);
//			conn=DriverManager.getConnection("jdbc:mysql://localhost/spro","root ","1234");
			conn=DriverManager.getConnection(mysql_url, mysql_id, mysql_pw);
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE id = ? AND pw = ? ");
			pstmt.setString(1,id);
			pstmt.setString(2, pw);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				member = new Member();
				member.setId(id);
				member.setPw(pw);
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));		
			}
			else {
		
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt !=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return member;
	}
	
	public int signInsert(String id,String pw, String name, String phone) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
		
			Class.forName(mysql_class);
			conn = DriverManager.getConnection(mysql_url, mysql_id, mysql_pw);
			pstmt=conn.prepareStatement("INSERT INTO MEMBER (ID,PW,NAME,PHONE) VALUES (?,?,?,?)");
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			pstmt.setString(3,name);
			pstmt.setString(4,phone);
			int ret=pstmt.executeUpdate();
			if(ret>0)
			{
				System.out.println("정상적으로 insert됨");
				return ret;
			}
				
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(pstmt!= null)pstmt=null;
				if(conn!=null)conn=null;
				
			}catch(Exception e2){
				
			}
		}
		return 0;
	}
	
	public int seat_useInset(String num,String name,String phone,String m_time)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
		
			Class.forName(mysql_class);
			conn = DriverManager.getConnection(mysql_url, mysql_id, mysql_pw);
			pstmt=conn.prepareStatement("INSERT INTO SEAT_USE (NUM,NAME,PHONE,M_TIME) VALUES (?,?,?,?)");
			pstmt.setString(1,num);
			pstmt.setString(2,name);
			pstmt.setString(3,phone);
			pstmt.setString(4,m_time);
			int ret=pstmt.executeUpdate();
			if(ret>0)
			{
				System.out.println("정상적으로 insert됨");
				return ret;
			}
				
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try{
				if(pstmt!= null)pstmt=null;
				if(conn!=null)conn=null;
				
			}catch(Exception e2){
				
			}
		}
		return 0;
	}
}


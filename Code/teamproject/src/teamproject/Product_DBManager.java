package teamproject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Product_DBManager {
	
	public ArrayList<Product> select() {
		
		ArrayList<Product> list = new ArrayList<Product>();
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;	
		
		try {
			Class.forName(DBInfo.mysql_class);
			conn = DriverManager.getConnection(DBInfo.mysql_url,DBInfo.mysql_id,DBInfo.mysql_pw);
			pstmt = conn.prepareStatement("select * from product limit 0, 100");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Product ppu = new Product();
				ppu.setCode(rs.getInt("code"));
				ppu.setName(rs.getString("name"));
				ppu.setPrice(rs.getString("price"));
				ppu.setDate(rs.getString("date"));
				ppu.setType(rs.getString("type"));
				ppu.setAmount(rs.getInt("amount"));
				ppu.setClassific(rs.getString("classific"));
				list.add(ppu);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			
			try {
				if (rs!= null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {}
		}
		return list;
	}
}


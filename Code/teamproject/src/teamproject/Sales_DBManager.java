package teamproject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Sales_DBManager {
	public ArrayList<Sales> select() {
		ArrayList<Sales> list = new ArrayList<Sales>();
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;	
		try {
			Class.forName(DBInfo.mysql_class);
			conn = DriverManager.getConnection(DBInfo.mysql_url,DBInfo.mysql_id,DBInfo.mysql_pw);
			pstmt = conn.prepareStatement("select * from sales limit 0, 100");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Sales ssu = new Sales();
				ssu.setIdx(rs.getInt("idx"));
				ssu.setSalesNumber(rs.getString("sales_number"));
				ssu.setProduct(rs.getString("product"));
				ssu.setAmount(rs.getInt("amount"));
				ssu.setClient(rs.getString("client"));
				list.add(ssu);
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

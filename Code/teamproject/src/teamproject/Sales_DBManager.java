package teamproject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Sales_DBManager {
	
	//전체 매출 기록 조회
	public ArrayList<Sales1> select() {
		ArrayList<Sales1> list = new ArrayList<Sales1>();
		Connection conn = null;	;
		PreparedStatement pstmt = null;	
		ResultSet rs = null;	
		try {
			Class.forName(DBInfo.mysql_class);
			conn = DriverManager.getConnection(DBInfo.mysql_url,DBInfo.mysql_id,DBInfo.mysql_pw);
			pstmt = conn.prepareStatement("WITH totalP (\r\n"
					+ "   sales_number,\r\n"
					+ "   total\r\n"
					+ ") AS (\r\n"
					+ "    SELECT\r\n"
					+ "       orda.sales_number, sum(product.price*orda.quantity) as total_price\r\n"
					+ "   from product\r\n"
					+ "   inner join\r\n"
					+ "   orda on \r\n"
					+ "   product.pd_code=orda.item_name\r\n"
					+ "    group by orda.sales_number\r\n"
					+ ")\r\n"
					+ "SELECT\r\n"
					+ "    payment.sales_number,payment.cid,totalP.total,payment.payment_method_type,payment.date\r\n"
					+ "FROM\r\n"
					+ "    totalP,payment\r\n"
					+ "where\r\n"
					+ "    payment.sales_number=totalP.sales_number;");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Sales1 ssu = new Sales1();
				ssu.setSales_number(rs.getInt("payment.sales_number"));
				ssu.setCid(rs.getString("payment.cid"));
				ssu.setTotalPrice(rs.getInt("totalP.total"));
				ssu.setPayment_method_type(rs.getString("payment_method_type"));
				ssu.setDate(rs.getTimestamp("date"));
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
	
	//일일 매출 기록 조회(선택한 날짜: time-> 2021-05-07
	public ArrayList<Sales1> selected_payment(String time) {
		ArrayList<Sales1> list = new ArrayList<Sales1>();
		Connection conn = null;	;
		PreparedStatement pstmt = null;	
		ResultSet rs = null;	
		try {
			Class.forName(DBInfo.mysql_class);
			conn = DriverManager.getConnection(DBInfo.mysql_url,DBInfo.mysql_id,DBInfo.mysql_pw);
			pstmt = conn.prepareStatement("WITH totalP (\r\n"
					+ "   sales_number,\r\n"
					+ "   total\r\n"
					+ ") AS (\r\n"
					+ "    SELECT\r\n"
					+ "       orda.sales_number, sum(product.price*orda.quantity) as total_price\r\n"
					+ "   from product\r\n"
					+ "   inner join\r\n"
					+ "   orda on \r\n"
					+ "   product.pd_code=orda.item_name\r\n"
					+ "    group by orda.sales_number\r\n"
					+ ")\r\n"
					+ "SELECT\r\n"
					+ "    payment.sales_number,payment.cid,totalP.total,payment.payment_method_type,payment.date\r\n"
					+ "FROM\r\n"
					+ "    totalP,payment\r\n"
					+ "where\r\n"
					+ "    payment.sales_number=totalP.sales_number and DATE_FORMAT(date, \"%Y-%m-%d\")=\""+time+"\";");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Sales1 ssu = new Sales1();
				ssu.setSales_number(rs.getInt("payment.sales_number"));
				ssu.setCid(rs.getString("payment.cid"));
				ssu.setTotalPrice(rs.getInt("totalP.total"));
				ssu.setPayment_method_type(rs.getString("payment_method_type"));
				ssu.setDate(rs.getTimestamp("date"));
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
	
	//월 매출 기록 조회(선택한 날짜: time-> 2021-05
	public ArrayList<Sales1> selected_payment_month(String time) {
		String m_time=time.substring(0, 7);
		ArrayList<Sales1> list = new ArrayList<Sales1>();
		Connection conn = null;	;
		PreparedStatement pstmt = null;	
		ResultSet rs = null;	
		try {
			Class.forName(DBInfo.mysql_class);
			conn = DriverManager.getConnection(DBInfo.mysql_url,DBInfo.mysql_id,DBInfo.mysql_pw);
			pstmt = conn.prepareStatement("WITH totalP (\r\n"
					+ "   sales_number,\r\n"
					+ "   total\r\n"
					+ ") AS (\r\n"
					+ "    SELECT\r\n"
					+ "       orda.sales_number, sum(product.price*orda.quantity) as total_price\r\n"
					+ "   from product\r\n"
					+ "   inner join\r\n"
					+ "   orda on \r\n"
					+ "   product.pd_code=orda.item_name\r\n"
					+ "    group by orda.sales_number\r\n"
					+ ")\r\n"
					+ "SELECT\r\n"
					+ "    payment.sales_number,payment.cid,totalP.total,payment.payment_method_type,payment.date\r\n"
					+ "FROM\r\n"
					+ "    totalP,payment\r\n"
					+ "where\r\n"
					+ "    payment.sales_number=totalP.sales_number and DATE_FORMAT(date, \"%Y-%m\")=\""+m_time+"\";");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Sales1 ssu = new Sales1();
				ssu.setSales_number(rs.getInt("payment.sales_number"));
				ssu.setCid(rs.getString("payment.cid"));
				ssu.setTotalPrice(rs.getInt("totalP.total"));
				ssu.setPayment_method_type(rs.getString("payment_method_type"));
				ssu.setDate(rs.getTimestamp("date"));
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
	
	//주간 매출 기록 조회(선택한 날짜: time-> 2021-05-07
	public ArrayList<Sales1> selected_payment_week(String time) {
		time= time.replaceAll("-", "/");
		ArrayList<Sales1> list = new ArrayList<Sales1>();
		Connection conn = null;	;
		PreparedStatement pstmt = null;	
		ResultSet rs = null;	
		try {
			Class.forName(DBInfo.mysql_class);
			conn = DriverManager.getConnection(DBInfo.mysql_url,DBInfo.mysql_id,DBInfo.mysql_pw);
			pstmt = conn.prepareStatement("WITH totalP (\r\n"
					+ "   sales_number,\r\n"
					+ "   total\r\n"
					+ ") AS (\r\n"
					+ "    SELECT\r\n"
					+ "       orda.sales_number, sum(product.price*orda.quantity) as total_price\r\n"
					+ "   from product\r\n"
					+ "   inner join\r\n"
					+ "   orda on \r\n"
					+ "   product.pd_code=orda.item_name\r\n"
					+ "    group by orda.sales_number\r\n"
					+ "),bbb as(\r\n"
					+ "SELECT\r\n"
					+ "    payment.sales_number,payment.cid,totalP.total,payment.payment_method_type,payment.date\r\n"
					+ "FROM\r\n"
					+ "    totalP,payment\r\n"
					+ "where\r\n"
					+ "    payment.sales_number=totalP.sales_number\r\n"
					+ "),ccc as(\r\n"
					+ "SELECT DATE_FORMAT(DATE_SUB(`date`, INTERVAL (DAYOFWEEK(`date`)-1) DAY), '%Y/%m/%d') as start,\r\n"
					+ "       DATE_FORMAT(DATE_SUB(`date`, INTERVAL (DAYOFWEEK(`date`)-7) DAY), '%Y/%m/%d') as end,\r\n"
					+ "       bbb.*\r\n"
					+ "  FROM bbb\r\n"
					+ " )select *\r\n"
					+ " from ccc\r\n"
					+ " where '"+time+"' between start and end;");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Sales1 ssu = new Sales1();
				ssu.setSales_number(rs.getInt("sales_number"));
				ssu.setCid(rs.getString("cid"));
				ssu.setTotalPrice(rs.getInt("total"));
				ssu.setPayment_method_type(rs.getString("payment_method_type"));
				ssu.setDate(rs.getTimestamp("date"));
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
	
	//선택한 주문번호로 상세조회
	public ArrayList<Sales2> select(String sales_number) {
		ArrayList<Sales2> list = new ArrayList<Sales2>();
		Connection conn = null;	
		PreparedStatement pstmt = null;	
		ResultSet rs = null;	
		try {
			Class.forName(DBInfo.mysql_class);
			conn = DriverManager.getConnection(DBInfo.mysql_url,DBInfo.mysql_id,DBInfo.mysql_pw);
//			pstmt = conn.prepareStatement("select * from sales where sales_number= '"+sales_number+"'");
			pstmt = conn.prepareStatement("select product.name,product.price,orda.quantity,orda.quantity*product.price as totalPrice\r\n" + 
					"from orda,product \r\n" + 
					"where orda.sales_number="+sales_number+" and orda.item_name=product.pd_code;");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Sales2 ssu = new Sales2();
				ssu.setName(rs.getString("product.name"));
				ssu.setPrice(rs.getInt("product.price"));
				ssu.setAmount(rs.getInt("orda.quantity"));
				ssu.setTotalPrice(rs.getInt("totalPrice"));
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

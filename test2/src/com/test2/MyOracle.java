package com.test2;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MyOracle {
	// ����̹� Ŭ���� �̸�
	public static final String DRIVER_NAME = "com.mysql.jdbc.Driver";
	
	// DB ��������
	public static final String URL = "jdbc:mysql://192.168.0.1:3306/board?"+"useUnicode=true&characterEncoding=euckr";
	public static final String USER = "root";
	public static final String PWD = "alfks4874";
	
	// DB���� �޼ҵ�
	public static Connection getConnection() throws Exception {
		Connection con = null;
		// DB ��������
		final String URL = "jdbc:mysql://192.168.0.1:3306/board?"+"useUnicode=true&characterEncoding=euckr";
		final String USER = "root";
		final String PWD = "alfks4874";
		
		// 1 ����̹� �ε�
		Class.forName(DRIVER_NAME);
		// 2 DB����
		con = DriverManager.getConnection(URL, USER, PWD);
		return con;
	} // getConnection()�� ��

	public static void closeJDBC(Connection con, 
			PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	} // closeJDBC()�� ��
}


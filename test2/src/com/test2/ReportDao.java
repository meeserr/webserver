package com.test2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.text.SimpleDateFormat;

public class ReportDao {

	public void insertReport(ReportBean reportBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int num = 0; // �۹�ȣ
		
		try {
			con = MyOracle.getConnection();
			// �۹�ȣ num���ϱ�. ���� ������� 1
			//   ���� �������  �ֱٱ۹�ȣ(��ȣ�� ����ū��)+1
			sql = "select max(num) from report";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt(1) + 1; // ���� �ִ°��. �ִ밪+1
			} else {
				num = 1; // ���� ���� ���
			}	
			pstmt.close();
			pstmt = null;
			sql = "insert into report (num, name, email, content, reg_date) ";
			sql += " values (?, ?, ?, ?, ?) ;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, reportBean.getName());
			pstmt.setString(3, reportBean.getEmail());
			pstmt.setString(4, reportBean.getContent());
			pstmt.setTimestamp(5, reportBean.getReg_date());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyOracle.closeJDBC(con, pstmt, rs);
		}
	} 

	public ReportBean getReport(int num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "";
        ReportBean reportBean = null;
        
        try {
            con = MyOracle.getConnection();
            // sql  num�� �ش��ϴ� ���� ��������
            sql = "SELECT * FROM report WHERE num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            // ����  rs ����
            rs = pstmt.executeQuery();
            // rs ������ ������ �ڹٺ� ��ü����
            // rs => �ڹٺ� ����
            if (rs.next()) {
                // �ڹٺ� ��ü����. �������Ҵ�
                reportBean = new ReportBean();
                // rs => �ڹٺ� ����
                reportBean.setContent(rs.getString("content"));
                 }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyOracle.closeJDBC(con, pstmt, rs);
        }
        return reportBean;
    } 
	
}

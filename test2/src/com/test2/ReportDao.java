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
		int num = 0; // 글번호
		
		try {
			con = MyOracle.getConnection();
			// 글번호 num구하기. 글이 없을경우 1
			//   글이 있을경우  최근글번호(번호가 가장큰값)+1
			sql = "select max(num) from report";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt(1) + 1; // 글이 있는경우. 최대값+1
			} else {
				num = 1; // 글이 없는 경우
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
            // sql  num에 해당하는 정보 가져오기
            sql = "SELECT * FROM report WHERE num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            // 실행  rs 저장
            rs = pstmt.executeQuery();
            // rs 데이터 있으면 자바빈 객체생성
            // rs => 자바빈 저장
            if (rs.next()) {
                // 자바빈 객체생성. 기억장소할당
                reportBean = new ReportBean();
                // rs => 자바빈 저장
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

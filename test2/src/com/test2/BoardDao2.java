package com.test2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.test2.BoardBean;
import com.test2.MyOracle;



// �̱��� ���� ����(Singleton)
// ��ü�� 1���� ������ �����ϵ��� ����� ����
public class BoardDao2 {

	private static BoardDao2 boardDao = new BoardDao2();
	private BoardDao2() {}
	public static BoardDao2 getInstance() {
		return boardDao;
	}
    // ��۾���
    public void reInsertBoard(BoardBean boardBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "";
        int num = 0; // �۹�ȣ
        
        try {
            con = MyOracle.getConnection();
            // Ʈ����� ���� ���
            // �ڵ�Ŀ���� ����Ŀ������ ������            
            con.setAutoCommit(false);
            
            // sql �׷쳻�� ��� ���� ���ġ
            // update  re_seq
            sql = "UPDATE board SET re_seq=re_seq+1 WHERE re_ref=? AND re_seq > ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, boardBean.getRe_ref());
            pstmt.setInt(2, boardBean.getRe_seq());
            pstmt.executeUpdate();
            
            // �۹�ȣnum ���ϱ�     max(num)+1
            pstmt.close(); pstmt = null;
            sql = "SELECT MAX(num) FROM board";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                num = rs.getInt(1) + 1;
                boardBean.setNum(num);

            } else {

                num = 1;

            }
            
            // ��� insert
            // re_ref�״��    re_lev 1����   re_seq 1����
            pstmt.close(); pstmt = null;
            sql = "INSERT INTO board (num, name, passwd, subject, content, re_ref, re_lev, re_seq, readcount, reg_date, ip) ";
            sql += " VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num); // �۹�ȣ
            pstmt.setString(2, boardBean.getName());
            pstmt.setString(3, boardBean.getPasswd());
            pstmt.setString(4, boardBean.getSubject());
            pstmt.setString(5, boardBean.getContent());
            pstmt.setInt(6, boardBean.getRe_ref());     // re_ref �����׷�
            pstmt.setInt(7, boardBean.getRe_lev()+1);   // re_lev �鿩���� +1
            pstmt.setInt(8, boardBean.getRe_seq()+1);   // re_seq �׷쳻���� +1
            pstmt.setInt(9, 0);  // readcount ��ȸ��
            pstmt.setTimestamp(10, boardBean.getReg_date());
            pstmt.setString(11, boardBean.getIp());
           // ����
            pstmt.executeUpdate();
            
            con.commit();  // commit ���� ����
            con.setAutoCommit(true); // �⺻�������� �����ֱ�
            
        } catch (Exception e) {
            e.printStackTrace();
            try {
                con.rollback(); // ���� ���·� �ǵ�����
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            MyOracle.closeJDBC(con, pstmt, rs);
        }
    } // reInsertBoard()
    
    

} // class BoardDao


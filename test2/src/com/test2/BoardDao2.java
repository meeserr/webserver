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



// 싱글톤 패턴 적용(Singleton)
// 객체가 1개만 생성이 가능하도록 보장된 설계
public class BoardDao2 {

	private static BoardDao2 boardDao = new BoardDao2();
	private BoardDao2() {}
	public static BoardDao2 getInstance() {
		return boardDao;
	}
    // 답글쓰기
    public void reInsertBoard(BoardBean boardBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "";
        int num = 0; // 글번호
        
        try {
            con = MyOracle.getConnection();
            // 트랜잭션 관리 기법
            // 자동커밋을 수동커밋으로 제어함            
            con.setAutoCommit(false);
            
            // sql 그룹내의 답글 순서 재배치
            // update  re_seq
            sql = "UPDATE board SET re_seq=re_seq+1 WHERE re_ref=? AND re_seq > ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, boardBean.getRe_ref());
            pstmt.setInt(2, boardBean.getRe_seq());
            pstmt.executeUpdate();
            
            // 글번호num 구하기     max(num)+1
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
            
            // 답글 insert
            // re_ref그대로    re_lev 1증가   re_seq 1증가
            pstmt.close(); pstmt = null;
            sql = "INSERT INTO board (num, name, passwd, subject, content, re_ref, re_lev, re_seq, readcount, reg_date, ip) ";
            sql += " VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num); // 글번호
            pstmt.setString(2, boardBean.getName());
            pstmt.setString(3, boardBean.getPasswd());
            pstmt.setString(4, boardBean.getSubject());
            pstmt.setString(5, boardBean.getContent());
            pstmt.setInt(6, boardBean.getRe_ref());     // re_ref 같은그룹
            pstmt.setInt(7, boardBean.getRe_lev()+1);   // re_lev 들여쓰기 +1
            pstmt.setInt(8, boardBean.getRe_seq()+1);   // re_seq 그룹내순서 +1
            pstmt.setInt(9, 0);  // readcount 조회수
            pstmt.setTimestamp(10, boardBean.getReg_date());
            pstmt.setString(11, boardBean.getIp());
           // 실행
            pstmt.executeUpdate();
            
            con.commit();  // commit 문장 실행
            con.setAutoCommit(true); // 기본설정으로 돌려주기
            
        } catch (Exception e) {
            e.printStackTrace();
            try {
                con.rollback(); // 원래 상태로 되돌리기
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        } finally {
            MyOracle.closeJDBC(con, pstmt, rs);
        }
    } // reInsertBoard()
    
    

} // class BoardDao


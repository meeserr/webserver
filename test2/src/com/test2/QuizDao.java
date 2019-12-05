package com.test2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class QuizDao {
	
    public QuizBean getQuiz(int num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "";
        QuizBean quizBean = null;
        
        try {
            con = MyOracle.getConnection();
            // sql  num에 해당하는 정보 가져오기
            sql = "SELECT * FROM quiz WHERE num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            // 실행  rs 저장
            rs = pstmt.executeQuery();
            // rs 데이터 있으면 자바빈 객체생성
            // rs => 자바빈 저장
            if (rs.next()) {
                // 자바빈 객체생성. 기억장소할당
                quizBean = new QuizBean();
                // rs => 자바빈 저장
                quizBean.setQuiz(rs.getString("quiz"));
                quizBean.setAnswer(rs.getString("answer"));
                quizBean.setWhywrong(rs.getString("whywrong"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyOracle.closeJDBC(con, pstmt, rs);
        }
        return quizBean;
    } 
	
    public int IsRight(int num, String answer) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;  	
        String sql = "";
    	int check = 0;    	
    	try {
			con = MyOracle.getConnection();
			sql = "select * from quiz where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// rs 실행 저장
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if (rs.getString("answer").equals(answer)) {
					//pstmt.close();
					//pstmt = null;				
					// 실행
					//pstmt.executeUpdate();
					check = 1;
					 System.out.print( "answer: " + answer);
				} else if(answer == null){
		               check = -1;
	            }else {
					check = 0;
					System.out.print("answer: " +answer);
				}	
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyOracle.closeJDBC(con, pstmt, rs);
		}
    	return check;
    }
   
    
    public boolean lastQuiz(int quiznum) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;     
        String sql = "";
        int num=0;
             
       try {
         con = MyOracle.getConnection();
         sql = "select count(*) from quiz";
         pstmt = con.prepareStatement(sql);
         //pstmt.setInt(1, num);
         // rs 실행 저장
         rs = pstmt.executeQuery();
         
         if (rs.next()) {
            	num = rs.getInt(1); // 글이 있는경우. 최대값
         }else {
            	num = 1; // 글이 없는 경우
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         MyOracle.closeJDBC(con, pstmt, rs);
      }
       System.out.print("퀴즈 수" + num);
       
       
       if(num == quiznum) {
    	   return true; 
       }else
    	   return false;
    }
    
}


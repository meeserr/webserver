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
            // sql  num�� �ش��ϴ� ���� ��������
            sql = "SELECT * FROM quiz WHERE num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            // ����  rs ����
            rs = pstmt.executeQuery();
            // rs ������ ������ �ڹٺ� ��ü����
            // rs => �ڹٺ� ����
            if (rs.next()) {
                // �ڹٺ� ��ü����. �������Ҵ�
                quizBean = new QuizBean();
                // rs => �ڹٺ� ����
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
			// rs ���� ����
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if (rs.getString("answer").equals(answer)) {
					//pstmt.close();
					//pstmt = null;				
					// ����
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
         // rs ���� ����
         rs = pstmt.executeQuery();
         
         if (rs.next()) {
            	num = rs.getInt(1); // ���� �ִ°��. �ִ밪
         }else {
            	num = 1; // ���� ���� ���
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         MyOracle.closeJDBC(con, pstmt, rs);
      }
       System.out.print("���� ��" + num);
       
       
       if(num == quiznum) {
    	   return true; 
       }else
    	   return false;
    }
    
}


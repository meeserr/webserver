package com.test2;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class BoardDao {

	// �Խ��� ���Ѱ� �߰��ϱ�
	public void insertBoard(BoardBean boardBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int num = 0; // �۹�ȣ
		
		try {
			con = MyOracle.getConnection();
			// �۹�ȣ num���ϱ�. ���� ������� 1
			//   ���� �������  �ֱٱ۹�ȣ(��ȣ�� ����ū��)+1
			sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt(1) + 1; // ���� �ִ°��. �ִ밪+1
			} else {
				num = 1; // ���� ���� ���
			}
			
			pstmt.close();
			pstmt = null;
			// �ֱ�(�Ϲݱ�) num == re_ref ���� �Է�
			sql = "insert into board (num, name, passwd, subject, content, re_ref, re_lev, re_seq, readcount, reg_date, ip) ";
			sql += " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, boardBean.getName());
			pstmt.setString(3, boardBean.getPasswd());
			pstmt.setString(4, boardBean.getSubject());
			pstmt.setString(5, boardBean.getContent());
			pstmt.setInt(6, num);  // re_ref == num
			pstmt.setInt(7, 0);    // re_lev
			pstmt.setInt(8, 0);    // re_seq
			pstmt.setInt(9, 0);   // readcount ��ȸ��
			pstmt.setTimestamp(10, boardBean.getReg_date());
			pstmt.setString(11, boardBean.getIp());
			// ����
			pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			MyOracle.closeJDBC(con, pstmt, rs);
		}
		

	}  // insertBoard()



	// �Խ��� �۸�� ��������(����¡)
	public ArrayList<BoardBean> getBoards(int startRow, int endRow) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		int num =1;
		ArrayList<BoardBean> list = new ArrayList<>();
		try {
			con=MyOracle.getConnection();
		
			String sql1 = "select * from board order by num desc limit 0,5";
			ps = con.prepareStatement(sql1);
			//ps.setInt(1, startRow);
			//ps.setInt(2, endRow);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardBean boardBean = new BoardBean();
                // rs => �ڹٺ� ����
				boardBean.setContent(rs.getString("content"));
                boardBean.setIp(rs.getString("ip"));
                boardBean.setName(rs.getString("name"));
                boardBean.setNum(rs.getInt("num"));
                boardBean.setPasswd(rs.getString("passwd"));
                boardBean.setRe_lev(rs.getInt("re_lev"));
                boardBean.setRe_ref(rs.getInt("re_ref"));
                boardBean.setRe_seq(rs.getInt("re_seq"));
                boardBean.setReadcount(rs.getInt("readcount"));
                boardBean.setReg_date(rs.getTimestamp("reg_date"));
                boardBean.setSubject(rs.getString("subject"));		
                list.add(boardBean);
                }
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			MyOracle.closeJDBC(con, ps, rs);
		}
		return list;
	}
	

	// ��ü �۰��� ��������
	public int getBoardCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	String sql = "";
	int count = 0;
		
		try {
			con = MyOracle.getConnection();
			// sql  ��ü�۰��� ��������  select count()
			sql = "SELECT COUNT(*) FROM board ;";
			pstmt = con.prepareStatement(sql);
			// ����  rs
			rs = pstmt.executeQuery();
			// rs ������ ������ count ����
			if (rs.next()) {
				count = rs.getInt(1); // ������ �������
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyOracle.closeJDBC(con, pstmt, rs);
		}
		return count;
	} // getBoardCount()

   public void updateReadCount(int num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "";
        
        try 
        {
            con = MyOracle.getConnection();
            // sql  update num�� �ش��ϴ� readcount 1�����ϰ� ����
            sql = "UPDATE board SET readcount = readcount+1 WHERE num = ? ;";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            // ����
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyOracle.closeJDBC(con, pstmt, rs);
        }
    } // updateReadCount()	
    
    // ��1�� ��������. �۳��� �󼼺���.
    public BoardBean getBoard(int num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "";
        BoardBean boardBean = null;
        
        try {
            con = MyOracle.getConnection();
            // sql  num�� �ش��ϴ� ���� ��������
            sql = "SELECT * FROM board WHERE num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            // ����  rs ����
            rs = pstmt.executeQuery();
            // rs ������ ������ �ڹٺ� ��ü����
            // rs => �ڹٺ� ����
            if (rs.next()) {
                // �ڹٺ� ��ü����. �������Ҵ�
                boardBean = new BoardBean();
                // rs => �ڹٺ� ����
                boardBean.setContent(rs.getString("content"));
                boardBean.setIp(rs.getString("ip"));
                boardBean.setName(rs.getString("name"));
                boardBean.setNum(rs.getInt("num"));
                boardBean.setPasswd(rs.getString("passwd"));
                boardBean.setRe_lev(rs.getInt("re_lev"));
                boardBean.setRe_ref(rs.getInt("re_ref"));
                boardBean.setRe_seq(rs.getInt("re_seq"));
                boardBean.setReadcount(rs.getInt("readcount"));
                boardBean.setReg_date(rs.getTimestamp("reg_date"));
                boardBean.setSubject(rs.getString("subject"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyOracle.closeJDBC(con, pstmt, rs);
        }
        return boardBean;
    } // getBoard()
	
    // �Խ��� �� ����
    public int updateBoard(BoardBean boardBean) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;  	
        String sql = "";
    	int check = 0;
    	
    	try {
			con = MyOracle.getConnection();
			// sql num�� �ش��ϴ� passwd ��������
			sql = "select passwd from board where num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardBean.getNum());
			// rs ���� ����
			rs = pstmt.executeQuery();
			// rs ������ ������ �н����� �� ������
			// update num�� �ش��ϴ� name subject content ����
			// check = 1 (�������� �ǹ�)
			
			// �н����� Ʋ���� check = 0
			if (rs.next()) {
				if (boardBean.getPasswd().equals(rs.getString("passwd"))) {
					pstmt.close();
					pstmt = null;				
					sql = "update board set name=?, subject=?, content=? WHERE num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, boardBean.getName());
					pstmt.setString(2, boardBean.getSubject());
					pstmt.setString(3, boardBean.getContent());
					pstmt.setInt(4, boardBean.getNum());
					// ����
					pstmt.executeUpdate();
					
					check = 1;
				} else {
					check = 0;
				}	
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyOracle.closeJDBC(con, pstmt, rs);
		}
    	return check;
    } // updateBoard()

    
    //�� �����
    public int deleteBoard (int num, String passwd) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;  	
        String sql = "";
    	int check = 0;    	
    	try {
			con = MyOracle.getConnection();

			sql = "select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("passwd").equals(passwd)) {
					pstmt.close();
					pstmt = null;
					
					sql = "delete from board where num = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					
					check = 1;
				} else {
					check = 0;
				}	
			}
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyOracle.closeJDBC(con, pstmt, rs);
		}
    	
    	return check;
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
            pstmt.setInt(7, boardBean.getRe_ref());     // re_ref �����׷�
            pstmt.setInt(8, boardBean.getRe_lev()+1);   // re_lev �鿩���� +1
            pstmt.setInt(9, boardBean.getRe_seq()+1);   // re_seq �׷쳻���� +1
            pstmt.setInt(10, 0);  // readcount ��ȸ��
            pstmt.setTimestamp(11, boardBean.getReg_date());
            pstmt.setString(12, boardBean.getIp());
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


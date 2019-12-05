package com.test2;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class BoardDao {

	// 게시판 글한개 추가하기
	public void insertBoard(BoardBean boardBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int num = 0; // 글번호
		
		try {
			con = MyOracle.getConnection();
			// 글번호 num구하기. 글이 없을경우 1
			//   글이 있을경우  최근글번호(번호가 가장큰값)+1
			sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt(1) + 1; // 글이 있는경우. 최대값+1
			} else {
				num = 1; // 글이 없는 경우
			}
			
			pstmt.close();
			pstmt = null;
			// 주글(일반글) num == re_ref 같게 입력
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
			pstmt.setInt(9, 0);   // readcount 조회수
			pstmt.setTimestamp(10, boardBean.getReg_date());
			pstmt.setString(11, boardBean.getIp());
			// 실행
			pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {
			MyOracle.closeJDBC(con, pstmt, rs);
		}
		

	}  // insertBoard()



	// 게시판 글목록 가져오기(페이징)
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
                // rs => 자바빈 저장
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
	

	// 전체 글개수 가져오기
	public int getBoardCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	String sql = "";
	int count = 0;
		
		try {
			con = MyOracle.getConnection();
			// sql  전체글개수 가져오기  select count()
			sql = "SELECT COUNT(*) FROM board ;";
			pstmt = con.prepareStatement(sql);
			// 실행  rs
			rs = pstmt.executeQuery();
			// rs 데이터 있으면 count 저장
			if (rs.next()) {
				count = rs.getInt(1); // 데이터 있을경우
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
            // sql  update num에 해당하는 readcount 1증가하게 수정
            sql = "UPDATE board SET readcount = readcount+1 WHERE num = ? ;";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            // 실행
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyOracle.closeJDBC(con, pstmt, rs);
        }
    } // updateReadCount()	
    
    // 글1개 가져오기. 글내용 상세보기.
    public BoardBean getBoard(int num) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "";
        BoardBean boardBean = null;
        
        try {
            con = MyOracle.getConnection();
            // sql  num에 해당하는 정보 가져오기
            sql = "SELECT * FROM board WHERE num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, num);
            // 실행  rs 저장
            rs = pstmt.executeQuery();
            // rs 데이터 있으면 자바빈 객체생성
            // rs => 자바빈 저장
            if (rs.next()) {
                // 자바빈 객체생성. 기억장소할당
                boardBean = new BoardBean();
                // rs => 자바빈 저장
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
	
    // 게시판 글 수정
    public int updateBoard(BoardBean boardBean) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;  	
        String sql = "";
    	int check = 0;
    	
    	try {
			con = MyOracle.getConnection();
			// sql num에 해당하는 passwd 가져오기
			sql = "select passwd from board where num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardBean.getNum());
			// rs 실행 저장
			rs = pstmt.executeQuery();
			// rs 데이터 있으면 패스워드 비교 맞으면
			// update num에 해당하는 name subject content 수정
			// check = 1 (수정성공 의미)
			
			// 패스워드 틀리면 check = 0
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
					// 실행
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

    
    //글 지우기
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
            pstmt.setInt(7, boardBean.getRe_ref());     // re_ref 같은그룹
            pstmt.setInt(8, boardBean.getRe_lev()+1);   // re_lev 들여쓰기 +1
            pstmt.setInt(9, boardBean.getRe_seq()+1);   // re_seq 그룹내순서 +1
            pstmt.setInt(10, 0);  // readcount 조회수
            pstmt.setTimestamp(11, boardBean.getReg_date());
            pstmt.setString(12, boardBean.getIp());
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


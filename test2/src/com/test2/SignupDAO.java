package com.test2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.naming.Context;

public class SignupDAO {
	
	private static SignupDAO signupdao = new SignupDAO();
	public static SignupDAO getInstance() {
		return signupdao;
	}
	private SignupDAO() {}
	
	public ArrayList<SignupDTO> select(){
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		ArrayList<SignupDTO> list= new ArrayList<SignupDTO>();
		try {
			con = MyOracle.getConnection();
			sql = "SELECT * FROM signup";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
            	SignupDTO dto= new SignupDTO();
            	dto.setId(rs.getString("id"));
            	dto.setName(rs.getString("name"));
            	dto.setGender(rs.getString("gender"));
            	dto.setPassword(rs.getString("password"));
            	dto.setPhone(rs.getString("phone"));
            	list.add(dto);
            }
		}catch(Exception e) {
            e.printStackTrace();
        } finally {
            MyOracle.closeJDBC(con, pstmt, rs);
        }return list;
	}
	
	public void insert(SignupDTO signupdto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		try {
			con = MyOracle.getConnection();
			sql = "INSERT INTO signup(id,name,password,gender,phone) VALUES(?,?,?,?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,signupdto.getId());
            pstmt.setString(2,signupdto.getName());
            pstmt.setString(3,signupdto.getPassword());
            pstmt.setString(4,signupdto.getGender());
            pstmt.setString(5,signupdto.getPhone());
            pstmt.executeUpdate();
		}catch(Exception e) {
            e.printStackTrace();
        } finally {
            MyOracle.closeJDBC(con, pstmt, rs);
        }
	}
	
	public int userCheck(String id,String password) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String dbpasswd="";
		int x=-1;
		try {
			con = MyOracle.getConnection();
			sql = "SELECT password FROM signup WHERE ID=?"; 
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dbpasswd=rs.getString("password");
				if(dbpasswd.equals(password))
					{x=1;}
				else
					{x=0;}
			}
			else
				{x=-1;}
		}catch(Exception e) {
            e.printStackTrace();
        } finally {
            MyOracle.closeJDBC(con, pstmt, rs);
        }return x;
	}
	
	public SignupDTO getInfo (String id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "";
        SignupDTO signupdto = null;
        
        try {
            con = MyOracle.getConnection();
            sql = "SELECT * FROM signup WHERE ID=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                signupdto = new SignupDTO();
                signupdto.setName(rs.getString("Name"));
                signupdto.setGender(rs.getString("Gender"));
                signupdto.setPhone(rs.getString("phone"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyOracle.closeJDBC(con, pstmt, rs);
        }
        return signupdto;
    } 
}

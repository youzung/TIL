package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.vo.NewsVO;

public class NewsDAO {
	private Connection connectDB() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbctest", "jdbctest");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	private void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			conn.close();
			stmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	private void close(Connection conn, PreparedStatement pstmt) {
		try {
			conn.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public boolean insert( NewsVO vo) {
		Connection conn = connectDB();
		PreparedStatement pstmt=null;
		boolean result = true;
		try{pstmt = conn.prepareStatement("insert into news "
					+ "values(news_seq.nextval,?,?,?,to_char(sysdate,'yyyy-mm-dd'),0)");
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.executeUpdate();
		}catch(SQLException e){
			result = false;
			e.printStackTrace();
		}finally {
			close(conn, pstmt);
		}
		return result;
	}
	
	
	public boolean update(NewsVO vo) {
		Connection conn = connectDB();
		PreparedStatement pstmt = null;
		boolean result = true;
		try{pstmt = conn.prepareStatement("update news set"
					+ " writer=? , title=? , content=? , "
					+ "writedate=to_char(sysdate,'yyyy-mm-dd') where id=?");
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setInt(4, vo.getId());
			pstmt.executeUpdate();
		}catch(SQLException e){
			result = false;
			e.printStackTrace();
		}finally {
			close(conn, pstmt);
		}
		return result;
	}
	
	
	public boolean delete(int id) {
		Connection conn = connectDB();
		PreparedStatement pstmt = null;
		boolean result = true;
		try{pstmt = conn.prepareStatement("delete from news "
					+ "where id=?");
			pstmt.setInt(1,id); 
			int deleteNum = pstmt.executeUpdate();
			if(deleteNum !=1)
				result = false;
		}catch(SQLException e){
			result = false;
			e.printStackTrace();
		}finally {
			close(conn, pstmt);
		}
		return result;
	}
	
	
	public ArrayList< NewsVO > listAll(){	
		Connection conn = connectDB();
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<NewsVO> list = new ArrayList<>();
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery
					("select id,writer,title,content,to_char(writedate,'yyyy-mm-dd'),cnt from news");
			NewsVO vo;
			while(rs.next()) {
				vo = new NewsVO();
				vo.setId(rs.getInt(1));
				vo.setWriter(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setWritedate(rs.getString(5));
				vo.setCnt(rs.getInt(6));
				list.add(vo);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}	finally {
			close(conn, stmt, rs);
		}	
		return list;
	}
	
	
	  public NewsVO listOne(int id) {
		Connection conn = connectDB();
		Statement stmt = null;
		ResultSet rs = null;
		NewsVO vo = new NewsVO();
		try{
			stmt = conn.createStatement();
			stmt.executeUpdate("update news set cnt=cnt+1 where id="+id);
			rs = stmt.executeQuery
					("select id,writer,title,content,cnt from news where id="+id);
			while(rs.next()) {
				vo.setId(rs.getInt(1));
				vo.setWriter(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setContent(rs.getString(4));	
				vo.setCnt(rs.getInt(5));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(conn, stmt, rs);
		}	
		return vo;
	  }
}

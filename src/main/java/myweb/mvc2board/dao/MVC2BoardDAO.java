package myweb.mvc2board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import myweb.board1.Board1DTO;
import myweb.jdbc.DBConnPool;
import myweb.mvc2board.dto.MVC2BoardDTO;

public class MVC2BoardDAO {

	DBConnPool connPool;
	Connection conn;
	
	public int selectCount(Map<String, Object> map) {
		
		int totalCount = 0;
		PreparedStatement pstmt;
		ResultSet rs;
		
		String sql = "Select count (*) from mvcboard";
		if(map.get("searchWord") !=null) { //게시물 조회시에도 활용
			sql += " where " + map.get("searchField") + " Like '%" + map.get("searchWord") + "%'";
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1); //조회된 ROW 수 리턴
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	public List<MVC2BoardDTO> selectList(Map<String,Object> map){
		List<MVC2BoardDTO> list = new ArrayList<MVC2BoardDTO>();
		PreparedStatement pstmt;
		ResultSet rs;
		

		String sql = "select * from("
				+ "select TB.*, rownum rnum from("
				+ "select * from mvcboard";
		if(map.get("searchWord") != null) {
			sql += " where lower(" + map.get("searchField") + ") Like lower('%" + map.get("searchWord")
				+ "%')";
		}
		sql +=  " order by idx desc) TB ) where rnum between ? and ?";
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			pstmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			rs=pstmt.executeQuery();
			
			//모든 row 를 순회하면서 DTO 값 세팅 및 list에 add
			while(rs.next()) {
				//하나의 Row 가 여기서부터 검색 시작, BoardDTO를 여기서 생성
				MVC2BoardDTO dto = new MVC2BoardDTO();
				
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setIdx(rs.getInt("idx"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getInt("visitcount"));
				dto.setName(rs.getString("name"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPass(rs.getString("pass"));
				
				//모두 세팅된 dto 를 add
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int insertWrite(MVC2BoardDTO dto) {
		int res = 0;
		String insertSql = "Insert into mvcboard (idx, title, content, name, ofile, sfile, pass) "
				+ "values(BOARD1_SEQ.nextVal, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(insertSql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getOfile());
			pstmt.setString(5, dto.getSfile());
			pstmt.setString(6, dto.getPass());
			res = pstmt.executeUpdate();
			
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			try {
				conn.rollback();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return res;
	}
	
	public MVC2BoardDTO selectView(String idx) {
		MVC2BoardDTO dto = new MVC2BoardDTO();
		
		//이 메소드가 호출된다는 것은 조회가 발생했다는 것. 따라서 visit_count 를 먼저 1 증가시켜줌.
		String upVisitCnt = "update mvcboard set visitcount = visitcount + 1 where idx = ?";
		
		//조인으로 해당 글 목록과 작성자의 모든 경로 리턴.
		String selSql = "select m.* from mvcboard m where m.idx = ?";
		
		PreparedStatement pstmt;
		ResultSet rs;
		
		try {
			//조회 증가 쿼리 실행
			pstmt = conn.prepareStatement(upVisitCnt);
			pstmt.setInt(1, Integer.parseInt(idx));
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(selSql);
			pstmt.setInt(1, Integer.parseInt(idx));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setIdx(rs.getInt(1));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getInt("visitcount"));
				dto.setName(rs.getString("name"));
				dto.setDowncount(rs.getInt("downcount"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPass(rs.getString("pass"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return dto;
	}
	
	public int modifyWrite(String idx, String newContent, String newTitle) {
		int res = 0;
		String upSql = "update mvcboard set content=?, title = ? where idx = ?";

		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(upSql);
			pstmt.setString(1, newContent);
			pstmt.setString(2, newTitle);
			pstmt.setInt(3, Integer.parseInt(idx));
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			try {
				conn.rollback();
			} catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
		return res;
	}
	
	public int deleteWrite(String idx) {
		int res = 0;
		String delSql = "delete from board where num = ?";
		
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(delSql);
			pstmt.setInt(1, Integer.parseInt(idx));

			res = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return res;
	}
	
	public void increaseDownCnt(String idx) {
		String upDownCnt = "update mvcboard set downcount = downcount + 1 where idx = ?";
		
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(upDownCnt);
			pstmt.setInt(1, Integer.parseInt(idx));
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public MVC2BoardDAO() {
		connPool = new DBConnPool();
		conn = connPool.conn;
	}
	
	
	public void close() {
		connPool.close();
	}
}

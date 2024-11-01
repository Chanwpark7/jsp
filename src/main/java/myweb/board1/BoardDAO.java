package myweb.board1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import myweb.jdbc.DBConnPool;

public class BoardDAO {

	DBConnPool connPool;
	Connection conn;
	
	//게시물의 수를 리턴하는 메서드 정의
	public int selectCount(Map<String, Object> map) {
		
		int totalCount = 0;
		PreparedStatement pstmt;
		ResultSet rs;
		
		String sql = "Select count (*) from board";
		if(map.get("searchWork") !=null) { //게시물 조회시에도 활용
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

	//list 페이지에 글 목록을 넘기는 메소드 정의 리턴은 일단 전체 목록을 다 리턴하는걸로 함.
	public List<Board1DTO> selectList(Map<String,Object> map){
		List<Board1DTO> list = new ArrayList<Board1DTO>();
		PreparedStatement pstmt;
		ResultSet rs;
		
		String sql = "Select * from board";
		if(map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") + " Like '%" + map.get("searchWord")
				+ "%'";
		}
		sql +=  " order by num desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			//모든 row 를 순회하면서 DTO 값 세팅 및 list에 add
			while(rs.next()) {
				//하나의 Row 가 여기서부터 검색 시작, BoardDTO를 여기서 생성
				Board1DTO dto = new Board1DTO();
				
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setNum(rs.getInt("num"));
				dto.setPostDate(rs.getDate("post_date"));
				dto.setVisitCount(rs.getInt("visit_count"));
				
				//모두 세팅된 dto 를 add
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public BoardDAO() {
		connPool = new DBConnPool();
		conn = connPool.conn;
	}
	
	
	public void close() {
		connPool.close();
	}
}

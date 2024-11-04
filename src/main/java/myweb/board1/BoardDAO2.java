package myweb.board1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import myweb.jdbc.DBConnPool;

public class BoardDAO2 {

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
		
		String sql = "select * from("
				+ "select TB.*, rownum rnum from("
				+ "select * from board";
		if(map.get("searchWord") != null) {
			sql += " where lower(" + map.get("searchField") + ") Like lower('%" + map.get("searchWord")
				+ "%')";
		}
		sql +=  " order by num desc) TB ) where rnum between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			pstmt.setString(1, map.get("start").toString());
			pstmt.setString(2, map.get("end").toString());
			
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
	
	//신규 글 insert 처리 메소드 정의. process.jsp 에 insert 된 row 수 리턴
	public int insertWrite(Board1DTO dto) {
		int res = 0;
		String insertSql = "Insert into board (num, title, content, id) values(BOARD1_SEQ.nextVal, ?, ?, ?)";
		
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(insertSql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getId());
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			try {
				conn.rollback();
			} catch (Exception e2) {
				System.out.println(e.getMessage());
			}
		}
		return res;
	}
	
	//글 상세 페이지에서 처리할 메소드 정의
	//글 번호에 해당하는 row 를 select 한 후 dto 에 담고 이를 view.jsp 에 리턴합니다.
	public Board1DTO selectView(String num) {
		Board1DTO dto = new Board1DTO();
		
		//이 메소드가 호출된다는 것은 조회가 발생했다는 것. 따라서 visit_count 를 먼저 1 증가시켜줌.
		String upVisitCnt = "update board set visit_count = visit_count + 1 where num = ?";
		
		//조인으로 해당 글 목록과 작성자의 모든 경로 리턴.
		String selSql = "select b.* , m.* from member m, board b where m.id=b.id and b.num = ?";
		
		PreparedStatement pstmt;
		ResultSet rs;
		
		try {
			//조회 증가 쿼리 실행
			pstmt = conn.prepareStatement(upVisitCnt);
			pstmt.setInt(1, Integer.parseInt(num));
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(selSql);
			pstmt.setInt(1, Integer.parseInt(num));
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getInt(1));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostDate(rs.getDate("post_date"));
				dto.setId(rs.getString("id"));
				dto.setVisitCount(rs.getInt("visit_count"));
				dto.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return dto;
	}
	
	public int modifyWrite(String num, String newContent, String newTitle) {
		int res = 0;
		String upSql = "update board set content=?, title = ? where num = ?";

		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(upSql);
			pstmt.setString(1, newContent);
			pstmt.setString(2, newTitle);
			pstmt.setInt(3, Integer.parseInt(num));
			res = pstmt.executeUpdate();
			
			conn.commit();
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
	
	public int deleteWrite(String num) {
		int res = 0;
		String delSql = "delete from board where num = ?";
		
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(delSql);
			pstmt.setInt(1, Integer.parseInt(num));

			res = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return res;
	}
	
	public BoardDAO2() {
		connPool = new DBConnPool();
		conn = connPool.conn;
	}
	
	
	public void close() {
		connPool.close();
	}
}

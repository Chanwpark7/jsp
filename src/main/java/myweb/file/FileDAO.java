package myweb.file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import myweb.jdbc.DBConnPool;

public class FileDAO {

	DBConnPool connPool;
	Connection conn;
	
	public FileDAO() {
		connPool = new DBConnPool();
		conn = connPool.conn;
	}
	
	
	public void close() {
		connPool.close();
	}
	
	public int insertFile(FileDTO dto) {
		int res = 0;
		String sql = "insert into myfile(idx, title, ofile, sfile, cate) values (FILE_SEQ.nextval, ?, ?, ?, ?)";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getOfile());
			pstmt.setString(3, dto.getSfile());
			pstmt.setString(4, dto.getCate());
			
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return res;
	}
	
	//파일 리스트 전달 메소드 정의
	public List<FileDTO> getFileList() {
		List<FileDTO> list = new ArrayList<FileDTO>();
		String sql = "select * from myfile order by idx desc";
		PreparedStatement pstmt;
		ResultSet rs;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FileDTO dto = new FileDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setCate(rs.getString("cate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPostdate(rs.getDate("postdate"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
}
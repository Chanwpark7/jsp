package myweb.membership;
/*
 * DAO : Data(Base) Access Object
 * 
 * 자바 웹프로그래밍은 대부분이 DAO, DTO, JSP or JSP 역할을 하는 다른 페이지로 구성됨.
 * 
 * DTO 는 DB에 연동되는 사용자의 데이터를 갖고 있는 객체로 사용하고,
 * DAO 는 DB에 커넥션을 맺고 CRUD 를 하는 기능을 메소드로 정의해서 JSP에서
 * 호출해서 사용하도록 함.
 * JSP 는 위 두 객체를 서로 묶어주는 중간 인터페이스 역할만 하도록 설계함.
 * 즉 사용자 요청은 가급적 DTO에 매핑시키고 이걸 DAO 의 목적별로 정의된 메소드에 연결하고
 * DAO 는 JSP 에서 호출하면서 주어지는 DTO, Param 및 기타 부서 정보를 바탕으로
 * DB에 쿼리를 날린 후 결과를 JSP 에 넘겨주는 역할을 함.
 * 
 * JSP는 DAO 메소드 호출 후 리턴되는 또는 리턴이 없는 메소드인 경우엔 당연히 리턴이 없음.
 * 결과를 사용자에게 출력해주는 역할만 담당함.
 * 
 * 이렇게 분리되는 목적은 최소한의 자바 구현코드만 JSP에 남기고 자바 구현 로직은 모두
 * 자바 클래스로 분리하는 데에 있음.
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import myweb.jdbc.DBConnPool;

public class MemberDAO {

	//private static MemberDAO dao = new MemberDAO();
	DBConnPool connPool;
	Connection conn;
	
	public MemberDAO() {
		connPool = new DBConnPool();
		conn = connPool.conn;
	}
	
//	public static MemberDAO getMemberDAO() {
//		return dao;
//	}
	
	public void close() {
		connPool.close();
	}

	//사용자가 로그인하는 기능의 메소드 정의
	public MemberDTO login(MemberDTO dto) {
		//dto 에 담긴 내용을 기준으로 select 후 결과를 dto 내부에 담아서 리턴시킴.
		//만약 로그인 정보가 틀린경우엔 null을 리턴시킴.
		
		//id 에 해당하는 모든 정보를 리턴하는 쿼리 작성
		String sql = "select id, pw, name, reg_date from member where id = ?";
		MemberDTO returnDTO;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			ResultSet rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				//만약 row 가 존재한다면 ID 는 맞음. 암호 검증
				String pw = rs.getString("pw");
				if(pw.equals(dto.getPw())) {//사용자가 전송한 암호와 같은지 검증
					//ID 와 PW 모두 OK DTO 에 모든 데이터 set
					returnDTO = new MemberDTO();
					returnDTO.setId(rs.getString("id"));
					returnDTO.setPw(rs.getString("pw"));
					returnDTO.setName(rs.getString("name"));
					returnDTO.setReg_date(rs.getDate("reg_date"));
					return returnDTO;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		close();//사용요소 모두 종료
		
		return null;
	}
	
	public int insertData(MemberDTO dto) {
		String sql = "Insert into Member values(?,?,?,sysdate)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		close();
		return -1; //예외나 insert 오류시 -1
	}
	
	//비밀번호 업데이트 메소드 정의
	public boolean updatePw(MemberDTO dto, String oldPw) {
		String selSql = "select pw from member where id = ?";
		String upSql = "update member set pw = ? where id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(selSql);
			pstmt.setString(1, dto.getId());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String pw = rs.getString("pw");
				if(pw.equals(oldPw)) {//맞으면 변경
					pstmt = conn.prepareStatement(upSql);
					pstmt.setString(1, dto.getPw());
					pstmt.setString(2, dto.getId());
					pstmt.executeUpdate();
					
					return true;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		close();
		return false;
	}
}

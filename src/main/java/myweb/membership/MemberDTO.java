package myweb.membership;
//id, pw, name, 가입일(reg_date)를 관리하는 DTO

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class MemberDTO {

	private String id;
	private String pw;
	private String name;
	private Date reg_date;
}

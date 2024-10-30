package myweb.common;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Member {

	private String id;
	private String pw;
	private char grade;
}

package myweb.board1;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

//게시판 담당 DTO
@NoArgsConstructor
@Data
public class Board1DTO {

	private int num;
	private String title;
	private String content;
	private String id;
	private Date postDate;
	private int visitCount;
	private String name;
}

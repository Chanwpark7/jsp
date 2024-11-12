package myweb.mvc2board.dto;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class MVC2BoardDTO {

	private int idx;
	private int downcount;
	private int visitcount;
	private Date postdate;
	private String name;
	private String title;
	private String content;
	private String ofile;
	private String sfile;
	private String pass;
}

package myweb.file;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class FileDTO {
	
	private int idx;
	private String title;
	private String ofile;
	private String sfile;
	private String cate;
	private Date postdate;
}

package myweb.common;

/*
 * 이 클래스는 list 페이지에서 던져주는 값을 기준으로 글 목록 수, 페이지 번호, 블락 번호, 페이지넘, 요청 URL을 리턴하는 메소드를 구현함.
 */
public class BoardPage {

	//111개 db, 10개의 글 목록, 한 블락은 5, pageNum = 1, list.jsp
	public static String pagingStr(int totalCnt, int pageSize, int blockPage, int pageNum, String reqUrl) {
		String pageStr = "";
		int totalPage = (int)(Math.ceil((double)totalCnt/pageSize));//12
		
		//이전 페이지 블락 바로가기 생성. 1~5 페이지까지 요청을 하면 pageTemp 의 값은 항상 1
		//그 이상은 값이 바뀜
		int pageTemp = (((pageNum-1)/blockPage)*blockPage)+1;//5n + 1
		if(pageTemp != 1) {//1페이지가 속한 블락이 아니라면
			pageStr += "<a href='"+reqUrl+"?pageNum=1'>[첫페이지]</a>";
			pageStr += "&nbsp;";//공백 두기
			pageStr += "<a href='"+reqUrl+"?pageNum="+(pageTemp - 1)+"'>[이전블락]</a>";
		}
		
		//각 페이지의 번호 생성
		int blockCount = 1;
		while(blockCount <= blockPage && pageTemp <= totalPage) {
			if(pageTemp == pageNum) {
				//현재 페이지는 링크 제외
				pageStr += "&nbsp;" + pageTemp + "&nbsp;";
			}else {
				pageStr += "&nbsp;<a href = '" + reqUrl + "?pageNum="+pageTemp+"'>" + pageTemp+ "</a>&nbsp";
			}
			pageTemp++;
			blockCount++;
		}
		
		//다음 페이지 블락 생성
		if(pageTemp<=totalPage) {
			pageStr += "<a href = '"+reqUrl+"?pageNum="+ pageTemp+"'>[다음블락]</a>";
			pageStr += "&nbsp;";
			pageStr += "<a href = '"+reqUrl+"?pageNum="+ totalPage+"'>[마지막페이지]</a>";
		}
		return pageStr;
	}
	
	//조회 후 출력되는 페이징
	public static String pagingStr2(int totalCnt, int pageSize, int blockPage, int pageNum, String reqUrl,String searchWord,String searchField) {
		String pageStr = "";
		int totalPage = (int)(Math.ceil((double)totalCnt/pageSize));//12
		
		//이전 페이지 블락 바로가기 생성. 1~5 페이지까지 요청을 하면 pageTemp 의 값은 항상 1
		//그 이상은 값이 바뀜
		int pageTemp = (((pageNum-1)/blockPage)*blockPage)+1;//5n + 1
		if(pageTemp != 1) {//1페이지가 속한 블락이 아니라면
			pageStr += "<a href='"+reqUrl+"?pageNum=1&searchWord="+searchWord+"&searchField="+searchField+"'>[첫페이지]</a>";
			pageStr += "&nbsp;";//공백 두기
			pageStr += "<a href='"+reqUrl+"?pageNum="+(pageTemp - 1)+"&searchWord="+searchWord+"&searchField="+searchField+"'>[이전블락]</a>";
		}
		
		//각 페이지의 번호 생성
		int blockCount = 1;
		while(blockCount <= blockPage && pageTemp <= totalPage) {
			if(pageTemp == pageNum) {
				//현재 페이지는 링크 제외
				pageStr += "&nbsp;" + pageTemp + "&nbsp;";
			}else {
				pageStr += "&nbsp;<a href = '" + reqUrl + "?pageNum="+pageTemp+"&searchWord=" + searchWord + "&searchField="+searchField+"'>" + pageTemp+ "</a>&nbsp";
			}
			pageTemp++;
			blockCount++;
		}
		
		//다음 페이지 블락 생성
		if(pageTemp<=totalPage) {
			pageStr += "<a href = '"+reqUrl+"?pageNum="+ pageTemp+"&searchWord="+searchWord+"&searchField="+searchField+"'>[다음블락]</a>";
			pageStr += "&nbsp;";
			pageStr += "<a href = '"+reqUrl+"?pageNum="+ totalPage+"&searchWord="+searchWord+"&searchField="+searchField+"'>[마지막페이지]</a>";
		}
		return pageStr;
	}
}

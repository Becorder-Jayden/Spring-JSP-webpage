package Domain;

import java.net.URLEncoder;

public class PageMaker {
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 5;		// 페이징 숫자 갯수
	private SearchCriteria scri;
	
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public SearchCriteria getScri() {
		return scri;
	}
	public void setScri(SearchCriteria scri) {
		this.scri = scri;
	}
	

	// Q. 무엇을 위한 매서드? A. 페이징 
	public void calcData() {				// Q. 자바에서 나누기는 정수부분만 가져오는가? A. 그렇다 1/3 = 0, 1/(double)3 = 0.33
		endPage = (int) (Math.ceil(scri.getPage()/(double)displayPageNum) * displayPageNum);
		
		startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int) Math.ceil(totalCount/(double)scri.getPerPageNum());
		
		// startPage, endPage : < 3 4 5 6 7 > 일 때의 3, 7. 화면에 보여지는 마지막 페이지 번호
		// tempEndPage = 최종적인 마지막 페이지 
		
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = (startPage == 1) ? false : true;
		next = (endPage*scri.getPerPageNum() >= totalCount) ? false : true;
	}
	
	
	// Q. 어떻게 작동하는 매서드인지 확인해야 함 - 페이징
	public String encoding(String keyword) {
		String str = "";
		 	
		try {
			if (keyword != null) {
				str = URLEncoder.encode(keyword, "UTF-8");
			}
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return str;
	}
}

package Domain;

public class Criteria {
	private int page;
	private int perPageNum;

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if (perPageNum < 0 || perPageNum > 100) {		// Q.의미하는 바는?
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}

	public Criteria() {							// Q.의미하는 바는? A. 게시판 세로 글 갯수
		this.page = 1;
		this.perPageNum = 20;				// 한 화면에 출력되는 게시글의 갯수와 일치시켜야 함
	}
}

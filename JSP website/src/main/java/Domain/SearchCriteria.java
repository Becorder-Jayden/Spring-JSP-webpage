package Domain;

public class SearchCriteria extends Criteria {
	private String searchType;
	private String keyword;
	private String category;
	private String fbidx;


	public SearchCriteria() {
		this.searchType="";
		this.keyword="";
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	// 카테고리 
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}

	
	// 5/30 추가 
	public String getBidx() {
		return fbidx;
	}
	
	public void setBidx(String bidx) {
		this.fbidx = bidx;
	}
}

package Domain;

public class SearchCriteria extends Criteria {
	private String searchType;
	private String keyword;
	private String category;
	

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
	
}

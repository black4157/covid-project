package cdc.go.domain;

//새로 추가, 검색에 사용할 인자, 게시판에서 criteria에서 응용 
public class WorldSearch{
	private String location;

	public WorldSearch(){
		this.location = "Afghanistan"; //초기 검색값
	}
	
	//setter, getter tostring
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "WorldSearch [location=" + location + "]";
	}
	
}

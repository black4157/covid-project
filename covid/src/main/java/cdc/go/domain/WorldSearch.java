package cdc.go.domain;

//���� �߰�, �˻��� ����� ����, �Խ��ǿ��� criteria���� ���� 
public class WorldSearch{
	private String location;

	public WorldSearch(){
		this.location = "Afghanistan"; //�ʱ� �˻���
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

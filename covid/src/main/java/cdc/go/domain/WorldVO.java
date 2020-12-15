package cdc.go.domain;

import java.util.Date;

public class WorldVO {
	private String iso_code;
	private String location;
	private Date date;
	private int total_cases;
	private int new_cases;
	private int total_deaths;
	private int new_deaths;
	private int total_tests;
	private int new_tests;
	
	public String getIso_code() {
		return iso_code;
	}
	public void setIso_code(String iso_code) {
		this.iso_code = iso_code;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getTotal_cases() {
		return total_cases;
	}
	public void setTotal_cases(int total_cases) {
		this.total_cases = total_cases;
	}
	public int getNew_cases() {
		return new_cases;
	}
	public void setNew_cases(int new_cases) {
		this.new_cases = new_cases;
	}
	public int getTotal_deaths() {
		return total_deaths;
	}
	public void setTotal_deaths(int total_deaths) {
		this.total_deaths = total_deaths;
	}
	public int getNew_deaths() {
		return new_deaths;
	}
	public void setNew_deaths(int new_deaths) {
		this.new_deaths = new_deaths;
	}
	public int getTotal_tests() {
		return total_tests;
	}
	public void setTotal_tests(int total_tests) {
		this.total_tests = total_tests;
	}
	public int getNew_tests() {
		return new_tests;
	}
	public void setNew_test(int new_tests) {
		this.new_tests = new_tests;
	}
	
	@Override
	public String toString() {
		return "WorldVo [iso_code=" + iso_code + ", location=" + location + ", date=" + date + ", total_cases="
				+ total_cases + ", new_cases=" + new_cases + ", total_deaths=" + total_deaths + ", new_deaths="
				+ new_deaths + ", total_tests=" + total_tests + ", new_tests=" + new_tests + "]";
	}
}

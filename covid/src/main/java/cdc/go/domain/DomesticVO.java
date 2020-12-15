package cdc.go.domain;

import java.util.Date;

public class DomesticVO {
	private Date today;
	private int total;
	private int infect_total;
	private int infected;
	private int released;
	private int dead;
	private int checked;
	private int negative;
	
	public Date getToday() {
		return today;
	}
	public void setToday(Date today) {
		this.today = today;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getInfect_total() {
		return infect_total;
	}
	public void setInfect_total(int infect_total) {
		this.infect_total = infect_total;
	}
	public int getInfected() {
		return infected;
	}
	public void setInfected(int infected) {
		this.infected = infected;
	}
	public int getReleased() {
		return released;
	}
	public void setReleased(int released) {
		this.released = released;
	}
	public int getDead() {
		return dead;
	}
	public void setDead(int dead) {
		this.dead = dead;
	}
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	public int getNegative() {
		return negative;
	}
	public void setNegative(int negative) {
		this.negative = negative;
	}
	
	@Override
	public String toString() {
		return "domestic [today=" + today + ", total=" + total + ", infect_total=" + infect_total + ", infected="
				+ infected + ", released=" + released + ", dead=" + dead + ", checked=" + checked + ", negative="
				+ negative + "]";
	}
}

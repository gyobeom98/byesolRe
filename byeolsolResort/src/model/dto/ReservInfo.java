package model.dto;

import java.time.LocalDate;

public class ReservInfo {
	
	private String userId;
	
	private String concept;
	
	private String userName;
	
	private LocalDate startDate;
	
	private LocalDate endDate;
	
	private int totalPrice;
	
	private int peopleCount;
	
	public ReservInfo() {}

	public ReservInfo(String userId, String concept, String userName, LocalDate startDate, LocalDate endDate,
			int totalPrice, int peopleCount) {
		super();
		this.userId = userId;
		this.concept = concept;
		this.userName = userName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.totalPrice = totalPrice;
		this.peopleCount = peopleCount;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getConcept() {
		return concept;
	}

	public void setConcept(String concept) {
		this.concept = concept;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public LocalDate getEndDate() {
		return endDate;
	}

	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getPeopleCount() {
		return peopleCount;
	}

	public void setPeopleCount(int peopleCount) {
		this.peopleCount = peopleCount;
	}

	@Override
	public String toString() {
		return "ReservInfo [userId=" + userId + ", concept=" + concept + ", userName=" + userName + ", startDate="
				+ startDate + ", endDate=" + endDate + ", totalPrice=" + totalPrice + ", peopleCount=" + peopleCount
				+ "]";
	}
	
	

}

package model.dto;

import java.time.LocalDateTime;

public class Event {
	
	private int id;
	
	private String title;
	
	private String imgPath;
	
	private LocalDateTime regDate;
	
	public Event() {}

	public Event(int id, String title, String imgPath, LocalDateTime regDate) {
		super();
		this.id = id;
		this.title = title;
		this.imgPath = imgPath;
		this.regDate = regDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public LocalDateTime getRegDate() {
		return regDate;
	}

	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Question [id=" + id + ", title=" + title + ", imgPath=" + imgPath + ", regDate=" + regDate + "]";
	}
	
	
	
}

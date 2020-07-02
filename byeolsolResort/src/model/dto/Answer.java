package model.dto;

public class Answer {
	private int id;
	private String title;
	private String message;
	private int questionId;
	private String writer;

	public Answer() {}

	public Answer(int id, String title, String message, int questionId, String writer) {
		super();
		this.id = id;
		this.title = title;
		this.message = message;
		this.questionId = questionId;
		this.writer = writer;
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

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getQuestionId() {
		return questionId;
	}

	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "Answer [id=" + id + ", title=" + title + ", message=" + message + ", questionId=" + questionId
				+ ", writer=" + writer + "]";
	}

	
}

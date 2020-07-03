package model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.dto.Question;

public interface QuestionMapper {
	
	public void insertQuestion(Question question);
	
	public void updateQuestion(Question question);
	
	public void deleteQuestion(int id);
	
	public Question selectQuestion(int id);
	
	public List<Question> selectQuestionListByWriterWithLimit(@Param("writer")String writer, @Param("firstRow")int firstRow, @Param("questionCountPerPage")int questionCountPerPage);
	
	public List<Question> selectQuestionList();
	
	public int countQuestion();

	public List<Question> selectQuestionByWriter();
	
	
}

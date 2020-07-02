package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.dto.Question;
import model.mapper.AnswerMapper;
import model.mapper.QuestionMapper;
import model.view.QuestionView;

@Service("questionService")
public class QuestionService {

	private static final int QUESTION_COUNT_PER_PAGE = 5;
	
	@Autowired
	QuestionMapper questionMapper;
	
	
	public QuestionView getQuestionView(int pageNum , String writer) {
		QuestionView questionView = null;
		
		int firstRow = 0;
		List<Question> questionList = null;
		
		int questionCnt = questionMapper.countQuestion();
		
		if(questionCnt > 0) {
			firstRow = (pageNum-1) * QUESTION_COUNT_PER_PAGE;
			questionList = questionMapper.selectQuestionListByWriterWithLimit(writer, firstRow, QUESTION_COUNT_PER_PAGE);
		} else {
			pageNum = 0;
		}
		
		questionView = new QuestionView(questionCnt, pageNum, firstRow, QUESTION_COUNT_PER_PAGE, questionList);
		return questionView;
	}
	
	public void addQuestion(Question question) {
		questionMapper.insertQuestion(question);
	}
	
	public Question selectQuestionById(int id) {
		return questionMapper.selectQuestion(id);
	}

	public void updateQuestion(Question question) {
		questionMapper.updateQuestion(question);
	}

	public void deleteQuestion(int id) {
		questionMapper.deleteQuestion(id);
	}
	
	
}

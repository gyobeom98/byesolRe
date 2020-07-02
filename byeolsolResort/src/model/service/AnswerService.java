package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.dto.Answer;
import model.mapper.AnswerMapper;
import model.view.AnswerView;

@Service("answerServicec")
public class AnswerService {

	private static final int ANSWER_COUNT_PER_PAGE = 5;
	
	@Autowired
	AnswerMapper answerMapper;
	
	public AnswerView getAnswerView(int pageNum, int questionId) {
		AnswerView answerView = null;
		
		int firstRow = 0;
		List<Answer> answerList = null;
		int answerCnt = answerMapper.countAnswer();
		if(answerCnt>0) {
			firstRow = (pageNum-1)*ANSWER_COUNT_PER_PAGE;
			answerList = answerMapper.selectAnswerByQuestionIdWithLimit(questionId, firstRow, ANSWER_COUNT_PER_PAGE);
		}else {
			pageNum = 0;
		}
		answerView = new AnswerView(answerCnt, pageNum, firstRow, ANSWER_COUNT_PER_PAGE, answerList);
		return answerView;
	}

	public void addAnswer(Answer answer) {
		answerMapper.insertAnswer(answer);
	}
	
	public Answer getAnswerById(int id) {
		return answerMapper.selectAnswerById(id);
	}

	public void updateAnswer(Answer answer) {
		answerMapper.updateAnswer(answer);
	}

	public void deleteAnswer(int id) {
		answerMapper.deleteAnswer(id);
	}

	public void deleteAnswerByQuestionId(int questionId) {
		answerMapper.deleteAnswerByQuestionId(questionId);
	}
	
}

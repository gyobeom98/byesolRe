package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.dto.Answer;
import model.dto.Question;
import model.mapper.AnswerMapper;
import model.mapper.QuestionMapper;
import model.view.AnswerView;

@Service("answerService")
public class AnswerService {
	// 페이지당 보여줄 답변의 수를 상수 5로 초기화
	private static final int ANSWER_COUNT_PER_PAGE = 5;
	
	// answer를 db에 crud할 맵퍼를 autowired로 컴파일 시 자동 매칭되게 함
	@Autowired
	AnswerMapper answerMapper;
	
	// question을 db에 crud할 맵퍼를 autowired로 컴파일 시 자동 매칭되게 함
	@Autowired
	QuestionMapper questionMapper;
	
	// 현재 페이지 넘버와 questionId를 인자로 갖고 있는 AnswerView를 반환 하는 메서드
	public AnswerView getAnswerView(int pageNum, int questionId) {
		AnswerView answerView = null;
		int firstRow = 0;
		List<Answer> answerList = null;
		// answer의 총 수를 answerMapper를 통해 db에서 select count를 함
		int answerCnt = answerMapper.countAnswer();
		// answer의 수 가 0보다 크다면
		if(answerCnt>0) {
			// firstRow 를 (현재 페이지 -1) * 페이지당 보여 줄 answer의 수 
			firstRow = (pageNum-1)*ANSWER_COUNT_PER_PAGE;
			answerList = answerMapper.selectAnswerByQuestionIdWithLimit(questionId, firstRow, ANSWER_COUNT_PER_PAGE);
		}else {
			pageNum = 0;
		}
		answerView = new AnswerView(answerCnt, pageNum, firstRow, ANSWER_COUNT_PER_PAGE, answerList);
		return answerView;
	}

	public void addAnswer(Answer answer) {
		Question question = questionMapper.selectQuestion(answer.getQuestionId());
		if(answer.getWriter().equals("admin")) {
			questionMapper.updateQuestionByIdWithState(question.getId(),"cea");
		}else if(answer.getWriter().equals(question.getWriter())) {
			questionMapper.updateQuestionByIdWithState(question.getId(), "yet");
		}
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

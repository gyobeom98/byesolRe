package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.dto.Answer;
import model.dto.Question;
import model.service.AnswerService;
import model.service.CustomerService;
import model.service.QuestionService;
import model.view.AnswerView;
import model.view.QuestionView;

@Controller
@RequestMapping("/question")
public class QuestionController {

	@Autowired
	QuestionService questionService;

	@Autowired
	CustomerService customerservice;

	@Autowired
	AnswerService answerService;

	@GetMapping("/addQuestion")
	public String addQuestionForm(HttpSession session) {
		if (session.getAttribute("userId") != null) {
			return "/mypage/qna";
		} else {
			return "redirect:/index/main";
		}
	}

	@PostMapping("/addQuestion")
	public String addQuestion(HttpSession session, Question question) {

		question.setWriter((String) session.getAttribute("userId"));
		questionService.addQuestion(question);
		return "redirect:/question/list";
	}

	@GetMapping("/list")
	public String getQuestionView(HttpSession session, @RequestParam(defaultValue = "1") int pageNum, Model m) {
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (!userId.equals("admin")) {
				if (customerservice.getCustomerById(userId) != null) {
					QuestionView questionView = questionService.getQuestionView(pageNum, userId);
					m.addAttribute("questionView", questionView);
					return "/mypage/myQnA";
				} else {
					m.addAttribute("errorMessage", "잘못된 접근 입니다");
					return "redirect:/index/main";
				}
			} else {
				return "";
			}
		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다.");
			return "redirect:/index/main";
		}
	}

	@GetMapping("/detailQuestion")
	public String goDetailQuestion(HttpSession session, @RequestParam(defaultValue = "0") int id, Model m,
			@RequestParam(defaultValue = "1") int pageNum) {

		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (id > 0) {
				Question question = questionService.selectQuestionById(id);
				if (question.getWriter().equals(userId) || userId.equals("admin")) {
					AnswerView answerView = answerService.getAnswerView(pageNum, id);
					m.addAttribute("answerView", answerView);
					m.addAttribute("question", question);
					return "/mypage/detailMyQnA";
				} else {
					m.addAttribute("errorMessage", "잘못된 접근 입니다.");
					return "redirect:/index/main";
				}
			} else {
				m.addAttribute("errorMessage","잘못된 접근 입니다.");
				return "redirect:/question/list";
			}

		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다");
			return "redirect:/index/main";
		}

	}

	@PostMapping("/addAnswer")
	public String addAnswerP(Answer answer, HttpSession session, @RequestParam(defaultValue = "1") int pageNum) {

		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			answer.setWriter(userId);
			answerService.addAnswer(answer);
			return "redirect:/question/detailQuestion?id=" + answer.getQuestionId() + "&pageNum=" + pageNum;
		} else {
			return "redirect:/index/main";
		}

	}

	@GetMapping("/updateQuestion")
	public String updateQuestionForm(HttpSession session, @RequestParam(defaultValue = "0") int id, Model m) {
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (id > 0) {
				Question question = questionService.selectQuestionById(id);
				if (question != null) {
					m.addAttribute("question", question);
					return "/mypage/updateMyQnA";
				} else {
					m.addAttribute("errorMessage", "잘못된 접근 입니다.");
					return "redirect:/index/main";
				}
			} else {
				m.addAttribute("errorMessage", "잘못된 접근 입니다.");
				return "redirect:/index/main";
			}
		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다");
			return "redirect:/index/main";
		}
	}

	@PostMapping("/updateQuestion")
	public String updateQuestion(HttpSession session, Question question, Model m) {
		Question qu = questionService.selectQuestionById(question.getId());
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (userId.equals(qu.getWriter())) {
				questionService.updateQuestion(question);
				return "redirect:/question/list";
			} else {
				m.addAttribute("errorMessage", "잘못된 접근 입니다.");
				return "redirect:/index/main";
			}
		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다");
			return "redirect:/index/main";
		}

	}

	@GetMapping("/updateAnswer")
	public String updateAnswer(HttpSession session, @RequestParam(defaultValue = "0") int id, Model m) {
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (id > 0) {
				Answer answer = answerService.getAnswerById(id);
				m.addAttribute("answer", answer);
				return "/mypage/updateAnswerMyQnA";
			} else {
				m.addAttribute("errorMessage", "잘못된 접근 입니다.");
				return "redirect:/index/main";
			}
		} else {
			m.addAttribute("errorMessage", "잘못된 접근 입니다.");
			return "redirect:/index/main";
		}
	}

	@PostMapping("/updateAnswer")
	public String updateAnswerP(HttpSession session, Answer answer, Model m) {
		Answer an = answerService.getAnswerById(answer.getId());
		System.out.println(an);
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (userId.equals(an.getWriter())) {
				answer.setWriter(an.getWriter());
				answerService.updateAnswer(answer);
				return "redirect:/question/list";
			} else {
				m.addAttribute("errorMessage", "잘못된 접근 입니다.");
				return "redirect:/index/main";

			}
		} else {
			m.addAttribute("errorMessage", "잘못된 접근 입니다.");
			return "redirect:/index/main";
		}

	}

	@GetMapping("/deleteQuestion")
	public String deleteQuestion(HttpSession session, @RequestParam(defaultValue = "0") int id, Model m) {
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (id > 0) {
				Question question = questionService.selectQuestionById(id);
				if (question != null) {
					if (userId.equals(question.getWriter()) || userId.equals("admin")) {
						answerService.deleteAnswerByQuestionId(id);
						questionService.deleteQuestion(id);
						return "redirect:/question/list";
					} else {
						m.addAttribute("errorMessage", "잘못된 접근 입니다.");
						return "redirect:/index/main";
					}
				} else {
					m.addAttribute("errorMessage", "잘못된 접근 입니다.");
					return "redirect:/index/main";
				}
			} else {
				m.addAttribute("errorMessage", "잘못된 접근 입니다.");
				return "redirect:/question/list";
			}
		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다");
			return "redirect:/index/main";
		}

	}

	@GetMapping("/deleteAnswer")
	public String deleteAnswer(HttpSession session, int id, Model m) {

		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			if (id > 0) {
				Answer answer = answerService.getAnswerById(id);
				if (answer != null && userId.equals(answer.getWriter())) {
					answerService.deleteAnswer(id);
					return "redirect:/question/list";
				} else {
					m.addAttribute("errorMessage", "잘못된 접근 입니다.");
					return "redirect:/index/main";
				}
			} else {
				m.addAttribute("errorMessage", "잘못된 접근 입니다.");
				return "redirect:/index/main";
			}

		} else {
			m.addAttribute("errorMessage", "잘못된 접근 입니다.");
			return "redirect:/index/main";
		}

	}

}

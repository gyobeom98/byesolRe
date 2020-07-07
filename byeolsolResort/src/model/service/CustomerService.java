package model.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.dto.Board;
import model.dto.Customer;
import model.dto.Question;
import model.dto.Remove;
import model.dto.Reserv;
import model.mapper.AnswerMapper;
import model.mapper.BoardMapper;
import model.mapper.CommentMapper;
import model.mapper.CustomerMapper;
import model.mapper.QuestionMapper;
import model.mapper.RemoveMapper;
import model.mapper.ReservMapper;
import model.view.CustomerView;

@Service("customerService")
public class CustomerService {

	private static final int CUSTOMER_COUNT_PER_PAGE = 10;

	@Autowired
	CustomerMapper customerMapper;

	@Autowired
	BoardService boardService;

	@Autowired
	CommentMapper commentMapper;

	@Autowired
	RemoveMapper removeMapper;

	@Autowired
	ReservMapper reservMapper;

	@Autowired
	AnswerMapper answerMapper;

	@Autowired
	QuestionMapper questionMapper;

	public void register(Customer customer) {
		System.out.println("회원가입 넘어 오는지 확인 : " + customer);
		customerMapper.insertCustomer(customer);
	}

	public Customer logIn(String userId, String password) {
		System.out.println("로그인 넘어 오는지 확인 : " + userId);
		Customer c = customerMapper.selectCustomer(userId, password);
		System.out.println("select 되는지 확인" + c);
		return c;
	}

	public String idCheck(String userId) {

		Customer c = customerMapper.selectCustomerWithId(userId);
		if (c != null) {
			return "중복";
		} else
			return "중복 아님";

	}

	public Customer check(Customer customer) {
		System.out.println("있는지 확인 : " + customer);
		return customerMapper.selectCustomer(customer.getUserId(), customer.getPassword());

	}

	public String emailCheck(String email) {
		Customer c = customerMapper.selectCustomerWithEmail(email);
		if (c == null) {
			return "중복 아님";
		} else {
			return "중복";
		}
	}

	public Customer getCustomerByEmail(String email, String emailCode) {
		return customerMapper.selectCustomerByEmailAndEmailState(email, emailCode);
	}

	public Customer getCustomerById(String userId) {
		return customerMapper.selectCustomerWithId(userId);
	}

	public void mailSend(JavaMailSender mailSender, String registEmail) {
		String mailCode = (int) (Math.random() * 8999) + 1000 + "";
		String setfrom = "byeolsol6@gmail.com";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(registEmail); // 받는사람 이메일
			messageHelper.setSubject("별솔리조트 인증번호 입니다."); // 메일제목은 생략이 가능하다
			messageHelper.setText(
					"<div style='margin: 0auto; width: 800px; border-bottom: 3px solid lightgray; border-top: 3px solid lightgray; text-align: center'>"
							+ "<span> 별솔리조트 인증번호 입니다. 별솔리조트 이메일 인증 화면에 인증 코드를 입력 하여 주세요" + "</span><h3>" + mailCode
							+ "</h3><span>" + "이메일 인증을 하지 않으시면 별솔리조트 서비스중 일부 서비스를 이용 하실 수 없습니다." + "</span></div>",
					true); // 메일 내용
			mailSender.send(message);
			customerMapper.updateStateByEmail(registEmail, mailCode);
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	public void updateCustomerEmailState(String userEmail, String emailState) {
		customerMapper.updateStateByEmail(userEmail, emailState);
	}

	public String phoneCheck(String phone) {

		Customer customer = customerMapper.selectCustomerByPhone(phone);
		if (customer == null)
			return "중복 아님";
		else
			return "중복";
	}

	public void updateCustomer(Customer cust) {
		customerMapper.updateCustomer(cust);
	}

	@Transactional
	public void deleteCustomerWithAllInfor(Customer customer) {

		List<Board> boardList = boardService.selectBoardListByUserId(customer.getUserId());

		for (Board board : boardList) {
			boardService.deleteBoard(board.getId(), customer.getUserId());
		}

		commentMapper.deleteCommentByUserId(customer.getUserId());

		List<Reserv> reservList = reservMapper.selectReservByUserId(customer.getUserId());

		for (Reserv reserv : reservList) {
			if (reserv.getState().equals("입금")) {
				removeMapper.insertRemove(new Remove(0, customer.getUserId(), reserv.getRoomId(), reserv.getStartDate(),
						reserv.getEndDate(), reserv.getTotalPrice() - (int) (reserv.getTotalPrice() / 10),
						customer.getName(), customer.getPhone(), null));
			}
			reservMapper.deleteReserv(reserv.getId());
		}
		List<Question> questionList = questionMapper.selectQuestionByWriter();
		for (Question question : questionList) {
			answerMapper.deleteAnswerByQuestionId(question.getId());
			questionMapper.deleteQuestion(question.getId());
		}
		customerMapper.deleteCustomerById(customer.getId());

	}

	public CustomerView getCustomerView(int pageNum) {
		CustomerView customerView = null;
		int firstRow = 0;
		List<Customer> customerList = null;
		int customerCnt = customerMapper.countCustomer();
		if (customerCnt > 0) {
			firstRow = (pageNum - 1) * CUSTOMER_COUNT_PER_PAGE;
			customerList = customerMapper.selectCustomerListWithLimit(firstRow, CUSTOMER_COUNT_PER_PAGE);
		} else {
			pageNum = 0;
		}
		customerView = new CustomerView(customerCnt, pageNum, firstRow, CUSTOMER_COUNT_PER_PAGE, customerList);
		return customerView;
	}

	public String mailSendByPassword(JavaMailSender mailSender, String email, String userId, String name) {
		if (isCheck(email, userId, name)) {
			String temporaryPassword = randomTemporaryPassword();
			String setfrom = "byeolsol6@gmail.com";
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
				messageHelper.setTo(email); // 받는사람 이메일
				messageHelper.setSubject("별솔리조트 비밀 번호 조회 결과 입니다.."); // 메일제목은 생략이 가능하다
				messageHelper.setText(
						"<div style='margin: 0auto; width: 800px; border-bottom: 3px solid lightgray; border-top: 3px solid lightgray; text-align: center'>"
								+ "<span> 별솔리조트 임시 비밀 번호 입니다. 로그인 시 이 임시 비밀 번호를 입력 하여 주세요" + "</span><h3>"
								+ temporaryPassword + "</h3><span>" + "임시 비밀번호로 로그인 후 마이페이지 에서 비밀 번호 변경이 가능 합니다."
								+ "</span></div>",
						true); // 메일 내용
				mailSender.send(message);
				customerMapper.updateStateByEmail(email, temporaryPassword);
				return "이메일로 임시 비밀번호를 보냈습니다. 확인하여 주세요";
			} catch (Exception e) {
				System.out.println(e);
				return "메일 전송 오류 입니다.";
			}
		} else {
			return "잘못된 정보 입니다. 확인 해 주세요";
		}
	}

	public String mailSendWithId(JavaMailSender mailSender, String email, String name) {
		System.out.println(email+","+name);
		Customer customer = customerMapper.selectCustomerWithEmail(email);
		System.out.println(customer);
		if (customer != null) {
			if (customer.getName().equals(name)) {
				String setfrom = "byeolsol6@gmail.com";
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
					messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
					messageHelper.setTo(customer.getEmail()); // 받는사람 이메일
					messageHelper.setSubject("별솔리조트 아이디 조회 결과 입니다."); // 메일제목은 생략이 가능하다
					messageHelper.setText(
							"<div style='margin: 0auto; width: 800px; border-bottom: 3px solid lightgray; border-top: 3px solid lightgray; text-align: center'>"
									+ "<span> 별솔 리조트 아이디 찾기 요청으로 인해 해당 메일에 ID를 보냈으니 확인 후 별솔 리조트에 로그인 해주세요" + "</span><h3>"
									+ customer.getUserId() + "</h3></div>",
							true); // 메일 내용
					mailSender.send(message);
					return "가입시 기입한 이메일로 메일을 보냈습니다. 확인 하여 주세요";
				} catch (Exception e) {
					System.out.println(e);
					return "메일 전송 오류 입니다.";
				}
			}else {
				return "정보를 다시 확인 하여 주세요";
			}
		}else {
			return "정보를 다시 확인 하여 주세요";
		}

	}

	public boolean isCheck(String email, String userId, String name) {

		Customer customer = customerMapper.selectCustomerWithId(userId);
		if (customer != null) {
			if (customer.getEmail().equals(email) && customer.getName().equals(name)) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}

	}

	private String randomTemporaryPassword() {

		String temporaryPassword = "";
		for (int i = 0; i < 8; i++) {

			if (i % 2 == 0) {
				temporaryPassword += (char) ('a' + (int) (Math.random() * 25) + 1) + "";
			} else {
				temporaryPassword += (int) (Math.random() * 9) + 1;
			}
		}

		return temporaryPassword;

	}

}

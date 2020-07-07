package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Enumeration;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.Pattern;

import org.quartz.impl.calendar.HolidayCalendar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.dto.Customer;
import model.dto.CustomerVO;
import model.service.BoardService;
import model.service.CustomerService;
import model.service.HolyDayService;
import model.service.ReservService;

@Controller
@RequestMapping("/cus")
public class CustomerController {

	private static final String DEFAULT_VALUE_ID = "defaultValueId";
	private static final String DEFAULT_VALUE_PASSWORD = "defaultValuePassword";
	private static final String DEFAULT_VALUE_Email = "defaultValueEmail@test.com";

	@Autowired
	CustomerService customerService;

	@Autowired
	private Validator validator;

	@GetMapping("/regis")
	public String getRegisForm(HttpSession session, Model m) {
		if (session.getAttribute("userId") == null) {
			System.out.println("aa");
			return "registForm";
		} else {
			m.addAttribute("errorMessage", "잘못된 접근 입니다.");
			return "redirect:/index/main";
		}
	}

	private static final String DEFAULT_BIRTH_DATE = "1850-01-01";

	@PostMapping("/regis")
	public String getResultRegis(HttpServletRequest resq, @ModelAttribute("CustomerVo") @Valid CustomerVO customerVo,
			BindingResult result, @RequestParam(defaultValue = DEFAULT_BIRTH_DATE) Date birth, Model m,
			HttpSession session) {
		if (session.getAttribute("userId") == null) {
			customerVo.setId(0);
			if (!birth.toString().equals(DEFAULT_BIRTH_DATE)) {
				customerVo.setBirthDate(birth.toLocalDate());

				System.out.println(customerVo);

				if (result.hasErrors()) {
					List<FieldError> errors = result.getFieldErrors();
					for (FieldError fe : errors) {
						m.addAttribute("e" + fe.getField(), fe.getField());
						System.out.println(fe);
					}
					return "registForm";
				} else {

					String idCheck = customerService.idCheck(customerVo.getUserId());
					if (idCheck.equals("중복")) {
						m.addAttribute("errorMessage", "id가 중복되었습니다.");
						return "redirect/cus/regis";

					} else {
						String emailCheck = customerService.emailCheck(customerVo.getEmail());
						if (!emailCheck.equals("중복")) {
							if (!customerService.phoneCheck(customerVo.getPhone()).equals("중복")) {
								if (LocalDate.now().getYear() - birth.toLocalDate().getYear() >= 5) {
									Customer customer = new Customer(customerVo.getId(), customerVo.getUserId(),
											customerVo.getPassword(), customerVo.getName(), customerVo.getZipCode(),
											customerVo.getEmail(), customerVo.getAddress(),
											customerVo.getAddressDetail(), customerVo.getPhone(),
											customerVo.getEmailState(), customerVo.getBirthDate());
									customerService.register(customer);
									m.addAttribute("registEmail", customer.getEmail());
									return "redirect:/cus/mailCheck";
								} else {
									System.out.println(LocalDate.now().compareTo(birth.toLocalDate()));
									m.addAttribute("errorMessage", "생년월일을 확인 해주세요");
									return "redirect:/cus/regis";
								}
							} else {
								m.addAttribute("errorMessage", "전화번호가 중복되었습니다.");
								return "redirect:/cus/regis";
							}
						} else {
							m.addAttribute("errorMessage", "email이 중복 되었습니다.");
							return "redirect:/cus/regis";
						}
					}
				}
			} else {
				m.addAttribute("errorMessage", "생년월일을 다시 확인 해주세요");
				return "redirect:/cus/regis";
			}

		} else {
			m.addAttribute("errorMessage", "잘못된 접근 입니다.");
			return "redirect:/index/main";
		}

	}

	@PostMapping(value = "/idcheck", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String getIdCheck(String userId) {
		System.out.println("체크");
		return customerService.idCheck(userId);
	}

	@PostMapping(value = "/eamilcheck", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String getEmailCheck(String email) {
		System.out.println(email);
		return customerService.emailCheck(email);
	}

	@PostMapping(value = "/phoneCheck", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String getPhoneCheck(String phone) {
		return customerService.phoneCheck(phone);
	}

	@GetMapping("/login")
	public String loginForm(HttpSession session, Model m) {
		if (session.getAttribute("userId") == null) {
			System.out.println("aa");
			return "loginForm";
		} else {
			m.addAttribute("errorMessage", "잘못된 접근");
			return "redirect:/index/main";
		}
	}

	@PostMapping("/login")
	public String login(@RequestParam(defaultValue = DEFAULT_VALUE_ID) String userId,
			@RequestParam(defaultValue = DEFAULT_VALUE_PASSWORD) String password, HttpSession session, Model m) {
		if (!userId.equals(DEFAULT_VALUE_ID) || !password.equals(DEFAULT_VALUE_PASSWORD)) {
			Customer c = customerService.logIn(userId, password);
			if (c == null) {
				m.addAttribute("islog", "id 또는 비밀번호가 잘못 되었습니다.");
				return "loginForm";
			} else {

				session.setAttribute("userId", c.getUserId());
				session.setAttribute("userName", c.getName());
				session.setAttribute("state", c.getEmailState());
				session.setAttribute("userEmail", c.getEmail());
				return "redirect:/index/main";
			}
		} else {
			m.addAttribute("errorMessage", "id 또는 비밀번호를 확인해 주세요");
			return "redirect:/cus/login";
		}
	}

	@GetMapping("/logout")
	public String logOut(HttpSession session, Model m) {
		if (session.getAttribute("userId") != null) {
			System.out.println(session.getAttribute("userId"));
			System.out.println(session.getAttribute("userName"));
			session.setAttribute("userId", null);
			session.setAttribute("userName", null);
			return "redirect:/index/main";
		} else {
			m.addAttribute("errorMessage", "잘못된 접근");
			return "redirect:/index/main";
		}
	}

	@GetMapping("/myPage")
	public String goMyPage(HttpSession session, Model m) {
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			Customer customer = customerService.getCustomerById(userId);
			m.addAttribute("customer", customer);
			return "mypage/mypage";
		} else {
			m.addAttribute("errorMessage", "로그인을 해주세요");
			return "redirect:/index/main";
		}

	}

	@PostMapping("/updateCustomer")
	public String updateCustomer(HttpSession session, Model m,
			@ModelAttribute("CustomerVo") @Valid CustomerVO customerVo, BindingResult result, @RequestParam(defaultValue = DEFAULT_BIRTH_DATE)Date birth) {
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			Customer cust = new Customer();
			if (customerVo.getUserId().equals(userId)) {
				if(!birth.toString().equals(DEFAULT_BIRTH_DATE)) {
				Customer customer = customerService.getCustomerById(userId);
				cust.setId(customer.getId());
				cust.setUserId(userId);
				if (result.hasErrors()) {
					List<FieldError> errors = result.getFieldErrors();
					for (FieldError fe : errors) {
						m.addAttribute("e" + fe.getField(), fe.getField());
						System.out.println(fe);
					}
					return "redirect:/cus/myPage";
				} else {
					if (customerService.phoneCheck(customerVo.getPhone()).equals("중복")) {
						if (customer.getPhone().equals(customerVo.getPhone())) {
							cust.setPhone(customerVo.getPhone());
						}
					} else {
						cust.setPhone(customerVo.getPhone());
					}
					if (LocalDate.now().getYear() - birth.toLocalDate().getYear() >= 5) {
						cust.setBirthDate(birth.toLocalDate());
					}
					cust.setAddress(customerVo.getAddress());
					cust.setAddressDetail(customerVo.getAddressDetail());
					cust.setEmailState(customer.getEmailState());
					cust.setEmail(customer.getEmail());
					cust.setName(customerVo.getName());
					cust.setPassword(customerVo.getPassword());
					cust.setZipCode(customerVo.getZipCode());
					System.out.println(cust.getPhone());
					System.out.println(cust);
					cust.setId(customer.getId());
					customerService.updateCustomer(cust);
					return "redirect:/cus/myPage";
				}
				}else {
					m.addAttribute("errorMessage","생일을 다시 확인 하여 주세요");
					return "redirect:/cus/myPage";
				}
			} else {
				m.addAttribute("errorMessage", "권한이 없습니다.");
				return "redirect:/index/main";
			}
		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다.");
			return "redirect:/index/main";
		}
	}

	@Autowired
	private JavaMailSender mailSender;

	@GetMapping(value = "/mailCheck", produces = "application/text; charset=utf-8")
	public String mailSending(@RequestParam(required = false) String registEmail, HttpSession session, Model m) {
		if (session.getAttribute("userEmail") != null) {
			return "/mypage/mailCer";
		} else if (registEmail != null) {
			m.addAttribute("userEmail", registEmail);
			return "/mypage/mailCer";
		} else {
			m.addAttribute("errorMessage", "잘못된 접근 입니다.");
			return "redirect:/index/main";
		}
	}

	@PostMapping(value = "/mailSend", produces = "application/text;charset=utf-8")
	@ResponseBody
	public String mailSendRes(@RequestParam(defaultValue = DEFAULT_VALUE_Email)String userEmail, HttpSession session) {
		if(!userEmail.equals(DEFAULT_VALUE_Email)) {
		customerService.mailSend(mailSender, userEmail);
		return "이메일 인증코드를 성공적으로 보냈습니다.";
		}else {
			return "잘못된 접근";
		}
	}

	@PostMapping("/mailCheck")
	public String emailCertification(String mailCode, String userEmail, Model m) {
		Customer customer = customerService.getCustomerByEmail(userEmail, mailCode);
		if (customer != null) {
			customerService.updateCustomerEmailState(userEmail, "인증");
			m.addAttribute("successMessage", "이메일 인증이 완료 되었습니다. 로그인후 별솜 리조트 홈페이지 서비스를 이용하실 수 있습니다.");
			return "redirect:/index/main";
		} else {
			customerService.updateCustomerEmailState(userEmail, "미인증");
			m.addAttribute("errorMessage", "인증코드와 일치하지 않습니다.");
			return "redirect:/index/mailCer";
		}

	}

	@Autowired
	ReservService reservService;

	@GetMapping("/myReserv")
	public String myReservPage(HttpSession session, @RequestParam(defaultValue = "1") int pageNum, Model m) {
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			Customer customer = customerService.getCustomerById(userId);
			if (customer.getEmailState().equals("인증")) {
				m.addAttribute("reservView", reservService.getReservView(pageNum, userId));
				return "/mypage/myRoom";
			} else {
				m.addAttribute("errorMessage", "이메일 인증이 되어있지 않은 계정입니다.");
				return "redirect:/cus/myPage";
			}
		} else {
			m.addAttribute("errorMessage", "로그인이 되어있지 않습니다.");
			return "redirect:/index/main";
		}
	}

	@GetMapping("/deleteCustomer")
	public String deleteCustomerForm(HttpSession session, Model m) {
		if (session.getAttribute("userId") != null) {
			return "customerDeleteForm";
		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다.");
			return "redirect:/index/main";
		}
	}

	@PostMapping("/deleteCustomer")
	public String deleteCustomer(HttpSession session, @RequestParam(defaultValue = DEFAULT_VALUE_ID) String userId,
			@RequestParam(defaultValue = DEFAULT_VALUE_PASSWORD) String password, Model m) {
		if (session.getAttribute("userId") != null) {
			if (!userId.equals(DEFAULT_VALUE_ID) || !password.equals(DEFAULT_VALUE_PASSWORD)) {
				String sessionUserId = (String) session.getAttribute("userId");
				Customer sessionCustoemr = customerService.getCustomerById(sessionUserId);
				if (sessionCustoemr.getPassword().equals(password)) {
					customerService.deleteCustomerWithAllInfor(sessionCustoemr);
					session.setAttribute("userId", null);
					session.setAttribute("userName", null);
					session.setAttribute("state", null);
					session.setAttribute("userEmail", null);
					m.addAttribute("deleteMessage", "계정을 탈퇴 하였습니다");
					return "redirect:/index/main";
				} else {
					m.addAttribute("errorMessage", "아이디 또는 비밀번호를 다시 확인 해 주세요");
					return "redirect:/cus/deleteCustomer";
				}
			} else {
				m.addAttribute("errorMessage", "비밀번호를 확인해 주세요");
				return "redirect:/cus/deleteCustomer";
			}
		} else {
			m.addAttribute("errorMessage", "로그인이 되어 있지 않습니다.");
			return "redirect:/index/main";
		}

	}
	
	

}

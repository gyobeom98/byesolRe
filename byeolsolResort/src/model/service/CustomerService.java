package model.service;

import java.io.UnsupportedEncodingException;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.dto.Customer;
import model.mapper.CustomerMapper;

@Service("customerService")
public class CustomerService {

	@Autowired
	CustomerMapper customerMapper;
	
	public void register(Customer customer) {
		System.out.println("회원가입 넘어 오는지 확인 : " + customer);
		customerMapper.insertCustomer(customer);
	}
	
	public Customer logIn(String userId , String password) {
		System.out.println("로그인 넘어 오는지 확인 : " + userId);
		Customer c = customerMapper.selectCustomer(userId,password);
		System.out.println("select 되는지 확인" + c);
		return c;
	}
	
	public String idCheck(String userId) {
		
		Customer c = customerMapper.selectCustomerWithId(userId);
		if(c != null) {
			return "중복";
		}else return "중복 아님";
		
	}
	
	public Customer check(Customer customer) {
		System.out.println("있는지 확인 : " + customer);
		return customerMapper.selectCustomer(customer.getUserId(), customer.getPassword());
		
	}
	
	public String emailCheck(String email) {
		Customer c = customerMapper.selectCustomerWithEmail(email);
		if(c == null) {
			return "중복 아님";
		}else return "중복";
	}
	
	public Customer getCustomerByEmail(String email , String emailCode) {
		return customerMapper.selectCustomerByEmailAndEmailState(email,emailCode);
	}
	
	public Customer getCustomerById(String userId) {
		return customerMapper.selectCustomerWithId(userId);
	}
	
	public void mailSend(JavaMailSender mailSender, String registEmail) {
		String mailCode = (int)(Math.random()*8999)+1000+"";
		String setfrom = "byeolsol6@gmail.com";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(registEmail); // 받는사람 이메일
			messageHelper.setSubject("별솔리조트 인증번호 입니다."); // 메일제목은 생략이 가능하다
			messageHelper.setText("<div style='margin: 0auto; width: 800px; border-bottom: 3px solid lightgray; border-top: 3px solid lightgray; text-align: center'>"
					+ "<span> 별솔리조트 인증번호 입니다. 별솔리조트 이메일 인증 화면에 인증 코드를 입력 하여 주세요"
					+ "</span><h3>"+mailCode+"</h3><span>"
							+ "이메일 인증을 하지 않으시면 별솔리조트 서비스중 일부 서비스를 이용 하실 수 없습니다."
							+ "</span></div>",true); // 메일 내용
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
		if(customer == null)
		return "중복 아님";
		else return "중복";
	}

	public void updateCustomer(Customer cust) {
		customerMapper.updateCustomer(cust);
	}

		
	
	
}

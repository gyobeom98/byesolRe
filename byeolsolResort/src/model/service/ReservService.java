package model.service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import model.dto.Customer;
import model.dto.ErrorMessage;
import model.dto.Reserv;
import model.dto.Room;
import model.mapper.ReservMapper;

@Service("reservService")
public class ReservService {

	@Autowired
	ReservMapper reservMapper;

	public boolean reservCheck(int roomId, LocalDate startDate, LocalDate endDate) {
		if (reservMapper.selectReservByRoomIdWithDate(roomId, startDate, endDate) != null)
			return false;
		else
			return true;
	}

	public Reserv getReservCheck(int roomId, LocalDate startDate, LocalDate endDate) {
		return reservMapper.selectReservByRoomIdWithDate(roomId, startDate, endDate);
	}

	public void addReserv(Reserv reserv) {
		reservMapper.insertReserv(reserv);
	}

	@Autowired
	CustomerService customerService;

	@Autowired
	RoomService roomService;

	public ErrorMessage totalAddResrv(Date startDate, Date endDate, int roomNum, HttpSession session, int peopleCount) {
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			Customer customer = customerService.getCustomerById(userId);
			Room room = roomService.getRoomByRoomNum(roomNum);
			System.out.println(room);
			if (customer.getEmailState().equals("인증")) {
				LocalDate start = startDate.toLocalDate();
				LocalDate end = endDate.toLocalDate();
				if (start.compareTo(LocalDate.now()) > 3) {
					int dv = end.compareTo(start);
					if (dv > 0) {
						if (dateCheck(start, end)) {
							if (peopleCount >= room.getMinPeople() && peopleCount <= room.getMaxPeople()) {
								int totalPrice = getTotalPrice(start, end, room);
								Reserv reserv = new Reserv(0, "test", room.getId(), start, end, totalPrice, peopleCount,
										null, null);
								if (reservCheck(1, start, end)) {
									System.out.println("확인함");
									addReserv(reserv);
									return new ErrorMessage(null, "redirect:/reserv/main", 0);
								} else {
									System.out.println("실패함");
									return new ErrorMessage("해당 날짜는 예약 하실수 없습니다.", "redirect:/reserv/addReserv",
											roomNum);
								}
							} else {
								return new ErrorMessage("해당 인원은 이 방을 예약 하실 수 없습니다. 해당 방을 예약하시려면 관리자에게 문의 해주세요",
										"redirect:/reserv/addreserv", roomNum);
							}
						} else {
							return new ErrorMessage("예약 가능 범위를 벗어났습니다.", "redirect:/reserv/addReserv", roomNum);
						}
					} else {
						return new ErrorMessage("종료날짜가 시작 날짜보다 빠를 수 없습니다.", "redirect:/reserv/addReserv", roomNum);
					}
				} else {
					return new ErrorMessage("시작날짜는 오늘 날짜의 3일 이후 부터 선택 가능합니다.", "redirect:/reserv/addReserv", roomNum);
				}
			} else {
				return new ErrorMessage("이메일 인증이 되어있지 않은 계정입니다.", "redirect:/index/main", 0);
			}
		} else {
			return new ErrorMessage("로그인이 되어있지 않습니다.", "redirect:/index/main", 0);
		}
	}

	public boolean isNullFromErrorMessage(ErrorMessage errorMessage) {
		if (errorMessage.getErrorMessage() == null) {
			return true;
		} else
			return false;
	}

	public boolean isHaveRoomNumber(ErrorMessage errorMessage) {
		if (errorMessage.getRoomNum() <= 0)
			return true;
		else
			return false;
	}

	public Reserv getReservById(int reservId) {
		return reservMapper.selectReservById(reservId);
	}

	public void updateReserv(HttpSession session, int reservId, Date startDate, Date endDate, int roomNum,
			int peopleCount, int totalPrice) {

	}

	public int getTotalPrice(LocalDate startDate, LocalDate endDate,Room room) {
		int totalPrice = 0;
		int dv = endDate.compareTo(startDate);
		List<LocalDate> days = new ArrayList<LocalDate>();
		for (int i = 0; i <= dv; i++) {
			days.add(startDate.plusDays(i));
		}
		for (LocalDate localDate : days) {
			if (localDate.getDayOfWeek().toString().equals("FRIDAY")
					|| localDate.getDayOfWeek().toString().equals("SATURDAY")
					|| localDate.getDayOfWeek().toString().equals("SUNDAY"))
				totalPrice += room.getWeekendPrice();
			else
				totalPrice += room.getDayPrice();
		}

		return totalPrice;
	}

	

	public boolean dateCheck(LocalDate startDate, LocalDate endDate) {
		int hour = LocalDateTime.now().getHour();
		int minute = LocalDateTime.now().getMinute();
		if (startDate.compareTo(LocalDate.now()) >= 0 && startDate.compareTo(LocalDate.now()) <= 60) {
			if (endDate.compareTo(startDate) >= 0 && endDate.compareTo(startDate) <= 15) {
					if(startDate.compareTo(LocalDate.now())==0) {
						if(hour<11 || hour==11 && minute<=30) {
							return true;
						}else {
							return false;
						}
					}
				return true;
			} else {
				return false;
			}
			
		} else {
			return false;
		}
	}

}

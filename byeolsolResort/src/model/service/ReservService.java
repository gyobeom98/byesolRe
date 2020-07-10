package model.service;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import model.dto.Customer;
import model.dto.ErrorMessage;
import model.dto.Remove;
import model.dto.Reserv;
import model.dto.ReservInfo;
import model.dto.Room;
import model.mapper.CustomerMapper;
import model.mapper.RemoveMapper;
import model.mapper.ReservMapper;
import model.view.ReservInfoView;
import model.view.ReservView;

@Service("reservService")
public class ReservService {

	private static final int RESERV_COUNT_PER_PAGE = 5;
	
	@Autowired
	ReservMapper reservMapper;
	
	@Autowired
	RemoveMapper removeMapper;

	public boolean reservCheck(int roomId, LocalDate startDate, LocalDate endDate) {
		if (reservMapper.selectReservByRoomIdWithDate(roomId, startDate, endDate) != null)
			return false;
		else
			return true;
	}
	public boolean reservUpdateCheck(int roomId, LocalDate startDate, LocalDate endDate, int reservId) {
		Reserv reserv = reservMapper.selectReservById(reservId);
		if(reserv != null) {
			System.out.println(reserv.getId() == reservMapper.selectReservByRoomIdWithDate(roomId, startDate, endDate).getId());
			if(reserv.getId() == reservMapper.selectReservByRoomIdWithDate(roomId, startDate, endDate).getId()) {
				if(reserv.getStartDate().compareTo(LocalDate.now())>=1)
				return true;
				else return false;
			}else return false;
		}else {
			return false;
		}
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
				int dv = end.compareTo(start);
				if (dv >= 0) {
					if (dateCheck(start, end)) {
						if (peopleCountCheck(room, peopleCount)) {
							int totalPrice = getTotalPrice(start, end, room);
							Reserv reserv = new Reserv(0, userId, room.getId(), start, end, totalPrice, peopleCount,
									null, null);
							if (reservCheck(room.getId(), start, end)) {
								System.out.println("확인함");
								addReserv(reserv);
								return new ErrorMessage(null, "redirect:/index/main", 0);
							} else {
								System.out.println("실패함");
								return new ErrorMessage("해당 날짜는 예약 하실수 없습니다.", "redirect:/reserv/addReserv", roomNum);
							}
						} else {
							return new ErrorMessage("해당 인원은 이 방을 예약 하실 수 없습니다. 해당 방을 예약하시려면 관리자에게 문의 해주세요",
									"redirect:/reserv/addreserv", roomNum);
						}
					} else {
						return new ErrorMessage("예약 가능 범위를 벗어났습니다.", "redirect:/reserv/addReserv", roomNum);
					}
				} else {
					return new ErrorMessage("종료날짜가 시작 날짜 이전일 수 없습니다.", "redirect:/reserv/addReserv", roomNum);
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

	public ErrorMessage updateReserv(HttpSession session, int reservId, Date startDate, Date endDate, int roomNum,
			int peopleCount) {
		if (session.getAttribute("userId") != null) {
			String userId = (String) session.getAttribute("userId");
			Room room = roomService.getRoomByRoomNum(roomNum);
			if (peopleCountCheck(room, peopleCount)) {
				if (dateCheck(startDate.toLocalDate(), endDate.toLocalDate())) {
					if(reservUpdateCheck(room.getId(), startDate.toLocalDate(), endDate.toLocalDate(),reservId)) {
						System.out.println("after Check");
						int total = getTotalPrice(startDate.toLocalDate(), endDate.toLocalDate(), room);
						Reserv reserv = new 
								Reserv(reservId, userId, room.getId(), startDate.toLocalDate(), endDate.toLocalDate(), total, peopleCount, null, null);
						reservMapper.updateReserv(reserv);
						return new ErrorMessage(null, "redirect:/cus/myReserv", 0);
					}else {
						return new ErrorMessage("예약 불가능한 날짜 입니다.", "redirect:/reserv/updateReserv?reservId="+reservId, roomNum);
					}
				} else {
					return new ErrorMessage("예약 가능 범위를 벗어났습니다.", "redirect:/reserv/updateReserv?reservId="+reservId, roomNum);
				}
			} else {
				return new ErrorMessage("해당 인원은 이 방을 예약 하실 수 없습니다. 해당 방을 예약하시려면 관리자에게 문의 해주세요",
						"redirect:/reserv/updateReserv?reservId="+reservId, roomNum);
			}
		} else {
			return new ErrorMessage("로그인이 되어 있지 않습니다.", "redirect:/index/main", 0);
		}

	}

	@Autowired
	HolyDayService holyDayService;
	
	public int getTotalPrice(LocalDate startDate, LocalDate endDate, Room room) {
		int totalPrice = 0;
		int dv = endDate.compareTo(startDate);
		if(dv>1) dv--;
		List<LocalDate> days = new ArrayList<LocalDate>();
		for (int i = 0; i <= dv; i++) {
			days.add(startDate.plusDays(i));
		}
		for (LocalDate localDate : days) {
			if (isWeekend(localDate.getDayOfWeek().toString()) || isHolyDay(localDate) || isPeekSeason(localDate))
				totalPrice += room.getWeekendPrice();
			else
				totalPrice += room.getDayPrice();
		}

		return totalPrice;
	}
	
	private boolean isWeekend(String dayofWeek) {
		if(dayofWeek.equals("FRIDAY")|| dayofWeek.equals("SATURDAY") || dayofWeek.equals("SUNDAY")) {
			return true;
		}else return false;
	}
	
	private boolean isHolyDay(LocalDate localDate) {
		int y = localDate.getYear();
		int m = localDate.getMonthValue();
		boolean ish = false;
		List<String> isHoly =  holyDayService.get(y, m);
		if(isHoly.size()>0 && !isHoly.get(0).equals("error")) {
			String dateFormmat = localDate.format(DateTimeFormatter.ofPattern("YYYYMMdd"));
			for (String holy : isHoly) {
				if(holy.equals(dateFormmat)) {
					ish = true;
					break;
				}
			}
			
			if(ish) {
				return true;
			}else {
				return false;
			}
			
		}else {
			return false;
		}
		
	}
	

	public boolean dateCheck(LocalDate startDate, LocalDate endDate) {
		int hour = LocalDateTime.now().getHour();
		int minute = LocalDateTime.now().getMinute();
		if (startDate.compareTo(LocalDate.now()) >= 0 && startDate.compareTo(LocalDate.now()) <= 60) {
			if (endDate.compareTo(startDate) >= 0 && endDate.compareTo(startDate) <= 8) {
				if (startDate.compareTo(LocalDate.now()) == 0) {
					if (hour < 11 || hour == 11 && minute <= 30) {
						return true;
					} else {
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

	public boolean peopleCountCheck(Room room, int peopleCount) {
		int max = room.getMaxPeople();
		int min = room.getMinPeople();

		if (peopleCount >= min && peopleCount <= max) {
			return true;
		} else {
			return false;
		}

	}
	public boolean roomNumCheck(int roomNum) {
		if(roomNum>=101 && roomNum<=105 || roomNum<=201 && roomNum>=205 || roomNum<=301 && roomNum>=305)
			return true;
		else return false;
	}
	
	
	@Transactional
	public void deleteReserv(int reservId) {
		Reserv reserv = reservMapper.selectReservById(reservId);
		if(reserv.getState().equals("입금")) {
			Customer customer = customerService.getCustomerById(reserv.getUserId());
			Remove remove = new Remove(0, reserv.getUserId(), reserv.getRoomId(), reserv.getStartDate(), reserv.getEndDate(), reserv.getTotalPrice(),customer.getName(), customer.getPhone(), null);
			removeMapper.insertRemove(remove);
		}
		
		reservMapper.deleteReserv(reservId);
	}
	
	public ReservView getReservView(int pageNum , String userId) {
		ReservView reservView = null;
		
		int firstRow = 0;
		List<Reserv> reservList = null;
		int reservCnt = reservMapper.reservCount();
		if(reservCnt>0) {
			firstRow = (pageNum-1) * RESERV_COUNT_PER_PAGE;
			reservList = reservMapper.selectReservListByUserIdWithLimit(userId, firstRow, RESERV_COUNT_PER_PAGE);
		}else {
			pageNum = 0;
		}
		reservView = new ReservView(reservCnt, pageNum, firstRow, RESERV_COUNT_PER_PAGE, reservList);
		return reservView;
	}
	
	
	private boolean isPeekSeason(LocalDate localDate) {
		if((localDate.getMonthValue()==7 && localDate.getDayOfMonth()>=17 && localDate.getDayOfMonth()<=31) || 
			(localDate.getMonthValue()==8 && localDate.getDayOfMonth()>=1 && localDate.getDayOfMonth()<=17)) {
			return true;
		}else {
			return false;
		}
		
	}
	
	@Autowired
	CustomerMapper customerMapper;
	
	public ReservInfoView getReservInfoView(int pageNum) {
		
		ReservInfoView reservInfoView = null;
		
		int firstRow = 0;
		List<ReservInfo> reservInfoList = new ArrayList<ReservInfo>();
		int reservCnt = reservMapper.reservCount();
		
		if(reservCnt>0) {
			List<Reserv> reservList = reservMapper.selectReservWithLimit(firstRow, RESERV_COUNT_PER_PAGE);
			for (Reserv reserv : reservList) {
			Customer customer = customerMapper.selectCustomerWithId(reserv.getUserId());
			Room room = roomService.getRoomById(reserv.getRoomId());
			reservInfoList.add(new ReservInfo(reserv.getId(),reserv.getUserId(), room.getConcept(),
					customer.getName(), reserv.getStartDate(),reserv.getEndDate(), reserv.getTotalPrice(), reserv.getPeopleCount(),reserv.getState(),customer.getPhone()));
			}
		}
		reservInfoView = new ReservInfoView(reservCnt, pageNum, firstRow, RESERV_COUNT_PER_PAGE, reservInfoList);
		return reservInfoView;
	}
	public List<Room> getReservCheckNoRoomId(LocalDate startDate, LocalDate endDate) {
		List<Reserv> reservList =  reservMapper.selectReservListByStartAndEndDate(startDate,endDate);
		List<Room> roomList =  roomService.getRoomAll();
		List<Integer> deleteIndex = new ArrayList<Integer>();
		
		for (int i = 0; i < roomList.size(); i++) {
			for (Reserv reserv : reservList) {
				if(roomList.get(i).getId() == reserv.getId()) {
					deleteIndex.add(i);
				}
			}
		}
		for (Integer integer : deleteIndex) {
			roomList.remove(roomList.get(integer));
		}
		return roomList;
		
	}
	public void updateReservState(int id) {
		Reserv reserv = reservMapper.selectReservById(id);
		String state = "입금";
		if(reserv.getState().equals("입금"))
			state = "미입금";
		reservMapper.updateReservState(id,state);
	}

	
	
}

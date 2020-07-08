package model.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import model.dto.Reserv;
import model.mapper.ReservMapper;

@Service("scheduleService")
public class ScheduleService {

	@Autowired
	ReservMapper reservMapper;

	@Transactional
	public void deleteReserv() {
		List<Reserv> reservList = reservMapper.selectReservList();
		if (reservList.size() > 0) {
			LocalDate now = LocalDate.now();
			LocalDateTime nowWithTime = LocalDateTime.now();
			for (Reserv reserv : reservList) {
				if(reserv.getState().equals("미입금")) {
					if(reserv.getStartDate().equals(now) && nowWithTime.getHour()>11 || reserv.getStartDate().equals(now) && nowWithTime.getHour()==11 && nowWithTime.getMinute()>=30) {
						reservMapper.deleteReserv(reserv.getId());
					}
					if(now.compareTo(reserv.getRegDate().toLocalDate())>= 2) {
						reservMapper.deleteReserv(reserv.getId());
					}
				}else if(reserv.getEndDate().equals(now)) {
					reservMapper.deleteReserv(reserv.getId());
				}
			}
		}
	}

}

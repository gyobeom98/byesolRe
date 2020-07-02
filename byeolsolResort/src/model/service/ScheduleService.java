package model.service;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import model.dto.Reserv;
import model.mapper.ReservMapper;

@Service("scheduleService")
public class ScheduleService {

	@Autowired
	ReservMapper reservMapper;

	public void test() {
		List<Reserv> reservList = reservMapper.selectReservList();
		if (reservList.size() > 0) {
			LocalDate now = LocalDate.now();
			for (Reserv reserv : reservList) {
				if (now.compareTo(reserv.getRegDate().toLocalDate()) >= 2) {
					reservMapper.deleteReserv(reserv.getId());
				}
			}
		}
	}

}

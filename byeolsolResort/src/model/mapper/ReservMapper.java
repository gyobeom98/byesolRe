package model.mapper;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import model.dto.Reserv;

public interface ReservMapper {

	public void insertReserv (Reserv reserv);
	
	public void updateReserv (Reserv reserv);
	
	public void deleteReserv (int id);
	
	public List<Reserv> selectReservList();
	
	public List<Reserv> selectReservListByUserIdWithLimit(@Param("userId")String userId, @Param("firstRow")int firstRow, @Param("reservCountPerPage")int reservCountPerPage);
	
	public Reserv selectReservByRoomIdWithDate(@Param("roomId")int roomId,@Param("startDate")LocalDate startDate, @Param("endDate")LocalDate endDate);

	public Reserv selectReservById(int reservId);

	public void deleteReservByState();

}

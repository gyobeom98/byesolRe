package model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.dto.Room;
import model.mapper.RoomMapper;

@Service("roomService")
public class RoomService {

	@Autowired
	RoomMapper roomMapper;
	
	public Room getRoomById(int id) {
		return roomMapper.selectRoomById(id);
	}
	
	public List<Room> getRoomAll(){
		return roomMapper.selectRoomList();
	}
	
	public List<Room> getRoomListByConcept(String concept){
		return roomMapper.selectRoomListByConcept(concept);
	}

	public Room getRoomByRoomNum(int roomNum) {
		// TODO Auto-generated method stub
		return roomMapper.selectRommByRoomNum(roomNum);
	}
	
}

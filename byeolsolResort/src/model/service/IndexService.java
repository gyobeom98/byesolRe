package model.service;

import org.springframework.stereotype.Service;

@Service("indexService")
public class IndexService {

	public String returnPath (String classification , String value) {
		
		String path = "";
		
		switch(classification) {
		case "mainImg" : case "byeolsolinfo": case "roomMain": case "healingRoom": case "gameRoom": case "kidsRoom": 
		case "trip": case "moun": case "golf": case "logo": 
			path += "/index"; break;
		case "board" : path+="/board"; break;
		case "event" : path +="/event"; break;
		case "reserv": path += "/reserv"; break;
		case "service": path += "/cus"; break;
		}
		
		switch(value) {
		case "main": case "logo" :  path+="/main"; break;
		case "R1subImg": path += "/roomInfo_01"; break;
		case "R2subImg": path += "/roomInfo_02"; break;
		case "R3subImg": path += "/roomInfo_03"; break;
		case "RMsubimg": path += "/roomMain"; break;
		case "byeolsolnewssub" : path+="/list"; break;
		case "" : path+="adminUserInfo"; break;
		}
		
		return path;
	}
	
	
}

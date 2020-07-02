package model.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import model.dto.Event;
import model.mapper.EventMapper;
import model.view.EventView;

@Service("eventService")
public class EventService {
	private static final String FILE_FOLDER_PATH = "c:/Users/tjoeun/byeolsolResort/";
	private static final int EVENT_COUNT_PER_PAGE = 5;

	@Autowired
	EventMapper eventMapper;

	public EventView getEventView(int pageNum) {
		EventView eventview = null;

		int firstRow = 0;
		List<Event> eventList = null;
		int eventCnt = eventMapper.countEvent();

		if (eventCnt > 0) {
			firstRow = (pageNum - 1) * EVENT_COUNT_PER_PAGE;
			eventList = eventMapper.selectEventListWithLimit(firstRow, EVENT_COUNT_PER_PAGE);
		} else {
			pageNum = 0;
		}

		eventview = new EventView(eventCnt, pageNum, firstRow, EVENT_COUNT_PER_PAGE, eventList);
		return eventview;
	}
	
	@Autowired
	FtpService ftpService;
	
	public boolean addEvent(Event event, MultipartFile uploadFile) {
		if (typeCheck(uploadFile)) {
			String addTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH_mm_ss_SSSS"));
			ftpService.ftpEventImg(uploadFile, addTime);
			event.setImgPath("http://tjteam.dothome.co.kr/byeolsolResort/event/"+addTime+"/"+uploadFile.getOriginalFilename());
			eventMapper.insertEvent(event);
			return true;
		} else {
			return false;
		}
	}

	public boolean typeCheck(MultipartFile uploadFile) {

		String fileType = uploadFile.getOriginalFilename().substring(uploadFile.getOriginalFilename().indexOf('.'),
				uploadFile.getOriginalFilename().length());
		if (fileType.equals(".jpg") || fileType.equals(".png") || fileType.equals(".jpeg")) {
			return true;
		} else
			return false;
	}

	public String addImage(MultipartFile uploadFile) {
		String eventPath = FILE_FOLDER_PATH + "event";
		File fileEvent = new File(eventPath);
		String addTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH_mm_ss_SSSS"));
		if(fileEvent.mkdir()) {
			
		}
		String path = eventPath+"/"+addTime;
		System.out.println("path : " + path);
		File file01 = new File(path);
		if (file01.mkdir()) {
			System.out.println("test");
		}
		File file = new File(path, uploadFile.getOriginalFilename());
		
		try {
			uploadFile.transferTo(file);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "event/" + addTime + "/" + uploadFile.getOriginalFilename();
	}
	
	public String updateImage(MultipartFile uploadFile , String path) {
		String upPath = path.substring(0, path.lastIndexOf('/'));
		File file = new File(FILE_FOLDER_PATH + path);
		System.out.println("file path : " + FILE_FOLDER_PATH+path);
		if (file.canRead()) {
			file.delete();
			File file01 = new File(FILE_FOLDER_PATH+ upPath, uploadFile.getOriginalFilename());
			System.out.println("file.getName : "+file.getName());
			System.out.println("file.getPath : " +file.getPath());
			try {
				uploadFile.transferTo(file01);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} 
		return upPath + "/" + uploadFile.getOriginalFilename();
	}
	
	public Event getEvent(int id) {
		return eventMapper.selectEventById(id);
	}
	
	public boolean updateEventWithFile(MultipartFile uploadFile,Event event) {
		if(typeCheck(uploadFile)) {
			String Time = event.getImgPath().substring(event.getImgPath().indexOf('/',46)+1,event.getImgPath().lastIndexOf('/'));
			ftpService.ftpdeleteEvent(event.getImgPath(), Time);
			ftpService.ftpEventImg(uploadFile, Time);
			event.setImgPath("http://tjteam.dothome.co.kr/byeolsolResort/event/"+Time+"/"+uploadFile.getOriginalFilename());
			eventMapper.updateEvent(event);
			return true;
		}else return false;
		
	}
	
	public void updateEvent(Event event) {
		eventMapper.updateEvent(event);
	}

	public void removeEvent(int id) {
		eventMapper.deleteEvent(id);
	}
	
}

package model.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import model.dto.Event;
import model.dto.EventImg;
import model.dto.EventWithThumb;
import model.mapper.EventImgMapper;
import model.mapper.EventMapper;
import model.view.EventView;

@Service("eventService")
public class EventService {
	private static final String FILE_FOLDER_PATH = "c:/Users/tjoeun/byeolsolResort/";
	private static final int EVENT_COUNT_PER_PAGE = 5;

	@Autowired
	EventMapper eventMapper;

	@Autowired
	EventImgMapper eventImgMapper;

	public EventView getEventView(int pageNum) {
		EventView eventview = null;

		int firstRow = 0;
		List<Event> eventList = null;
		List<EventWithThumb> eventWithThumbList = new ArrayList<EventWithThumb>();
		int eventCnt = eventMapper.countEvent();

		if (eventCnt > 0) {
			firstRow = (pageNum - 1) * EVENT_COUNT_PER_PAGE;
			eventList = eventMapper.selectEventListWithLimit(firstRow, EVENT_COUNT_PER_PAGE);
			
			for (Event event : eventList) {
				EventImg eventImg = eventImgMapper.selectEventImgByEventId(event.getId());
				eventWithThumbList.add(new EventWithThumb(event, eventImg.getImgPath()));
			}
			
			
			
		} else {
			pageNum = 0;
		}

		eventview = new EventView(eventCnt, pageNum, firstRow, EVENT_COUNT_PER_PAGE, eventWithThumbList);
		return eventview;
	}

	@Autowired
	FtpService ftpService;

	@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor = {IOException.class})
	public boolean addEvent(Event event, MultipartFile uploadFile, MultipartFile thumbnail) throws IOException {
		if (typeCheck(uploadFile)) {
			String addTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH_mm_ss_SSSS"));
			ftpService.ftpEventImg(uploadFile, addTime);
			event.setImgPath("http://tjteam.dothome.co.kr/byeolsolResort/event/" + addTime + "/"
					+ uploadFile.getOriginalFilename());
				eventMapper.insertEvent(event);
				if(!addEventImgThumbnail(thumbnail,event.getId())) {
					throw new IOException();
				}
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
		if (fileEvent.mkdir()) {

		}
		String path = eventPath + "/" + addTime;
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


	public Event getEvent(int id) {
		return eventMapper.selectEventById(id);
	}

	public boolean updateEventWithFile(MultipartFile uploadFile, Event event) {
		if (typeCheck(uploadFile)) {
			String Time = event.getImgPath().substring(event.getImgPath().indexOf('/', 46) + 1,
					event.getImgPath().lastIndexOf('/'));
			ftpService.ftpdeleteEvent(event.getImgPath(), Time);
			ftpService.ftpEventImg(uploadFile, Time);
			event.setImgPath("http://tjteam.dothome.co.kr/byeolsolResort/event/" + Time + "/"
					+ uploadFile.getOriginalFilename());
			eventMapper.updateEvent(event);
			return true;
		} else
			return false;

	}

	public void updateEvent(Event event) {
		eventMapper.updateEvent(event);
	}
	
	@Transactional(propagation = Propagation.REQUIRES_NEW, rollbackFor = {IOException.class})
	public boolean removeEvent(int id) throws IOException{
		
		Event event = eventMapper.selectEventById(id);
		if(event!=null) {
		String Time = event.getImgPath().substring(event.getImgPath().indexOf('/', 46) + 1,
				event.getImgPath().lastIndexOf('/'));
		if(!ftpService.ftpdeleteEvent(event.getImgPath(), Time)) {
			throw new IOException();
		}
		if (deleteEventImgThumbnaul(id)) {
			eventMapper.deleteEvent(id);
			return true;
		} else {
			throw new IOException();
		}
		}else {
			return false;
		}
		
	}

	public boolean addEventImgThumbnail(MultipartFile thumbnail, int eventId) {
		if (ftpService.fileTypeCheck(thumbnail)) {
			if (ftpService.ftpEventThumbImg(thumbnail, eventId)) {
				eventImgMapper.insertEventImg(
						new EventImg(0, eventId, "http://tjteam.dothome.co.kr/byeolsolResort/event/event_" + eventId
								+ "_thumbnail/" + thumbnail.getOriginalFilename()));
				return true;
			} else {
				return false;
			}

		} else {
			return false;
		}

	}

	public boolean deleteEventImgThumbnaul(int eventId) {
		EventImg eventImg = eventImgMapper.selectEventImgByEventId(eventId);
		if(ftpService.ftpDeleteEventImg(eventImg.getImgPath(), eventId)) {
			eventImgMapper.deleteEventImg(eventId);
			return true;
		}else
		return false; 

	}
	
	public String getImgPath (int eventId) {
		return eventImgMapper.selectEventImgByEventId(eventId).getImgPath();
	}

	
	
	

}

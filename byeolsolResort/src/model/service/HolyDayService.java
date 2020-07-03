package model.service;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

@Service
public class HolyDayService {
	private static final String SERVICE_CODE = "lMRbRl%2BmjOxVJXeAnFwSgfeB5ZhzVjnpCaRLIPKwJ%2BoNX1GT2PtsVmJoyWuuGD%2BwNHs5PkayxxxFWla29YQcPQ%3D%3D";
	
	// y = 연도, m= 월
	public static List<String> get(int y , int m) {
		HttpURLConnection conn = null;
		List<String> resultList = new ArrayList<String>();
		try {
			
			URL url = new URL("http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo?ServiceKey="+SERVICE_CODE+
					"&solYear="+y+"&solMonth="+m);
			conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestProperty("Accept-language", "ko");
			
			Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(conn.getInputStream());
			
			boolean ok = false;
			Element e;
			NodeList nodeList= doc.getElementsByTagName("header");
			
			if(nodeList.getLength()>0) {
			e= (Element)nodeList.item(0);	
				if(e.getElementsByTagName("resultCode").item(0).getTextContent().equals("00")) {
					ok = true;
				}else {
					ok = false;
					resultList.add("error");
				}
				
			}
			
			if(ok) {
				nodeList = doc.getElementsByTagName("item");
				for (int i = 0; i < nodeList.getLength(); i++) {
					e = (Element)nodeList.item(i);
					resultList.add(e.getElementsByTagName("locdate").item(0).getTextContent());
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(conn != null) {
			conn.disconnect();
		}
		return resultList;
	}
	
}

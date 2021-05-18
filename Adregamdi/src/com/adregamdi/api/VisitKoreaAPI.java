package com.adregamdi.api;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.adregamdi.dto.VisitKoreaDTO;


@Service
public class VisitKoreaAPI {
	// 한국관광공사_국문 관광정보 서비스 ( 참고 : https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15057787 )
	final String serviceKey = "1Pu4UXuCj88qEZ2m7lWAsNCj4FcA8nhUutYQlXwqrnKRQiB5cuYHPlvedpq%2B0uoo8%2FuZ0TqCSiMtt0BA51OWNA%3D%3D";
	//final String serviceKey = "qnCiac2R%2FyDsI9qIRqZ8fYyyptvK%2FW%2F5hLtuE7CrNIoMLR1gJtqlIa0VbbYvYGhAVCOnheRCj2NsHdX2H58Y0g%3D%3D";
	
	// T map API ( 참고 : http://tmapapi.sktelecom.com/index.html )
	final String tmapKey = "l7xxdc109d32e488487dbf0e29b9dfcf1a59";
	
	public static String getTagValue(String tag, Element element) {
		try {
			NodeList nodeList = element.getElementsByTagName(tag).item(0).getChildNodes();
			Node value = (Node) nodeList.item(0);
			if(value == null) {
				return null;
			}
			return value.getNodeValue();
		} catch (NullPointerException e) {
			return null;
		}
	}
	
	// VisitKorea 지역기반 관광정보조회
	public ArrayList<String> getContentIdList(String pageNo, String sigunguCode, String contentTypeId, String numOfRow) throws SAXException, IOException, ParserConfigurationException {
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?"
							 + "serviceKey=" + serviceKey
							 + "&pageNo=" + pageNo
							 + "&numOfRows=" + numOfRow 				 // numOfROW : 한 페이지 결과 수
							 + "&MobileOS=ETC"
							 + "&MobileApp=AppTest"
							 + "&arrange=P"            					 // arrange(정렬기준) = P(조회순)
							 + "&cat1="
							 + "&contentTypeId=" + contentTypeId // contentTypeId : 관광타입(관광지, 숙박 등) ID
							 + "&areaCode=39"          					 // areaCode(지역코드) = 39(제주도)
							 + "&sigunguCode=" + sigunguCode     // sigunguCode : 시군구코드
							 + "&cat2="
							 + "&cat3="
							 + "&listYN=Y"                       // listYN : 목록 구분 (Y = 목록, N = 개수)
							 + "&modifiedtime=";
		
		// XML Parsing
		DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
		Document document = documentBuilder.parse(url);
		
		document.getDocumentElement().normalize();
		
		NodeList nodeList = document.getElementsByTagName("item");
		
		ArrayList<String> contentIdList = new ArrayList<String>();
		
		for(int i = 0; i < nodeList.getLength(); i++) {
			Node node = nodeList.item(i);
			if(node.getNodeType() == Node.ELEMENT_NODE) {
				Element element = (Element) node;
				contentIdList.add(getTagValue("contentid", element));
			}
		}
		return contentIdList;
	}
	
	// VisitKorea 공통정보조회
	public ArrayList<NodeList> getSpotInfo(ArrayList<String> contentIdList) throws ParserConfigurationException, SAXException, IOException, InterruptedException {
		ArrayList<NodeList> infoList = new ArrayList<NodeList>();
		for(int i = 0; i < contentIdList.size(); i++) {
			String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"
								 + "serviceKey=" + serviceKey
								 + "&numOfRows=1"
								 + "&pageNo=1"
								 + "&MobileOS=ETC"
								 + "&MobileApp=AppTest"
								 + "&areacodeYN=Y"
								 + "&catcodeYN=Y"
								 + "&addrinfoYN=Y"
								 + "&contentId=" + contentIdList.get(i)
								 + "&contentTypeId="
								 + "&defaultYN=Y"
								 + "&firstImageYN=Y"
								 + "&mapinfoYN=Y"
								 + "&overviewYN=Y";
			
			// XML Parsing
			DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
			Document document = documentBuilder.parse(url);
			
			document.getDocumentElement().normalize();
			
			NodeList nodeList = document.getElementsByTagName("item");
			infoList.add(nodeList);
		}
		return infoList;
	}
	
	//VisitKorea 지역기반 관광정보조회 (TotalCount)
	public int getTotalCount(String contentTypeId, String sigunguCode) throws ParserConfigurationException, SAXException, IOException {
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?"
							 + "serviceKey=" + serviceKey
							 + "&MobileApp=AppTest"
							 + "&MobileOS=ETC"
							 + "&contentTypeId=" + contentTypeId
							 + "&areaCode=39"
							 + "&sigunguCode=" + sigunguCode
							 + "&listYN=N";
		
		// XML Parsing
		DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
		Document document = documentBuilder.parse(url);
		
		document.getDocumentElement().normalize();
		
		NodeList nodeList = document.getElementsByTagName("item");
		
		ArrayList<Integer> contentIdList = new ArrayList<Integer>();
		
		for(int i = 0; i < nodeList.getLength(); i++) {
			Node node = nodeList.item(i);
			if(node.getNodeType() == Node.ELEMENT_NODE) {
				Element element = (Element) node;
				contentIdList.add(Integer.parseInt(getTagValue("totalCnt", element)));
			}
		}
		return contentIdList.get(0);
	}
	
	// VisitKorea 공통정보조회 : getContentIdList() + getSpotInfo()
	public List<VisitKoreaDTO> getInformation(VisitKoreaDTO visitKoreaDTO, int totalCount) throws SAXException, IOException, ParserConfigurationException, InterruptedException {
		ArrayList<String> contentIdList = getContentIdList(visitKoreaDTO.getPageNo(), visitKoreaDTO.getSigunguCode(), visitKoreaDTO.getContentTypeId(), visitKoreaDTO.getNumOfRow());
		ArrayList<NodeList> spotInfo = getSpotInfo(contentIdList);
		List<VisitKoreaDTO> information = new ArrayList<VisitKoreaDTO>();
		for(int i = 0; i < spotInfo.size(); i++) {
			VisitKoreaDTO spot = new VisitKoreaDTO();
			for(int j = 0; j < spotInfo.get(i).getLength(); j++) {
				Node node = spotInfo.get(i).item(j);
				if(node.getNodeType() == Node.ELEMENT_NODE) {
					Element element = (Element) node;
					if(getTagValue("firstimage2", element) == null) {
						spot.setFirstImage2("/images/schedule/thumbnail.png");
					}else {
						spot.setFirstImage2(getTagValue("firstimage2", element));
					}
					spot.setTitle(getTagValue("title", element));
					if(!visitKoreaDTO.getContentTypeId().equals("25")) {
						spot.setAddr1(getTagValue("addr1", element));
					}
					spot.setOverview(getTagValue("overview", element));
					spot.setContentId(getTagValue("contentid", element));
					spot.setContentTypeId(getTagValue("contenttypeid", element));
					spot.setMapX(getTagValue("mapx", element));
					spot.setMapY(getTagValue("mapy", element));
					spot.setTotalCount(Integer.toString(totalCount));
				}
			}
			information.add(spot);
		}
		return information;
	}
	
	// VisitKorea 공통정보조회
	public List<String> getCommonInfo(String contentId, String contentTypeId, List<String> information) throws ParserConfigurationException, SAXException, IOException {
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?"
							 + "serviceKey=" + serviceKey
							 + "&numOfRows=1"
							 + "&pageNo=1"
							 + "&MobileOS=ETC"
							 + "&MobileApp=AppTest"
							 + "&contentId=" + contentId
							 + "&contentTypeId=" + contentTypeId
							 + "&defaultYN=Y"
							 + "&firstImageYN=Y"
							 + "&areacodeYN=Y"
							 + "&catcodeYN=Y"
							 + "&addrinfoYN=Y"
							 + "&mapinfoYN=Y"
							 + "&overviewYN=Y";
		
		// XML Parsing
		DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
		Document document = documentBuilder.parse(url);
		
		document.getDocumentElement().normalize();
		
		NodeList nodeList = document.getElementsByTagName("item");
		for(int i = 0; i < nodeList.getLength(); i++) {
			Node node = nodeList.item(i);
			if(node.getNodeType() == Node.ELEMENT_NODE) {
				Element element = (Element) node;
				if(getTagValue("firstimage", element) == null) {
					information.add("/images/schedule/thumbnail.png");
				} else {
					information.add(getTagValue("firstimage", element));
				}
				information.add(getTagValue("title", element));
				information.add(getTagValue("overview", element));
				information.add(getTagValue("addr1", element));
				information.add(getTagValue("mapy", element));
				information.add(getTagValue("mapx",element));
			}
		}
		return information;
	}
	
	// VisitKorea 소개정보조회
	public List<String> getIntroduceInfo(String contentId, String contentTypeId, List<String> information) throws ParserConfigurationException, SAXException, IOException {
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?"
							 + "serviceKey="+serviceKey
							 + "&numOfRows=1"
							 + "&pageNo=1"
							 + "&MobileOS=ETC"
							 + "&MobileApp=AppTest"
							 + "&contentId=" + contentId
							 + "&contentTypeId=" + contentTypeId;
		
		// XML Parsing
		DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
		Document document = documentBuilder.parse(url);
			
		document.getDocumentElement().normalize();
			
		NodeList nodeList = document.getElementsByTagName("item");
		
		switch (contentTypeId) {
			
			// 관광지(12) : 문의 및 안내(infocenter),  쉬는날(restdate), 이용시간(usetime)
			case "12":
				for(int i = 0; i < nodeList.getLength(); i++) {
					Node node = nodeList.item(i);
					if(node.getNodeType() == Node.ELEMENT_NODE) {
						Element element = (Element) node;
						information.add(getTagValue("infocenter", element));
						information.add(getTagValue("restdate", element));
						information.add(getTagValue("usetime", element));
					}
				}
				break;
			
			// 문화시설(14) : 문의 및 안내(infocenterculture), 이용요금(usefee), 이용시간(usetimeculture)
			case "14":
				for(int i = 0; i < nodeList.getLength(); i++) {
					Node node = nodeList.item(i);
					if(node.getNodeType() == Node.ELEMENT_NODE) {
						Element element = (Element) node;
						information.add(getTagValue("infocenterculture", element));
						information.add(getTagValue("usefee", element));
						information.add(getTagValue("usetimeculture", element));
					}
				}
				break;
			
			// 축제 / 공연 / 행사(15) : 행사 홈페이지(eventhompage), 주최자 연락처(sponsor1tel), 공연시간(playtime), 이용요금(usetimefestival)
			case "15":
				for(int i = 0; i < nodeList.getLength(); i++) {
					Node node = nodeList.item(i);
					if(node.getNodeType() == Node.ELEMENT_NODE) {
						Element element = (Element) node;
						information.add(getTagValue("eventhompage", element));
						information.add(getTagValue("sponsor1tel", element));
						information.add(getTagValue("playtime", element));
						information.add(getTagValue("usetimefestival", element));
					}
				}
				break;
			
			// 여행코스(25) : 문의 및 안내(infocentertourcourse), 코스 총 소요시간(taketime), 코스 테마(theme)
			case "25":
				for(int i = 0; i < nodeList.getLength(); i++) {
					Node node = nodeList.item(i);
					if(node.getNodeType() == Node.ELEMENT_NODE) {
						Element element = (Element) node;
						information.add(getTagValue("infocentertourcourse", element));
						information.add(getTagValue("taketime", element));
						information.add(getTagValue("theme", element));
					}
				}
				break;
			
			// 레포츠(28) : 문의 및 안내(infocenterleports), 휴무일(restdateleports), 입장료(usefeeleports), 이용시간(usetimeleports)
			case "28":
				for(int i = 0; i < nodeList.getLength(); i++) {
					Node node = nodeList.item(i);
					if(node.getNodeType() == Node.ELEMENT_NODE) {
						Element element = (Element) node;
						information.add(getTagValue("infocenterleports", element));
						information.add(getTagValue("restdateleports", element));
						information.add(getTagValue("usefeeleports", element));
						information.add(getTagValue("usetimeleports", element));
					}
				}
				break;
				
			// 숙박(32) : 입실 시간(checkintime), 퇴실 시간(checkouttime), 문의 및 안내(infocenterlodging), 예약안내 홈페이지(reservationurl), 예약안내(reservationlodging)
			case "32":
				for(int i = 0; i < nodeList.getLength(); i++) {
					Node node = nodeList.item(i);
					if(node.getNodeType() == Node.ELEMENT_NODE) {
						Element element = (Element) node;
						information.add(getTagValue("checkintime", element));
						information.add(getTagValue("checkouttime", element));
						information.add(getTagValue("infocenterlodging", element));
						information.add(getTagValue("reservationurl", element));
						information.add(getTagValue("reservationlodging", element));
					}
				}
				break;
			
			// 쇼핑(38) : 문의 및 안내(infocentershopping), 영업시간(opentime), 휴무일(restdateshopping)
			case "38":
				for(int i = 0; i < nodeList.getLength(); i++) {
					Node node = nodeList.item(i);
					if(node.getNodeType() == Node.ELEMENT_NODE) {
						Element element = (Element) node;
						information.add(getTagValue("infocentershopping", element));
						information.add(getTagValue("opentime", element));
						information.add(getTagValue("restdateshopping", element));
					}
				}
				break;
			
			// 음식(39) : 대표 메뉴(firstmenu), 문의 및 안내(infocenterfood), 영업시간(opentimefood), 휴무일(restdatefood)
			case "39":
				for(int i = 0; i < nodeList.getLength(); i++) {
					Node node = nodeList.item(i);
					if(node.getNodeType() == Node.ELEMENT_NODE) {
						Element element = (Element) node;
						information.add(getTagValue("firstmenu", element));
						information.add(getTagValue("infocenterfood", element));
						information.add(getTagValue("opentimefood", element));
						information.add(getTagValue("restdatefood", element));
					}
				}
				break;
		}
		return information;
	}
	
	// 상세정보조회
	public List<String> getEachInformation(VisitKoreaDTO visitKoreaDTO) throws ParserConfigurationException, SAXException, IOException {
		List<String> information = new ArrayList<String>();
		information = getCommonInfo(visitKoreaDTO.getContentId(), visitKoreaDTO.getContentTypeId(), information);
		information = getIntroduceInfo(visitKoreaDTO.getContentId(), visitKoreaDTO.getContentTypeId(), information);
		return information;
	}
	
	// VisitKorea 키워드조회
	public List<VisitKoreaDTO> getKeywordInformation(VisitKoreaDTO visitKoreaDTO, String keyword) throws ParserConfigurationException, SAXException, IOException, InterruptedException {
		String encodeKeyword = URLEncoder.encode(keyword, "UTF-8");
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?"
							 + "serviceKey="+serviceKey
							 + "&MobileApp=AppTest"
							 + "&MobileOS=ETC"
							 + "&pageNo=" + visitKoreaDTO.getPageNo()
							 + "&numOfRows=" + visitKoreaDTO.getNumOfRow()
							 + "&listYN=Y"
							 + "&arrange=P"
							 + "&contentTypeId="
							 + "&areaCode=39"
						   + "&sigunguCode="
							 + "&cat1="
							 + "&cat2="
							 + "&cat3="
							 + "&keyword=" + encodeKeyword;
		
		// XML Parsing
		DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
		Document document = documentBuilder.parse(url);
			
		document.getDocumentElement().normalize();
			
		NodeList nodeList = document.getElementsByTagName("item");
		ArrayList<String> contentIdList = new ArrayList<String>();
		for(int i = 0; i < nodeList.getLength(); i++) {
			Node node = nodeList.item(i);
			if(node.getNodeType() == Node.ELEMENT_NODE) {
				Element element = (Element) node;
				contentIdList.add(getTagValue("contentid", element));
			}
		}
	  
		String totalCount = "";
		nodeList = document.getElementsByTagName("totalCount");
		Node countNode = nodeList.item(0);
		if(countNode.getNodeType() == Node.ELEMENT_NODE) {
			Element element = (Element) countNode;
			totalCount = getTagValue("totalCount", element);
		}
		
		ArrayList<NodeList> spotInfo = getSpotInfo(contentIdList);
		List<VisitKoreaDTO> result = new ArrayList<VisitKoreaDTO>();
		for(int i = 0; i < spotInfo.size(); i++) {
			VisitKoreaDTO spot = new VisitKoreaDTO();
			for(int j = 0; j < spotInfo.get(i).getLength(); j++) {
				Node infoNode = spotInfo.get(i).item(j);
				if(infoNode.getNodeType() == Node.ELEMENT_NODE) {
					Element element = (Element) infoNode;
					if(getTagValue("firstimage2", element) == null) {
						spot.setFirstImage2("/images/schedule/thumbnail.png");
					}else {
						spot.setFirstImage2(getTagValue("firstimage2", element));
					}
					spot.setTitle(getTagValue("title", element));
					if(!visitKoreaDTO.getContentTypeId().equals("25")) {
						spot.setAddr1(getTagValue("addr1", element));
					}
					spot.setOverview(getTagValue("overview", element));
					spot.setContentId(getTagValue("contentid", element));
					spot.setContentTypeId(getTagValue("contenttypeid", element));
					spot.setMapX(getTagValue("mapx", element));
					spot.setMapY(getTagValue("mapy", element));
					spot.setTotalCount(totalCount);
				}
			}
			result.add(spot);
		}
		return result;
	}
}

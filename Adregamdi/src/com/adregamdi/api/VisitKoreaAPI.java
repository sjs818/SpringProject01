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
	//final String serviceKey = "1Pu4UXuCj88qEZ2m7lWAsNCj4FcA8nhUutYQlXwqrnKRQiB5cuYHPlvedpq%2B0uoo8%2FuZ0TqCSiMtt0BA51OWNA%3D%3D";
	final String serviceKey = "qnCiac2R%2FyDsI9qIRqZ8fYyyptvK%2FW%2F5hLtuE7CrNIoMLR1gJtqlIa0VbbYvYGhAVCOnheRCj2NsHdX2H58Y0g%3D%3D";
	
	// T map API ( ��� : http://tmapapi.sktelecom.com/index.html )
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
	
	public ArrayList<String> getContentIdList(String pageNo, String sigunguCode, String contentTypeId, String numOfRow) throws SAXException, IOException, ParserConfigurationException {
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?"
							 + "serviceKey=" + serviceKey
							 + "&pageNo=" + pageNo
							 + "&numOfRows=" + numOfRow 				 // numOfROW : �� ������ ��� ��
							 + "&MobileOS=ETC"
							 + "&MobileApp=AppTest"
							 + "&arrange=P"            					 // arrange(��ı���) = P(�ȸ��)
							 + "&cat1="
							 + "&contentTypeId=" + contentTypeId // contentTypeId : ��Ÿ��(����, ��� ��) ID
							 + "&areaCode=39"          					 // areaCode(���ڵ�) = 39(��ֵ�)
							 + "&sigunguCode=" + sigunguCode     // sigunguCode : �ñ����ڵ�
							 + "&cat2="
							 + "&cat3="
							 + "&listYN=Y"                       // listYN : ��� ���� (Y = ���, N = ����)
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
	
	// VisitKorea �Ұ�����ȸ
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
			
			// ����(12) : ���� �� �ȳ�(infocenter),  ���³�(restdate), �̿�ð�(usetime)
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
			
			// ��ȭ�ü�(14) : ���� �� �ȳ�(infocenterculture), �̿���(usefee), �̿�ð�(usetimeculture)
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
			
			// ��� / �� / ���(15) : ��� Ȩ������(eventhompage), ������ ����ó(sponsor1tel), ��ð�(playtime), �̿���(usetimefestival)
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
			
			// �����ڽ�(25) : ���� �� �ȳ�(infocentertourcourse), �ڽ� �� �ҿ�ð�(taketime), �ڽ� �׸�(theme)
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
			
			// ������(28) : ���� �� �ȳ�(infocenterleports), �޹���(restdateleports), �����(usefeeleports), �̿�ð�(usetimeleports)
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
				
			// ���(32) : �Խ� �ð�(checkintime), ��� �ð�(checkouttime), ���� �� �ȳ�(infocenterlodging), ����ȳ� Ȩ������(reservationurl), ����ȳ�(reservationlodging)
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
			
			// ����(38) : ���� �� �ȳ�(infocentershopping), ����ð�(opentime), �޹���(restdateshopping)
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
			
			// ���(39) : ��ǥ �޴�(firstmenu), ���� �� �ȳ�(infocenterfood), ����ð�(opentimefood), �޹���(restdatefood)
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
	
	// ������ȸ
	public List<String> getEachInformation(VisitKoreaDTO visitKoreaDTO) throws ParserConfigurationException, SAXException, IOException {
		List<String> information = new ArrayList<String>();
		information = getCommonInfo(visitKoreaDTO.getContentId(), visitKoreaDTO.getContentTypeId(), information);
		information = getIntroduceInfo(visitKoreaDTO.getContentId(), visitKoreaDTO.getContentTypeId(), information);
		return information;
	}
	
	// VisitKorea Ű����ȸ
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
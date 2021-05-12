package com.adregamdi.api;

import java.io.IOException;
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
	
	// VisitKorea ������� ����������ȸ (Content ID)
	public ArrayList<String> getContentIdList(String pageNo, String sigunguCode, String contentTypeId, String numOfRow) throws SAXException, IOException, ParserConfigurationException {
		String url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?"
							 + "serviceKey=" + serviceKey
							 + "&pageNo=" + pageNo
							 + "&numOfRows=" + numOfRow 				 // numOfROW : �� ������ ��� ��
							 + "&MobileOS=ETC"
							 + "&MobileApp=AppTest"
							 + "&arrange=P"            					 // arrange(���ı���) = P(��ȸ��)
							 + "&cat1="
							 + "&contentTypeId=" + contentTypeId // contentTypeId : ����Ÿ��(������, ���� ��) ID
							 + "&areaCode=39"          					 // areaCode(�����ڵ�) = 39(���ֵ�)
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
	
	// VisitKorea ����������ȸ
	public ArrayList<NodeList> getSpotInfo(ArrayList<String> contentIdList) throws ParserConfigurationException, SAXException, IOException {
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
	
	//VisitKorea ������� ����������ȸ (TotalCount)
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
	
	// VisitKorea ����������ȸ
	public List<VisitKoreaDTO> getInformation(VisitKoreaDTO visitKoreaDTO, int totalCount) throws SAXException, IOException, ParserConfigurationException {
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
	
	/*
	 * public List<String> getCommonInfo(String contentId, String contentTypeId,
	 * List<String> information) {
	 * 
	 * }
	 */
}

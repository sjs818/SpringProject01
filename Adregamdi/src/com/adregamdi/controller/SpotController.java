package com.adregamdi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adregamdi.api.VisitKoreaAPI;
import com.adregamdi.dto.PageDTO;
import com.adregamdi.dto.SpotDTO;
import com.adregamdi.dto.VisitKoreaDTO;
import com.adregamdi.service.SpotService;


@Controller
@RequestMapping("/spot")
public class SpotController {
	
	private static int totalCount;
	
	@Autowired
	SpotService spotService;
	
	@Autowired
	private VisitKoreaAPI spot;

	@GetMapping("/main")
	public String spotMain(@RequestParam(value="pageNum", defaultValue="1")String pageNo,
			@RequestParam(value="sigunguCode", defaultValue="")String sigunguCode, @RequestParam(value="contentTypeId", defaultValue="")String contentTypeId, Model model ) throws Exception {
		
		totalCount = spot.getTotalCount(contentTypeId, sigunguCode);
		model.addAttribute("pageMaker", new PageDTO(pageNo, totalCount, 10));
		model.addAttribute("sigunguCode", sigunguCode);
		model.addAttribute("contentTypeId", contentTypeId);
		
		
		return "spot/main";
	}
	
	@ResponseBody
	@GetMapping("/information")
	public List<VisitKoreaDTO> getSpotInfo2(VisitKoreaDTO visitKoreaDTO, Model model) throws Exception {
		
		
		if(visitKoreaDTO.getPageNo()==null) visitKoreaDTO.setPageNo("1");
		if(visitKoreaDTO.getSigunguCode()==null) visitKoreaDTO.setSigunguCode("");
		if(visitKoreaDTO.getContentTypeId()==null) visitKoreaDTO.setContentTypeId("");
		
		return spot.getInformation(visitKoreaDTO, totalCount);
	}
	
	@GetMapping("/detail")
	public String spotDetail(VisitKoreaDTO visitKoreaDTO, Model model) throws Exception{
		
		System.out.println("detail");
		model.addAttribute("contentId", visitKoreaDTO.getContentId());
		model.addAttribute("contentTypeId", visitKoreaDTO.getContentTypeId());
		
		return "spot/detail";
	}
	
	@ResponseBody
	@GetMapping("/details")
	public List<String> getDetailsInfo(String contentId, String contentTypeId) throws Exception {
		
		VisitKoreaDTO visitKoreaDTO = new VisitKoreaDTO();
		
		visitKoreaDTO.setContentId(contentId);
		visitKoreaDTO.setContentTypeId(contentTypeId);
		
		System.out.println(contentId);
		
		return spot.getEachInformation(visitKoreaDTO);
	}
	
	@GetMapping("/local")
	public String localDetail(@RequestParam("local_no") int local_no) {
		return "spot/local";
	}
	
	@GetMapping("/thema")
	public String themaDetail(@RequestParam("thema_no") int thema_no) {
		return "spot/thema";
	}
		
	@GetMapping("/write")
	public String write(@ModelAttribute("writeSpotDTO") SpotDTO writeSpotDTO, Model model ) {
		return "spot/write";
	}
	
	
	@PostMapping("/write_proc")
	public String spotWriteProc(@ModelAttribute("writeSpotDTO") SpotDTO writeSpotDTO, BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			return "spot/write";
		}
		spotService.addSpotInfo(writeSpotDTO);
		model.addAttribute("spot_idx", writeSpotDTO.getSpot_idx());		
		
		System.out.println("writeProc : " + writeSpotDTO.getSpot_file());
		
		return "spot/write_success";
	}
	
	
	@GetMapping("/read") 
	public String spotRead(@ModelAttribute("readSpotDTO")SpotDTO readSpotDTO, @RequestParam("spot_idx")int spot_idx, Model model){
		
		readSpotDTO = spotService.getSpotInfo(spot_idx);
		System.out.println("read : " + readSpotDTO.getSpot_file());
		model.addAttribute("readSpotDTO", readSpotDTO);
		
		System.out.println("�뙆�씪�씠由� : " + readSpotDTO.getSpot_file());
		return "spot/read";
	}
	
	@GetMapping("/modify")
	public String spotModify(@ModelAttribute("modifySpotDTO")SpotDTO modifySpotDTO, @RequestParam("spot_idx")int spot_idx, Model model) {
		
		modifySpotDTO = spotService.getSpotInfo(spot_idx);
		model.addAttribute("modifySpotDTO", modifySpotDTO);		
		
		return "spot/modify";
	}
	
	@PostMapping("/modify_proc")
	public String spotModifyProc(@ModelAttribute("modifySpotDTO")SpotDTO modifySpotDTO, @RequestParam("spot_idx")int spot_idx, BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			return "spot/modify";
		}
		
		spotService.updateSpotInfo(modifySpotDTO, spot_idx);
		model.addAttribute("spot_idx", modifySpotDTO.getSpot_idx());
		
		return "spot/modify_success";
	}
	
	@GetMapping("/delete") 
	public String spotDelete(@RequestParam("spot_idx") int spot_idx) {
		
		spotService.deleteSpotInfo(spot_idx);
		
		return "spot/delete";
	}
	
	
}

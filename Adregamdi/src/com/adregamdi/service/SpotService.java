package com.adregamdi.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.adregamdi.dao.SpotDAO;
import com.adregamdi.dto.SpotDTO;

@Service
@PropertySource("/WEB-INF/properties/options.properties")
public class SpotService {

	@Autowired
	SpotDAO spotDAO;

	@Value("${path.load}")
	private String path_load;

	
	// 파일 이름을 조금씩 바꿔 정해준 경로에 저장
	private String saveUploadFile(MultipartFile upload_file) {
		String file_name = System.currentTimeMillis() + "_" + upload_file.getOriginalFilename();

		try {
			upload_file.transferTo(new File(path_load + "/" + file_name));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return file_name;
	}

	
	// 게시글 등록
	public void addSpotInfo(SpotDTO writeSpotDTO) {

		MultipartFile upload_file = writeSpotDTO.getUpload_file();

		if (upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			writeSpotDTO.setSpot_file(file_name);
			System.out.println("fileName : " + writeSpotDTO.getSpot_file()); // 파일 이름 저장
		}

		// writeSpotDTO.setSpot_writer(loginUserDTO.getUser_idx());
		spotDAO.addSpotInfo(writeSpotDTO);
	}

	
	// 1개의 게시글 정보 가져옴
	public SpotDTO getSpotInfo(int spot_idx) {
		return spotDAO.getSpotInfo(spot_idx);
	}

	
	// 게시글 수정
	public void updateSpotInfo(SpotDTO modifySpotDTO, int spot_idx) {

		MultipartFile upload_file = modifySpotDTO.getUpload_file();

		// 기존 데이터를 가져옴
		SpotDTO checkSpotDTO = spotDAO.getSpotInfo(spot_idx);
		
		if (upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			modifySpotDTO.setSpot_file(file_name);
			System.out.println("modify - Service (file_name) : " + modifySpotDTO.getSpot_file());

		} else { // 사이즈가 null이면 기존 파일의 이름 & 경로를 그대로 입력시켜줌
			modifySpotDTO.setSpot_file(checkSpotDTO.getSpot_file());
			modifySpotDTO.setUpload_file(checkSpotDTO.getUpload_file());
		}
		spotDAO.updateSpotInfo(modifySpotDTO);
	}
	
	
	// 게시글 삭제
	public void deleteSpotInfo(int spot_idx) {
		spotDAO.deleteSpotInfo(spot_idx);
	}

}

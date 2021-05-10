package com.adregamdi.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.adregamdi.dao.SpotDAO;
import com.adregamdi.dto.SpotDTO;

@Service
public class SpotService {
	
	@Autowired
	SpotDAO spotDAO;
	
	@Value("{path.load}")
	private String path_load;
	
	// 파일 이름을 조금씩 바꿔주는 메소드
	private String saveUploadFile(MultipartFile upload_file) {
		String file_name = System.currentTimeMillis() + "_" + upload_file.getOriginalFilename();
		
		System.out.println("??");
			try {
				upload_file.transferTo(new File(path_load + "/" + file_name));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}	
		
		return file_name;
	}
	
	public void addSpotInfo(SpotDTO writeSpotDTO) {
		
		MultipartFile upload_file = writeSpotDTO.getUpload_file();
		
		System.out.println("upload_file.getSize : " + upload_file.getSize());
		if(upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			writeSpotDTO.setContent_file(file_name);
		}
		
		// writeSpotDTO.setSpot_writer(loginUserDTO.getUser_idx());
		spotDAO.addSpotInfo(writeSpotDTO);
	}
	
	public SpotDTO getSpotInfo(int spot_idx) {
		return spotDAO.getSpotInfo(spot_idx);
	}

}

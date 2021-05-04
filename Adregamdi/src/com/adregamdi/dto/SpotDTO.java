package com.adregamdi.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SpotDTO {
	
	// 관광지 번호 
    private Integer spot_idx;

    // 관광지 이름 
    private String spot_name;

    // 지역번호 - 1(제주), 2(서귀포시)
    private Integer local_no;

    // 테마번호 - 1(놀거리), 2(먹거리), 3(볼거리)
    private Integer theme_no;

    // 관광지 주소 
    private String spot_addr;
    
    // 내용 
    private String spot_content;

    // 작성자 
    private Integer spot_writer;
    
    // 파일 등록
    private MultipartFile upload_file;

    
}

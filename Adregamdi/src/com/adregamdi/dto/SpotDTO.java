package com.adregamdi.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SpotDTO {
	
	  private int spot_idx;					//
    private String spot_name;				//
    private int local_no;					//
    private int thema_no;					//
    private String spot_content;			//
    private int spot_writer;				//
    private String spot_addr;				//
    
    private MultipartFile upload_file;
    
    private int spot_cnt;				// 조회수
    private int spot_like;
    private String spot_file;		// 파일 이름

	private int check;					// 어떤 페이지에서 넘어왔는지 확인하기(1:지역, 2:테마)
    
    public SpotDTO() {
    	spot_cnt=0;
    	spot_like=0;
    }	
}

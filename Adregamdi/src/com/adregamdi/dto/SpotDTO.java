package com.adregamdi.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SpotDTO {
	
	// 愿�愿묒� 踰덊샇 
    private Integer spot_idx;

    // 愿�愿묒� �씠由� 
    private String spot_name;

    // 吏��뿭踰덊샇 - 1(�젣二�), 2(�꽌洹��룷�떆)
    private Integer local_no;

    // �뀒留덈쾲�샇 - 1(��嫄곕━), 2(癒밴굅由�), 3(蹂쇨굅由�)
    private Integer theme_no;

    // 愿�愿묒� 二쇱냼 
    private String spot_addr;
    
    // �궡�슜 
    private String spot_content;

    // �옉�꽦�옄 
    private Integer spot_writer;
    
    // �뙆�씪 �벑濡�
    private MultipartFile upload_file;

    
}

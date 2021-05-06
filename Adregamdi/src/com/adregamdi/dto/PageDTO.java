package com.adregamdi.dto;

import lombok.Getter;

@Getter
public class PageDTO {
	
	// 최소 페이지 번호
	private int min;
	
	// 최대 페이지 번호
	private int max;
	
	// 이전 버튼을 누르면 이동하는 페이지 번호
	private int prevPage;
	
	// 다음 버튼을 누르면 이동하는 페이지 번호
	private int nextPage;
	
	// 전체 페이지 수
	private int pageCount;
	
	// 현재 페이지 번호
	private int currentPage;
	
	// contentCnt : 전체 게시글 수
	// contentPageCnt : 페이지 당 게시글 수
	public  PageDTO(int contentCnt, int currentPage, int contentPageCnt) {
		
		// 현재 페이지 번호
		this.currentPage = currentPage;
		
		// 전체 페이지 수 = 전체 게시글 수 / 페이지 당 게시글 수
		pageCount = contentCnt / contentPageCnt;
	
		if(contentCnt % contentPageCnt > 0) {
			pageCount++;
		}
		
		min = ((currentPage-1) / contentPageCnt) * contentPageCnt + 1;
		max = min + contentPageCnt - 1;
		
		if(max > pageCount) {
			max = pageCount;
		}
		
		prevPage = min - 1;
		nextPage = max + 1;
		
		if(nextPage > pageCount) {
			nextPage = pageCount;
		}
	}
}

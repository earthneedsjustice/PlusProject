package com.project.plus.domain;


import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	private int boardNum;
	private int clubNum;
	private int memberNum;
	private String boardTitle;
	private String boardContent;
	private String boardPic;
	
	@JsonFormat(pattern="yyyy. MM. dd HH:mm:ss", timezone ="Asia/Seoul")
	private Date boardRegDate;
	
	private String memberPic;
	private String memberNickname;
	private int commentsCount;
	

	public void setCommentsCount(int result) {
		this.commentsCount = result;
	}
	

}
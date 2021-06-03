package com.example.demo.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Board_outsourcing {
	private Integer boardid;
	private String set_boardid;
	private String title;
	private String content;
	private String writer;
	private Date date;
	private Integer click_num;
}

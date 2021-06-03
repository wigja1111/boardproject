package com.example.demo.service;

import java.util.List;

import com.example.demo.dto.Board_free;
import com.example.demo.dto.Member;

public interface MembersService {
	
		
	public List<Member> testMember(); // 모든 데이터를 SELECT 할 것이므로 리턴 타입을 List<Member>로 바꾼다
	
	public List<Board_free> board_Free(); // 메인페이지 자유게시판 리스트
	public List<Board_free> boarddetail_free(); //자유게시판 글목록 리스트
		
		
	public Board_free viewDetail(int boardid);  //게시글 클릭시 이동하고  데이터가져오기
	
	public boolean click_num_plus(int boardid); //조회수 증가
	
	public boolean deleteBoard(int boardid);  //게시글 삭제
	
	void insertBoard(Board_free board_free); //게시글 쓰기
	
	public Board_free viewUpdate(int boardid);  //수정 클릭시 이동하고  데이터가져오기
	
	void updateBoard(Board_free board_free); //게시글 수정
	
	
	
	Member getMember(Integer id);  //get 데이터 읽기
	
	void insertMember(Member member); // post 데이터 추가
	
	Member updateMember(Integer id, Member member);  //put 데이터 수정
}
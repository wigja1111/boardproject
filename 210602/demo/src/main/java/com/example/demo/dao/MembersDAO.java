package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.example.demo.dto.Board_free;
import com.example.demo.dto.Member;

@Repository

public interface MembersDAO {
//	Object updatedMember = null;

	
	
	public List<Member> testMember();
	
	public List<Board_free> board_Free(); // 메인페이지 자유게시판 리스트
	
	public List<Board_free> boarddetail_free(); //자유게시판 글목록 리스트
	
	public Board_free viewDetail(int boardid);  //게시글 클릭시 이동하고  데이터가져오기
	
	public boolean click_num_plus(int boardid); //조회수 증가
	
	public boolean deleteBoard(int boardid);  //게시글 삭제
	
	void insertBoard(Board_free board_free); //게시글 쓰기
	
	public Board_free viewUpdate(int boardid); //수정 클릭시 이동하고 데이터 가져오기
	
	void updateBoard(Board_free board_free); //게시글 수정
	
	
	
	
	
	Member getMember(Integer id);  //회원조회
		
	void insertMember(Member member);

	Member updateMember(@Param("id")Integer id, @Param("member")Member member);
	
	
}
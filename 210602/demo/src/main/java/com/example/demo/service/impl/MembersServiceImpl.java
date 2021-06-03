package com.example.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.demo.dao.MembersDAO;
import com.example.demo.dto.Board_free;
import com.example.demo.dto.Member;
import com.example.demo.service.MembersService;

@Service
public class MembersServiceImpl implements MembersService{

	@Autowired
	private MembersDAO dao; // @Autowired 어노테이션과 함께 dao를 여기에 선언해 준다.
	
	
	
	
	@Override
	public List<Member> testMember() { // 모든 데이터를 SELECT 할 것이므로 리턴 타입을 List<Member>로 바꾼다
		

		 System.out.println("여기1");
		return dao.testMember();
	}
	
	@Override  // 메인페이지 자유게시판
	public List<Board_free> board_Free(){
		return dao.board_Free();
	}
	
	@Override  // 자유게시판 리스트
	public List<Board_free> boarddetail_free(){
		return dao.boarddetail_free();
	}
	
	@Override //자유게시글 클릭시 이동하고 데이터가져오기
	public Board_free viewDetail (int boardid) {
		return dao.viewDetail(boardid);
	}
	
	@Override  //조회수증가
	public boolean click_num_plus(int boardid) {
	  return dao.click_num_plus(boardid);
	}
	
	@Override  //게시글삭제
	public boolean deleteBoard(int boardid) {
		return dao.deleteBoard(boardid);
	}
	
	@Override //게시글쓰기
	public void insertBoard(Board_free board_free) {  System.out.println("글쓰기");
		dao.insertBoard(board_free);
	}
	
	@Override //수정 클릭시 이동하고 데이터가져오기
	public Board_free viewUpdate (int boardid) {
		return dao.viewUpdate(boardid);
	}
	
	@Override //게시글수정
	public void updateBoard(Board_free board_free) {  System.out.println("글 수정");
		dao.updateBoard(board_free);
	}
	
	
	
	
	
	
	@Override
	public Member getMember(Integer id) { System.out.println("여기2");
		return dao.getMember(id);
	}
	
	@Override
	public void insertMember(Member member) { System.out.println("여기3");
		dao.insertMember(member);
	}

	@Override
	public Member updateMember(Integer id, Member member) { System.out.println("여기4");
		
		Member updatedMember = new Member();
     
		
	if(dao.updateMember(id, member).equals(1) ) {     System.out.println("여기5");
		updatedMember.setId(id);
		updatedMember.setName(member.getName());
		updatedMember.setAge(member.getAge());
		updatedMember.setDept(member.getDept());
	}
	  System.out.println("여기6");
		return updatedMember;
	}
	
	
	
}

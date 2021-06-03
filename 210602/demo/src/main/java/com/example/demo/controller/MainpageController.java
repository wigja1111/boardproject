package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.demo.dto.Board_free;
import com.example.demo.dto.Member;
import com.example.demo.service.MembersService;

		

@Controller

public class MainpageController {
	
	
	@Autowired
	private MembersService service;
	
	//메인페이지 자유게시판 컨트롤러
	 @GetMapping("/mainpage")
	    public void board_Free(Model model)  {	
			 		 
		 		model.addAttribute("list1", service.board_Free());

	}
	 
	 @GetMapping("/main")
	 public String maintest() {
		 return "/main";
	 }
	 @GetMapping("/boardwrite/free_write")
	 public String free_write() {
		 return "/boardwrite/free_write";
	 }
	 
	
	 
	 @GetMapping("/boarddtail/boarddetail_Free")
	 public String boarddetail_free(Model model) {
		 
		 model.addAttribute("list2", service.boarddetail_free());
		 
		 return "/boarddtail/boarddetail_Free";
	 }
	 
	
	 @GetMapping("*/detail")  
	 public String viewDetail(Model model, @RequestParam("boardid")int boardid) {
		 
		 model.addAttribute("list3", service.viewDetail(boardid)); // 페이지 이동시 아이디값을 찾아 DB에서 내용 가져옴

		
		  service.click_num_plus(boardid);   //조회수 증가 메소드 
		  
		  return "/boardlead/free_boardlead";
	 }
	 
	 
	 
	 @GetMapping("*/delete") //게시글 삭제
	 public String delete(@RequestParam("boardid")int boardid) {
	 	service.deleteBoard(boardid);
	 	return "/boarddetail_Free";
	 }
	 
	 
	 @PostMapping(path = "/boardwrite/free_write")  //글쓰기
		public String insertBoard(@RequestBody Board_free board_free) {
			service.insertBoard(board_free); 
			return "/boarddtail/boarddetail_Free";   
		}
	 
	 
	 @GetMapping("*/update")     // 수정 클릭시 이동하고 데이터가져오기
	 public String viewUpdate (Model model, @RequestParam("boardid")int boardid) {
		 
		 model.addAttribute("list3", service.viewUpdate(boardid)); // 페이지 이동시 아이디값을 찾아 DB에서 내용 가져옴
		   
		  return "/boardwrite/update_write";
	 }
	 
	 @PostMapping(path = "/boardwrite/update_write")  //글 수정하기
		public String updateBoard(@RequestBody Board_free board_free) {
			service.updateBoard(board_free); 
			return "/boarddtail/boarddetail_Free";   
		}
	 
	 
	
		//다음숙제 삭제후 리다이렉션 안됨 글쓰기후 리다이렉션안됨     업데이트 창 
		
	 
}

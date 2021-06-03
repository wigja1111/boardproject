package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dto.Member;
import com.example.demo.service.MembersService;

@RestController // RestController는 ResponseBody를 생성하는방식이 Controller와 다름 일반적으로 데이터를 전달할경우
				// Restcontroller를 쓰고 단순View를 표시할경우 Controller를씀
public class MembersController {

	@Autowired
	private MembersService service;

	
	
	@GetMapping(path = "/test")
	public List<Member> memberTest() {

		return service.testMember();
	}

	@GetMapping(path = "/members/{id}")
	public Member getMember(@PathVariable Integer id) {
		return service.getMember(id);
	}

	@PostMapping(path = "/main")
	public Member insertMember(@RequestBody Member member) {
		service.insertMember(member); 
		return member;    //보낸값을 그대로 리턴하는데    이 다음에 보여질 값들을 리턴해야함 예) 계정생성 -> 리턴:  아이디 :00 으로 만들어졌습니다. 
	}
	

	@PutMapping(path = "/members/{id}")
	public Member updateMember(@PathVariable Integer id, @RequestBody Member member) {
		return service.updateMember(id, member);
	}

}
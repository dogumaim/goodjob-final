package com.goodjob.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.companymember.model.CompanyMemberDAO;
import com.goodjob.companymember.model.CompanyMemberDTO;
import com.goodjob.normalmember.model.NormalMemberDAO;
import com.goodjob.normalmember.model.NormalMemberDTO;

@Controller
public class MemberController {
	@Autowired
	private NormalMemberDAO norDao;
	@Autowired
	private CompanyMemberDAO comDao;
	@RequestMapping(value = "join.do" ,method = RequestMethod.GET)
	public String join() {
		return "/member/join";
	}
	@RequestMapping(value = "normalJoin.do" ,method = RequestMethod.POST)
	public ModelAndView normalJoin(NormalMemberDTO dto) {
		ModelAndView mav=new ModelAndView();
		norDao.normalJoin(dto);
		return mav;
	}
	@RequestMapping(value = "comJoin.do",method = RequestMethod.POST)
	public ModelAndView comJoin(CompanyMemberDTO dto) {
		ModelAndView mav=new ModelAndView();
		comDao.comJoin(dto);
		return mav;
	}
	@RequestMapping(value = "updateMember.do" ,method = RequestMethod.GET)
	public ModelAndView updateMember(HttpSession session) {
			
		Integer sid=(Integer)session.getAttribute("sidx");
		String rating=(String)session.getAttribute("rating");
		ModelAndView mav=new ModelAndView();
		return mav;
	}
	@RequestMapping(value = "normalUpdate.do",method = RequestMethod.POST)
	public ModelAndView normalUpdate(NormalMemberDTO dto) {
		ModelAndView mav=new ModelAndView();
		return mav;
	}
	@RequestMapping(value = "comUpdate.do",method = RequestMethod.POST)
	public ModelAndView comUpdate(CompanyMemberDTO dto) {
		ModelAndView mav=new ModelAndView();
		return mav;
	}
	@RequestMapping(value = "login.do",method = RequestMethod.GET)
	public String login() {
		return "/member/login";
	}
	@RequestMapping(value = "normalLogin.do" ,method= RequestMethod.POST)
	public ModelAndView norMalLogin(String id,String pwd) {
		ModelAndView mav=new ModelAndView();
		norDao.norLogin(id, pwd);
		return mav;
	}
	@RequestMapping(value = "comLogin.do" ,method= RequestMethod.POST)
	public ModelAndView comLogin(String id,String pwd) {
		ModelAndView mav=new ModelAndView();
		comDao.comLogin(id, pwd);
		return mav;
	}
	
}
package com.goodjob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {

	@GetMapping("/noticeWrite.do")
	public ModelAndView noticeWriteForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/noticeWrite");
		return mav;
	}
	@PostMapping("/noticeWrite.do")
	public ModelAndView noticeWriteSubmit() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/noticeWrite");
		return mav;
	}
	@RequestMapping("/noticeComList.do")
	public ModelAndView noticeComListForm(@RequestParam(value="cp",defaultValue="1")int cp) {
		int totalCnt=0;//getTotalCnt();
		int listSize=5;
		int pageSize=5;
		
		String pageStr=com.goodjob.page.module.PageModule.makePage("noticeComList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.setViewName("notice/noticeComList");
		return mav;
	}
	
}

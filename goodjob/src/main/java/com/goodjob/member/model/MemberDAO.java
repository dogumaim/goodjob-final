package com.goodjob.member.model;


public interface MemberDAO {
	public int memberJoin(MemberDTO dto);
	public MemberDTO login(String id,String pwd,String user_category);
	public Object getMember(String idx,String category);
}
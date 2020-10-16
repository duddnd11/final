package com.yw.service;

import com.yw.vo.MemberVo;

public interface MemberService {
	public void insertMemberAction(MemberVo vo);
	public MemberVo loginMemberAction(MemberVo vo);
	public void modifyMemberAction(MemberVo vo);
}

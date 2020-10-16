package com.yw.dao;

import com.yw.vo.MemberVo;

public interface MemberDao {
	public void insertMember(MemberVo vo);
	public MemberVo loginMember(MemberVo vo);
	public void modifyMember(MemberVo vo);
}

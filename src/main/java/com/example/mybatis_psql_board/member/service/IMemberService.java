package com.example.mybatis_psql_board.member.service;

import com.example.mybatis_psql_board.member.dto.MemberDto;

import java.util.List;

public interface IMemberService {

    public List<MemberDto> memberList();

    public MemberDto memberListOne(int memberId);

    public int memberInsert(MemberDto member);

    public int memberUpdate(int id, MemberDto member);

    public int memberDelete(int memberId);


    public MemberDto memberLogin(String loginId);


}

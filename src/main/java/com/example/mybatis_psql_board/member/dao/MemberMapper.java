package com.example.mybatis_psql_board.member.dao;

import com.example.mybatis_psql_board.member.dto.MemberDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface MemberMapper {
    //멤버 전체 리스트
    public List<MemberDto> memberList();

    //멤버 One row
    public MemberDto memberListOne(int memberId);

    //멤버 등록
    public int memberInsert(MemberDto member);

    //멤버 수정
    public int memberUpdate(MemberDto member);

    //멤버 삭제
    public int memberDelete(int memberId);

    // 로그인
    MemberDto memberLogin(String loginId);
}

package com.example.mybatis_psql_board.member.service.impl;

import com.example.mybatis_psql_board.member.dao.MemberMapper;
import com.example.mybatis_psql_board.member.dto.MemberDto;
import com.example.mybatis_psql_board.member.service.IMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MemberServiceImpl implements IMemberService {

    @Autowired
    private MemberMapper memberDao;

    @Override
    public List<MemberDto> memberList() {
        List<MemberDto> list = new ArrayList<>();
        list = memberDao.memberList();
        return  list;
    }
    @Override
    public MemberDto memberListOne(int memberId) {

        MemberDto member = memberDao.memberListOne(memberId);
        return  member;
    }
    @Override
    public int memberInsert(MemberDto insertMember) {
        int intI = memberDao.memberInsert(insertMember);
        return  intI;
    }
    @Override
    public int memberUpdate(int id, MemberDto updateMember) {
        MemberDto member = memberDao.memberListOne(id);
        if(member!=null){
            member.setName(updateMember.getName());
            member.setGender(updateMember.getGender());
            int intI = memberDao.memberUpdate(member);
            return  intI;
        } else {
            throw new IllegalStateException("회원이 존재하지 않습니다.");
        }
    }

    @Override
    public int memberDelete(int memberId) {
        if(memberDao.memberListOne(memberId)!=null){
            int intI  = memberDao.memberDelete(memberId);
            return  intI;
        } else {
            throw new IllegalStateException("회원이 존재하지 않습니다.");
        }

    }

    @Override
    public MemberDto memberLogin(String loginId) {
        MemberDto member = memberDao.memberLogin(loginId);
        return member;
    }
}

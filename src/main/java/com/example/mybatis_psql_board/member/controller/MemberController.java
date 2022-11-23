package com.example.mybatis_psql_board.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
    @GetMapping("/join")
    public String memberJoin(){
        return "member/memberJoin";
    }

    @PostMapping("/joinProc")
    public String memberJoinProc(){
        return "회원가입 진행";
    }

    @GetMapping("/login")
    public String memberLogin(){
        return "member/memberLogin";
    }

    @PostMapping("loginProc")
    public String memberLoginProc(){
        return "로그인 진행";
    }

}

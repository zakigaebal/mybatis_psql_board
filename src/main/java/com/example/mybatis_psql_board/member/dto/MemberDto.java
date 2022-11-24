package com.example.mybatis_psql_board.member.dto;

import lombok.Builder;
import lombok.Data;

@Data
public class MemberDto {

    private int memberId;
    private String loginId;

    private String password;
    private String name;
    private String role;
    private String phone;
    private String gender;
    private String regDay;


    // memberID랑 password 빼고 생성자생성
    @Builder
    public MemberDto(String loginId, String name, String role, String phone, String gender, String regDay) {
        this.loginId = loginId;
        this.name = name;
        this.role = role;
        this.phone = phone;
        this.gender = gender;
        this.regDay = regDay;
    }
}

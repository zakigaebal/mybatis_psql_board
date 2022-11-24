package com.example.mybatis_psql_board.member.controller;

import com.example.mybatis_psql_board.member.dto.MemberDto;
import com.example.mybatis_psql_board.member.service.impl.MemberServiceImpl;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name="member", description = "회원 api")
@RequestMapping("/api")
@RestController
public class MemberApiController {
    @Autowired
    MemberServiceImpl memberService;
    @Operation(summary = "get members", description = "전체 회원 정보 가져오기")
    @ApiResponses({
            @ApiResponse(responseCode = "200", description = "OK", content = @Content(schema = @Schema(implementation = MemberDto.class))),
            @ApiResponse(responseCode = "400", description = "BAD REQUEST"),
            @ApiResponse(responseCode = "404", description = "NOT FOUND"),
            @ApiResponse(responseCode = "500", description = "INTERNAL SERVER ERROR")
    })
    @GetMapping("/member/all")
    public List<MemberDto> selectAllMembers(){
        return memberService.memberList();
    }

    @PostMapping("/member/new")
    public List<MemberDto> insertMember(@RequestBody MemberDto member){
        memberService.memberInsert(member);
        return memberService.memberList();
    }

    @PutMapping("/member/{id}")
    public List<MemberDto> updateMember(@PathVariable int id, @RequestBody MemberDto member){
        memberService.memberUpdate(id, member);
        return memberService.memberList();
    }

    @DeleteMapping("/member/{id}")
    public List<MemberDto> deleteMember(@PathVariable int id){
        memberService.memberDelete(id);
        return memberService.memberList();
    }




}

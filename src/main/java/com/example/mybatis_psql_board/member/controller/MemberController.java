package com.example.mybatis_psql_board.member.controller;

import com.example.mybatis_psql_board.member.dto.MemberDto;
import com.example.mybatis_psql_board.member.service.impl.MemberServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    MemberServiceImpl memberService;

    @GetMapping("/list")
    public String memberList(Model model){
        List<MemberDto> list = new ArrayList<>();
        list = memberService.memberList();
        model.addAttribute("list", list);
        log.info("lists => "+list);
        return  "/member/memberList";
    }

    @GetMapping("/join")
    public String memberJoin(){
        System.out.println("회원가입페이지로 이동합니다.");
        return "member/memberJoin";

    }

    @PostMapping("/joinProc")
    public String memberJoinProc(@ModelAttribute MemberDto member,  RedirectAttributes ra){
        try{
            int intI = memberService.memberInsert(member);
            System.out.println(intI);
            System.out.println("회원가입을 진행합니다.");
            return "redirect:/member/list";
        }catch (RuntimeException re){
            System.out.println(2);
            ra.addFlashAttribute("msg", "중복아이디존재");
            return "redirect:/member/join"; // alert 후, 전달된 url 파라미터로 이동시키는 페이지
        }catch (Exception e){
            System.out.println(3);
            return "redirect:/member/join";
        }
    }

    @GetMapping("/login")
    public String memberLogin(){
        System.out.println("로그인페이지로 이동합니다.");
        return "member/memberLogin";
    }

    @PostMapping("/loginProc")
    public String memberLoginProc(@RequestParam(value="loginId", defaultValue = "--") String strLoginId,
    @RequestParam(value="password", defaultValue = "--") String strPassword,
    Model model,
    HttpServletRequest request){

        String strReturn="";
        String strMessage="";
        boolean bl_login = false;

        MemberDto vo_member = memberService.memberLogin(strLoginId);

        if(vo_member==null){
            strReturn = "/login/loginForm";
            strMessage = "ID가 존재하지 않아요.";
        }
        else{
            if(!strPassword.equals(vo_member.getPassword())) {
                strReturn = "/login/loginForm";
                strMessage = "패스워드가 일치하지 않아요.";
            }else{
                bl_login = true;
                strReturn = "redirect:/";
                strMessage = "login 성공";
            }

        }

        model.addAttribute("message", strMessage);

        HttpSession session = request.getSession();
        if(bl_login == true){
            session.setAttribute("ss_member_id", vo_member.getMemberId());
            session.setAttribute("ss_login_id", vo_member.getLoginId());
            session.setAttribute("ss_name", vo_member.getName());
            session.setAttribute("ss_role", vo_member.getRole());
        }

        //System.out.println(vo_member.getName());
        return strReturn;
    }
    @GetMapping("/logout")
    public String memberLogout(HttpServletRequest request){

        HttpSession session = request.getSession(false);
        session.invalidate();

        return "redirect:/";
    }

    /* 수정 - 클릭 */
    @GetMapping("/modify")
    public String doMod(HttpServletRequest request){
        int strMemberId = Integer.parseInt(request.getParameter("member_id"));

        MemberDto vo_member = memberService.memberListOne(strMemberId);

        request.setAttribute("vo_member", vo_member);

        return "/member/member_mod";
    }

    /* 수정 - 처리  */
    @PostMapping("/modify_exe")
    public String doModExe(@ModelAttribute MemberDto vo_member, int id){

        int intI = memberService.memberUpdate(id, vo_member);

        return "redirect:/home/member_reg";
    }
    /* 삭제 */
    @GetMapping("/delete")
    public String doDel(@RequestParam(value="member_id", defaultValue = "--") int MemberId){
        int intI = memberService.memberDelete(MemberId);
        log.info("intI => "+intI);
        return "redirect:/member/list";
    }

}

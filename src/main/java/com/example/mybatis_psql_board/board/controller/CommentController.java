package com.example.mybatis_psql_board.board.controller;


import com.example.mybatis_psql_board.board.dto.CommentDto;

import com.example.mybatis_psql_board.board.service.impl.CommentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    CommentServiceImpl mCommentService;

    @RequestMapping("/list") // comment list
    @ResponseBody
    private List<CommentDto> mcommentServiceList(int bno) throws Exception {
        return mCommentService.commentListService(bno);
    }

    @RequestMapping("/deleteList") // comment list
    @ResponseBody
    private List<CommentDto> mcommentDeleteServiceList(int cno) throws Exception {
        return mCommentService.commentDeleteListService(cno);
    }


    @PostMapping("/cinsert")
    public String writeReply(
            @RequestParam int bno, @RequestParam("replyIdx")int replyIdx,  @RequestParam("content")String content, @RequestParam String writer ) throws Exception {
        CommentDto comment= new CommentDto();
            comment.setBno(bno);
            comment.setContent(content);
            comment.setReplyIdx(replyIdx);
            comment.setWriter(writer);
            mCommentService.commentInsertService(comment);
        return "redirect:/detail/" + bno;
    }


    @RequestMapping("/update") //댓글 수정
    @ResponseBody
    private int mCommentServiceUpdateProc(@RequestParam int cno, @RequestParam String content) throws Exception{

        CommentDto comment = new CommentDto();
        comment.setCno(cno);
        comment.setContent(content);

        return mCommentService.commentUpdateService(comment);
    }
    @RequestMapping("/delete/{cno}") //댓글 삭제
    @ResponseBody
    private int mCommentServiceDelete(@PathVariable int cno) throws Exception{
        return mCommentService.commentDeleteService(cno);
    }

}



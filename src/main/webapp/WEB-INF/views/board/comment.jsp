<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
  .subReply {
    padding-left: 50px;
  }
  #cnt{
    color: #0a53be;
  }
</style>

<script>
  var bno = '${detail.bno}'; //게시글 번호
  var writer = '${ss_login_id}'; //게시글 작성자
  var role = '${ss_role}'; //게시 역할
  //댓글 조회
  function commentReload(){
    $.ajax({
      url : '/comment/list',
      type : 'get',
      data : {'bno':bno},
      success : function(replys){
        $("#cnt").text("등록된 댓글 - " + replys.length)
        var html = '';
        html +=
                '<form name="commentInsertForm" action="/comment/cinsert" method="post">' +
                ' <div class="input-group">'+
                '<input type="hidden" name="bno" value = "' + bno + '">' +
                '<input type="hidden" name="replyIdx" value = "0">' +
                '<input type="hidden" name="writer" value = "' + writer + '">' +
                '<input type="text" class="form-control mb-2 mr-sm-2" id="content" placeholder="내용을 입력하세요" name="content">' +
                '<spsan class="input-group-btn">'+
                '<button type="submit" class="btn btn-default mb-2">등록</button>' +
                '</spsan>'+
                '</div>' +
                '</form>'+
                '</br/>';
        replys.forEach(function(reply){
          if (reply.replyIdx == 0) {
            var rc = 0;
            replys.forEach(function(i){
              if (reply.cno == i.replyIdx) rc++;
            })
            html += '</br><div class="row"><div class="col-sm-12">';

            html += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
            html += '<div class="commentInfo'+reply.cno+'">'+'댓글번호 : '+reply.cno+' / 작성자 : '+reply.writer;

            if(reply.writer==writer || role=="ADMIN"){

            html += '<button type="button" class="btn btn-outline-warning" onclick="commentUpdate('+reply.cno+',\''+reply.content+'\');">수정</button>';
            html += '<button type="button" class="btn btn-outline-danger" onclick="commentDeleteList('+reply.cno+');">삭제</button>';
            }


            html += '</div>';
            html += '<form class="form-inline" action="/comment/cinsert" method="post">' +

                    '<label for="pwd" class="mr-sm-2">'+'<div class="commentContent'+reply.cno+'"> <p> 내용 : '+reply.content + '(' + rc + ')'+'</p>'  + '</label>'
            html += '<input type="hidden" name="bno" value = "' + bno + '">' +
                    '<input type="hidden" name="replyIdx" value = "' + reply.cno + '">' +
                    '<input type="hidden" name="writer" value = "' + writer + '">' +

                    '<input type="text" class="form-control mb-2 mr-sm-2" id="content" placeholder="답글" name="content">' +
                    '<button type="submit" class="btn btn-primary mb-2">등록</button></form>';
            html += '<div class="row"><div class="col-sm-12 sub' + reply.cno + '"></div>' +
                    '</div></div></div></div></div>'+
                    '<br/>';
          }
        })
        $(".commentList").html(html);
        replys.forEach(function(reply){
          if (reply.replyIdx != 0) {
            var rc = 0;
            replys.forEach(function(i){
              if (reply.cno == i.replyIdx) rc++;
              console.log('bbb')
            })
            var subHtml = '';
            subHtml = '</hr><div class="row"><div class="col-sm-12 subReply">';
            console.log(reply)
            subHtml += '<div class="commentInfo'+reply.cno+'">'+'댓글번호 : '+reply.cno+' / 작성자 : '+reply.writer;

            if(reply.writer==writer || role=="ADMIN"){
              subHtml += '<button type="button" class="btn btn-outline-warning" onclick="commentUpdate(' + reply.cno + ',\'' + reply.content + '\');">수정</button>';
              subHtml += '<button type="button" class="btn btn-outline-danger" onclick="commentDeleteList(' + reply.cno + ');">삭제</button>';
            }

            subHtml += '</div>';

            subHtml += '<form class="form-inline" action="/comment/cinsert" method="post">' +
                    '<label for="pwd" class="mr-sm-2">'+'<div class="commentContent'+reply.cno+'"> <p> 내용 : '+reply.content + '(' + rc + ')'+'</p>'  + '</label>'
            subHtml += '<input type="hidden" name="bno" value = "' + bno + '">' +
                    '<input type="hidden" name="replyIdx" value = "' + reply.cno + '">' +
                    '<input type="hidden" name="writer" value = "' + writer + '">' +
                    '<input type="text" class="form-control mb-2 mr-sm-2" id="content" placeholder="답글" name="content">' +
                    '<button type="submit" class="btn btn-primary mb-2">등록</button></form>';
            subHtml += '<div class="row"><div class="col-sm-12 sub' + reply.cno + '"></div></div></div></div>';
            $(".sub" + reply.replyIdx).append(subHtml);
          }
        })
      }
    });
  }

  //댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
  function commentUpdate(cno, content){
    var a ='';
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
    a += '</div>';
    $('.commentContent'+cno).html(a);
  }

  //댓글 수정
  function commentUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();

    $.ajax({
      url : '/comment/update',
      type : 'post',
      data : {'content' : updateContent, 'cno' : cno},
      success : function(data){
        console.log(data)
        if(data == 1) commentReload(); //댓글 수정후 목록 출력
        console.log('리로드')
      }
    });
  }

  //댓글 삭제
  function commentDeleteList(cno){
    $.ajax({
      url : '/comment/deleteList',
      type : 'get',
      data : {'cno':cno},
      success : function(replys){
        if(replys==""){
          console.log('비었습니다.')
        }
        else{
          replys.forEach(function(reply){
            console.log(reply.cno)
            let delcode = reply.cno
          //  댓글 삭제 연습코드

            $.ajax({
              url : '/comment/delete/'+reply.cno,
              type : 'post',
              success : function(data){
                console.log('삭제성공')
                commentReload(); //댓글 삭제후 목록 출력
                console.log('리로드')
              }
            });
            // 댓글 삭제 연습코드 끝
          })
        }

      }
    });
  }

  $(document).ready(function(){
    commentReload(); //페이지 로딩시 댓글 목록 출력
  });
  </script>

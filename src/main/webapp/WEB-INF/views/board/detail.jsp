<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>--%>
<%--<layoutTag:layout>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert Form</title>
  </head>
  <body>
  <%@ include file="/WEB-INF/views/comm/header.jsp"%>







  <div class="container">
    <div class="col-xs-12" style="margin:15px auto;">
      <label style="font-size:20px;"><span class="glyphicon glyphicon-list-alt"></span>게시글 상세</label>
    </div>


    <div class="card bg-light mb-3" style="max-width: 200rem;">

      <div class="card-body">



    <div class="col-xs-12">
      <form action="/insertProc" method="post">
        <dl class="dl-horizontal">
          <dt>제목</dt>
          <dd>${detail.subject}</dd>
          <dt>작성아이디</dt>
          <dd>${detail.writer}</dd>
          <dt>작성날짜</dt>
          <dd>
            <fmt:formatDate value="${detail.regDate}" pattern="yyyy.MM.dd"/>
          </dd>

          <dt>첨부파일</dt>
          <dd><a href="/fileDown/${files.bno}">${files.fileOriName}</a></dd>

          <dt>내용</dt>
          <dd>${detail.content}</dd>

          <dt>고정공지사항유무</dt>
          <dd>${detail.fixed}</dd>

          <dt>게시글 사용유무</dt>
          <dd>${detail.used}</dd>
        </dl>
      </form>
      <c:set var="writer" value='${detail.writer}' />
      <c:set var="ss_login_id" value='${ss_login_id}' />
      <c:set var="ss_role" value='${ss_role}' />
      <c:choose>
        <c:when test="${writer eq ss_login_id || ss_role eq 'ADMIN'}">
          <script>
            console.log("작성아이디와 세션아이디가 같습니다.")
            console.log("${detail.writer}")
            console.log('${ss_login_id}')
          </script>
          <div class="btn-group btn-group-sm" role="group" style="float:right;">
            <button type="button" class="btn btn-outline-primary" onclick="location.href='/delete/${detail.bno}'">삭제</button>
            <button type="button" class="btn btn-outline-primary" onclick="location.href='/update/${detail.bno}'">수정</button>
            <button type="button" class="btn btn-outline-primary" onclick="location.href='/list'"> 목록 </button>
          </div>
        </c:when>
        <c:otherwise>
          <script>
            console.log("작성아이디와 세션아이디가 다릅니다.")
            console.log("${detail.writer}")
            console.log('${ss_login_id}')
          </script>
          <div class="btn-group btn-group-sm" role="group" style="float:right;">
            <button type="button" class="btn btn-outline-primary" onclick="location.href='/list'"> 목록 </button>
          </div>
        </c:otherwise>
      </c:choose>





    </div>


      </div>
    </div>



    <h2 id = "cnt"></h2>
    <div class="container">
      <div class="commentList"></div>
    </div>
  </div>
  <!--                     추가                         -->
  <%@ include file="comment.jsp" %>
<%--</layoutTag:layout>--%>

</body>
</html>

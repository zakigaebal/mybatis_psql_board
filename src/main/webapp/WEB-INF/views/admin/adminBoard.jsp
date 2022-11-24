<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>스프링부트 게시판</title>
  </head>
  <body>
  <%@ include file="/WEB-INF/views/comm/header.jsp"%>
  <div class="container">
    <div class="col-xs-12" style="margin:15px auto;">

      <label style="font-size:20px;"><span class="glyphicon glyphicon-list-alt"></span>게시글 목록</label>
      <button class="btn btn-outline-success" style="float:right;" onclick="location.href='/insert'">글쓰기</button>
    </div>

    <div class="col-xs-12">
      <table class="table table-hover">
        <tr class="table-dark">
          <th>No</th>
          <th>Subject</th>
          <th>Writer</th>
          <th>고정</th>
          <th>사용</th>
          <th>조회수</th>
          <th>Date</th>
        </tr>
        <c:forEach var="l" items="${list}">
          <tr class="table-light" onclick="location.href='/detail/${l.bno}'">
            <td>${l.bno}</td>
            <td>${l.subject}</td>
            <td>${l.writer}</td>
            <td>${l.fixed}</td>
            <td>${l.used}</td>
            <td>${l.hit}</td>
            <td>
              <fmt:formatDate value="${l.regDate}" pattern="yyyy.MM.dd HH:mm:ss"/>
            </td>

          </tr>
        </c:forEach>
      </table>
    </div>
  </div>

  <script>
    window.onpageshow = function (event){
      if(event.persisted){
        document.location.reload();
      }
    }
  </script>
  </body>
  </html>



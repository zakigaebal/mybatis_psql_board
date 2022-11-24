<%@ page import="com.example.mybatis_psql_board.member.dto.MemberDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
 헤더 파일
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%--<%--%>
<%--  String strLoginId = "guest";--%>
<%--  String strName = "guest";--%>
<%--  String strRole = "";--%>

<%--  String strLogInOut="";--%>
<%--  String strUrl="";--%>

<%--  session = request.getSession(false);--%>
<%--  if(session != null){--%>
<%--    strLoginId = (String) session.getAttribute("ss_login_id");--%>
<%--    strName = (String) session.getAttribute("ss_name");--%>
<%--    strRole = (String) session.getAttribute("ss_role");--%>
<%--    strLogInOut ="LogOut";--%>
<%--    //strUrl = "/login/logout";--%>
<%--    strUrl = "/login/logout";--%>

<%--  }--%>
<%--  if(strLoginId==null){--%>
<%--    strLoginId = "guest";--%>
<%--    strName = "guest";--%>
<%--    strLogInOut ="LogIn";--%>
<%--    //strUrl = "/login/login";--%>
<%--    strUrl = "/login/login";--%>
<%--  }--%>

<%--  String strAuth = (String) request.getAttribute("ss_auth");--%>
<%--  if(strAuth==null){ strAuth = "N"; }--%>
<%--%>--%>



<%@ include file="/WEB-INF/views/common/session.jsp"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="/">board</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">

      <ul class="navbar-nav me-auto">
        <a> </a>
        <li class="nav-item"></li>

        <li class="nav-item"><a href="/" class="nav-link active" aria-current="page">Home(H)</a></li>
        <li class="nav-item"><a href="/list" class="nav-link">게시판</a></li>
        <% if("ADMIN".equals(strRole)){ %>
        <li class="nav-item"><a href="/admin" class="nav-link active" aria-current="page">Home(A)</a></li>
        <li class="nav-item"><a href="/member/list" class="nav-link">회원목록</a></li>
        <% } %>

      </ul>


      <div class="col-md-3 text-end">
        <p style="color: #ffffff"><%=strName%>님 안녕하세요</p>
        <button type="button" class="btn btn-outline-light" onclick="location.href='<%=strUrl%>'" ><%=strLogInOut%></button>
        <% if("guest".equals(strLoginId)) { %>
        <button type="button" class="btn btn-outline-light" onclick="location.href='/member/insert'">Sign-up</button>
        <% } %>
      </div>

    </div>
  </div>
</nav>
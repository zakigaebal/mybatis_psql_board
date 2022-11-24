<%@ page import="com.example.mybatis_psql_board.member.dto.MemberDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String strLoginId = "guest";
  String strName = "guest";
  String strRole = "";

  String strLogInOut="";
  String strUrl="";

  session = request.getSession(false);
  if(session != null){
    strLoginId = (String) session.getAttribute("ss_login_id");
    strName = (String) session.getAttribute("ss_name");
    strRole = (String) session.getAttribute("ss_role");
    strLogInOut ="LogOut";
    //strUrl = "/login/logout";
    strUrl = "/login/logout";

  }
  if(strLoginId==null){
    strLoginId = "guest";
    strName = "guest";
    strLogInOut ="LogIn";
    //strUrl = "/login/login";
    strUrl = "/login/login";
  }

  String strAuth = (String) request.getAttribute("ss_auth");
  if(strAuth==null){ strAuth = "N"; }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Home!</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">






    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>



</head>
<body class="text-center">

<!-- 헤더 위치 -->
<%@ include file="/WEB-INF/views/comm/header.jsp"%>

<script>

    var msg = "${msg}";
    if(msg!=""){
        alert(msg)
    }

</script>

<main class="form-signin">
    <form action="/member/joinProc" method="post">
        <h1 class="h3 mb-3 fw-normal">회원가입</h1>
        <div><input type="hidden" name="memberId" value=0></div>
        <div><label>Login ID</label> <input type="text" name="loginId"></div>
        <div><label>Password</label> <input type="password" name="password"></div>
        <div><label>이름</label> <input type="text" name="name"></div>
        <div><label>전화번호</label> <input type="text" name="phone"></div>
        <div>
            <label>성별</label>
            <input type="radio" name="gender" value="man" checked>남성
            <input type="radio" name="gender" value="woman">여성
        </div>
        <div>
            <label>권한</label>
            <input type="radio" name="role" value="MEMBER" checked>MEMBER
            <input type="radio" name="role" value="ADMIN">ADMIN
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>


    </form>
</main>

<!-- 푸터 위치 -->
<%@ include file="/WEB-INF/views/comm/footer.jsp"%>
</body>
</html>
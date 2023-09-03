<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <%@ include file="../common.jsp" %>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <style>

    </style>
</head>
<div class="container-fluid">
    <%@ include file="../header.jsp"%>
    <div class="contents" style="min-height:100vh">
        <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
            <div class="container">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="${path}">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Custom</a></li>
                    <li class="breadcrumb-item active" aria-current="page">My Page</li>
                </ol>
            </div>
        </nav>
        <h2 class="title">내 정보보기</h2>
        <div class="container">
            <div class="box_wrap">
                <table class="table table-secondary" id="tb1">
                    <tbody>
                    <tr>
                        <th>아이디</th>
                        <td>${me.id }</td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td>${me.pw }</td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>${me.name }</td>
                    </tr>
                    <tr>
                        <th>가입일시</th>
                        <td>${me.regdate }</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>${me.email }</td>
                    </tr>
                    <tr>
                        <th>연락처</th>
                        <td>${me.tel }</td>
                    </tr>
                    <tr>
                        <th>포인트</th>
                        <td>${me.point }</td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn-group">
                    <a href="${path }/MypageUpdate.do" class="btn btn-info">회원정보수정</a>
                    <a href="${path }/MypageDelete.do" class="btn btn-danger">회원 탈퇴하기</a>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../footer.jsp" %>
</div>
</html>
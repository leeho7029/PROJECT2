<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path1" value="<%=request.getContextPath() %>" />
<header class="header container-fluid" id="hd">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="${path1 }">국영수</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                회사소개
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${path1 }/product/introduce.jsp">인사말</a></li>
                                <li><a class="dropdown-item" href="${path1 }/product/map.jsp">오시는길</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                상품
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${path1 }/BookList.do?category=A">국어</a></li>
                                <li><a class="dropdown-item" href="${path1 }/BookList.do?category=B">영어</a></li>
                                <li><a class="dropdown-item" href="${path1 }/BookList.do?category=C">수학</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${path1}/FileboardList.do">자료실</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                커뮤니티
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${path1 }/NoticeList.do">공지사항</a></li>
                                <li><a class="dropdown-item" href="${path1 }/QnaList.do">묻고답하기</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav justify-content-end">
                        <c:if test="${session_id eq 'admin' }">
                            <li class="nav-item"><a href="${path1 }/MemberListAdmin.do" class="nav-link">관리자</a></li>
                        </c:if>
                        <c:if test="${!empty session_id }">
                            <li class="nav-item"><a href="${path1 }/Mypage.do" class="nav-link">내 정보</a></li>
                            <li class="nav-item"><a href="${path1 }/PayList.do" class="nav-link">결제정보</a></li>
                            <li class="nav-item"><a href="${path1 }/CartList.do" class="nav-link">장바구니</a></li>
                            <li class="nav-item"><a href="${path1 }/Logout.do" class="nav-link">로그아웃</a></li>

                        </c:if>
                        <c:if test="${empty session_id }">
                            <li class="nav-item"><a href="${path1 }/custom/login.jsp" class="nav-link">로그인</a></li>
                            <li class="nav-item"><a href="${path1 }/custom/term.jsp" class="nav-link">회원가입</a></li>

                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>

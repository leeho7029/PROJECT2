<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>소개</title>
    <%@ include file="/common.jsp"%>
    <style>
        .intro p {text-indent: 2em; line-height: 2em; display:inline-block; word-break: keep-all;}
        .intro_tit {margin-top: 20px; display:inline-block;}
        .intro li {line-height: 2em;}
    </style>
</head>

<body id="body">
<%@ include file="/header.jsp"%>
<section class="page-header" style="margin-top:0!important;">
    <div class="container">
        <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
            <div class="container">
                <ol class="breadcrumb justify-content-end">
                    <li class="breadcrumb-item"><a href="${path }">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">인사말</a></li>
                </ol>
            </div>
        </nav>
    </div>
</section>
<div class="container contents text-center">
    <div class="intro text-start" style="margin-top: 20px;">
        <h3 class="intro_tit text-center">
            안녕하세요! 국영수 인터넷 서점에 오신 것을 환영합니다.</h3>
        <div class="row" style="align-items: center;margin-bottom:20px;">
            <div class="col-12 text-center">
                <p>국영수는 국어, 영어, 수학과 관련된 다양한 문제집과 학습 자료를 제공하는 인터넷 서점입니다. 우리는 학생들과 학습자 여러분이 학문적 성취를 이루고 더 나은 미래를 <br>준비할 수 있도록 최상의 학습 도구와 자료를 제공하기 위해 노력하고 있습니다.</p>
            </div>
        </div>
        <div class="row" style="align-items: center;margin-bottom:20px;">
            <div class="col-12 text-center">
                <p>저희 서점에서는 고품질의 교재와 자료를 제공하며, 학습 경험을 더욱 풍부하게 만들어 드릴 것입니다.<br> 또한, 편리한 온라인 쇼핑 경험을 제공하고, 필요한 정보와 도움말을 언제든지 찾아보실 수 있도록 최선을 다하겠습니다.<br>

                    어떤 교재나 자료를 찾고 계시든, 궁금한 점이 있거나 도움이 필요하면 언제든지 문의해 주세요. <br>우리는 항상 여러분의 학습 여정을 지원하고 돕기 위해 준비되어 있습니다.<br>

                    감사합니다. <br>국영수 인터넷 서점을 이용해 주셔서 기쁩니다. 함께 학습의 성공을 이루어 나가요!</p>
            </div>
        </div>
    </div>
    <%--  인트로 END  --%>
</div>

<%@ include file="/footer.jsp" %>
</body>
</html>

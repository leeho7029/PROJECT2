<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>국영수 서점</title>
    <c:set var="rootPath" value="<%=request.getContextPath() %>" />
    <%@ include file="/common.jsp"%>
  </head>
  <body>
  <div class="container-fluid">
      <%@ include file="/header.jsp"%>
      <div class="contents">
          <div class="container-fluid" style="">
              <br>
              <br>
              <figure class="text-center">
                  <blockquote class="blockquote">
                      <p class="mb-0">변명 중에서 가장 어리석고 못난 변명은 "시간이 없어서"</p>
                  </blockquote>
                  <figcaption class="blockquote-footer">
                      <cite title="Source Title">토마스 에디슨</cite>
                  </figcaption>
              </figure>
              <br>
              <figure class="text-center">
                  <blockquote class="blockquote">
                      <p class="mb-0">꿈을 꾸기에 인생은 빛난다</p>
                  </blockquote>
                  <figcaption class="blockquote-footer">
                       <cite title="Source Title">모차르트</cite>
                  </figcaption>
              </figure>
          </div>
          <div class="container" style="min-height:100vh;">

              <div class="card mb-3">
                  <h3 class="card-header">꿈이 있으신가요?</h3>
                  <div class="card-body">
                      <h6 class="card-title">당신은 할 수 있습니다</h6>
                      <h6 class="card-subtitle text-muted">국영수는 여러분과 함께합니다</h6>
                  </div>
                  <svg xmlns="http://www.w3.org/2000/svg" class="d-block user-select-none" width="100%" height="200" aria-label="Placeholder: Image cap" focusable="false" role="img" preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180" style="font-size:1.125rem;text-anchor:middle; ">
                      <rect width="100%" height="100%" fill="#868e96"></rect>
                      <text x="50%" y="50%" fill="#dee2e6" dy=".3em">당신은 가공되지 않은 원석입니다 </text>
                  </svg>
                  <div class="card-body">
                      <p class="card-text">공부의 기본은 국영수</p>
                  </div>
                  <div class="card-body">
                      <a href="${rootPath }/NoticeList.do" class="card-link">국영수가 하는말</a>
                      <a href="${rootPath }/QnaList.do" class="card-link">궁금한거 물어보기</a>
                  </div>
              </div>
          </div>

          <div class="container" style="min-height:100vh;">
              <h2 class="title">신상품</h2>
              <div class="box_wrap">
                  <ul class="list row">
                      <c:forEach var="pro" items="${proList}" varStatus="status">
                          <c:if test="${status.index < 4}">
                              <li class="col-3">
                                  <div class="card" style="width: 18rem;">
                                      <div class="img-wrap" style="height:286px;overflow:hidden;">
                                          <img class="img-responsive" src="${pro.img}" alt="${pro.title}" />
                                      </div>
                                      <div class="card-body">
                                          <h3 class="card-title" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${pro.title}</h3>
                                          <p class="card-text">가격 : ${pro.price} 원</p>
                                          <a href="${rootPath}/BookGet.do?proNo=${pro.proNo}" class="btn btn-primary">상세보기</a>
                                      </div>
                                  </div>
                              </li>
                          </c:if>
                      </c:forEach>
                      <c:if test="${empty proList}">
                          <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                      </c:if>
                  </ul>
              </div>
          </div>
          </div>
      <%@ include file="/footer.jsp" %>
  </div>
  </body>
</html>

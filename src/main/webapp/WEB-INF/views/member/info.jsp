<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" integrity="sha512-t4GWSVZO1eC8BM339Xd7Uphw5s17a86tIZIj8qRxhnKub6WoyhnrxeCIMeAqBPgdZGlCcG2PrZjMc+Wr78+5Xg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<html>
<head>
    <style>
      #buttonContainer {
        margin-top: 5vh;
        text-align: center;
      }
    </style>
</head>
<body style="background: #e2e2e2;">

  <my:navBar></my:navBar>

  <my:alert></my:alert>

    <div style="margin-top: 10vh;" class="container-lg">
      <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6">
          <h1 align="center" style=" font-weight: bold; margin-bottom: 5vh;">회원 정보</h1>
          <div class="mb-3">
            <label class="form-label" for="">ID</label>
            <input class="form-control" type="text" value="${member.id}" readonly />
          </div>
          <div class="mb-3">
            <label class="form-label" for="">PASSWORD</label>
            <input class="form-control" type="text" value="${member.password}" readonly />
          </div>
          <div class="mb-3">
            <label class="form-label" for="">이름</label>
            <input class="form-control" type="text" value="${member.name}" readonly />
          </div>
          <div class="mb-3">
            <label class="form-label" for="">사원번호</label>
            <input class="form-control" type="text" value="${member.memberNumber}" readonly />
          </div>
          <div class="mb-3">
            <label class="form-label" for="">email</label>
            <input class="form-control" type="text" value="${member.email}" readonly/>
          </div>
          <div class="mb-3">
            <label class="form-label" for="">전화번호</label>
            <input class="form-control" type="text" value="${member.phoneNumber}" readonly />
          </div>

          <div id="buttonContainer" >
          <sec:authorize access="authentication.name eq #member.id">
           <a class="btn btn-secondary" href="/member/modify?id=${member.id}">수정</a>
          </sec:authorize>
          <button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#confirmModal">탈퇴</button>
          </div>

          <!-- 탈퇴 확인 Modal -->
          <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5" id="exampleModalLabel">탈퇴 확인</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <form id="removeForm" action="/member/remove" method="post">
                    <input type="hidden" name="id" value="${member.id}" />
                    <label for="passwordInput1">암호</label>
                    <input id="passwordInput1" type="password" name="password" class="form-control" />
                  </form>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button type="submit" form="removeForm" class="btn btn-danger">확인</button>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.min.js" integrity="sha512-3dZ9wIrMMij8rOH7X3kLfXAzwtcHpuYpEgQg1OA4QAob1e81H8ntUQmQm3pBudqIoySO5j0tHN4ENzA6+n2r4w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</body>
</html>

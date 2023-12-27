<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Spring MVC</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
  	$(document).ready(()=>{
  		let regForm = $('#regForm');
  		$('button').on('click', function(e){
  			let oper = $(this).data('oper');
  			if (oper == 'register') {
  				regForm.submit();
  			} else if (oper == 'reset') {
  				regForm[0].reset();
  			}
  		});
  	});
  </script>
</head>
<body>
 	<div class="card">
	  <div class="card-header">
			<div class="jumbotron jumbotron-fluid">
			  <div class="container">
			    <h1>Spring MVC</h1>
			    <p>Board</p>
			  </div>
			</div>
	  </div>
	  <div class="card-body">
	  	<h4 class="card-title">Spring Boot</h4>
	  	<div class="row">
	  		<div class="col-lg-2">
	  			<div class="card" style="min-height:500px; max-height:1000px">
	  				<div class="card-body">
	  					<h4 class="card-title">GUEST</h4>
	  					<p class="card-text">회원님 Welcome!</p>
	  					<form action="">
	  						<div class="form-group">
	  							<label for="memId">아이디</label>
	  							<input type="text" class="form-control" id="memId" name="memId">
	  						</div>
	  						<div class="form-group">
	  							<label for="memPwd">비밀번호</label>
	  							<input type="password" class="form-control" id="memPwd" name="memPwd">
	  						</div>
	  						<button type="button" class="btn btn-sm btn-primary form-control">로그인</button>
	  					</form>
	  				</div>
	  			</div>
	  		</div>
	  		<div class="col-lg-5">
	  			<div class="card" style="min-height:500px; max-height:1000px">
	  				<div class="card-body">
	  					<table class="table table-hover">
	  						<thead>
	  							<tr>
		  							<th>번호</th>
		  							<th>제목</th>
		  							<th>작성일</th>
	  							</tr>
	  						</thead>
	  						<tbody>
	  							<c:forEach var="vo" items="${list}">
	  								<tr>
	  									<td>${vo.idx}</td>
	  									<td>${vo.title}</td>
	  									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.indate}"/></td>
	  								<tr>
	  							</c:forEach>
	  						</tbody>
	  					</table>
	  				</div>
	  			</div>
	  		</div>
	  		<div class="col-lg-5">
	  			<div class="card" style="min-height:500px; max-height:1000px">
	  				<div class="card-body">
	  					<form id="regForm" action="${cpath}/register" method="post">
	  						<div class="form-group">
	  							<label for="title">제목</label>
	  							<input type="text" class="form-control" id="title" name="title" placeholder="Enter title">
	  						</div>
	  						<div class="form-group">
	  							<label for="content">내용</label>
	  							<textarea rows="9" class="form-control" id="content" name="content"></textarea>
	  						</div>
	  						<div class="form-group">
	  							<label for="writer">작성자</label>
	  							<input type="text" class="form-control" id="writer" name="writer" placeholder="Enter writer">
	  						</div>
	  						<button type="button" data-oper="register" class="btn btn-sm btn-primary">등록</button>
	  						<button type="button" data-oper="reset" class="btn btn-sm btn-warning">취소</button>
	  					</form>
	  				</div>
	  			</div>
	  		</div>
	  	</div>
	  </div> 
	  <div class="card-footer">Spring</div>
	</div>

</body>
</html>
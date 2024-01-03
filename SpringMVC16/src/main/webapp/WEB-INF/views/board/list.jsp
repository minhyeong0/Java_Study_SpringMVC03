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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
  <link rel="stylesheet" href="${cpath}/resources/css/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <script type="text/javascript">
  	$(document).ready(()=>{
  		let result = '${result}';
  		checkModal(result);
  		
  		$('#regBtn').click(()=>{
  			location.href = '${cpath}/board/register';
  		});
  		
  		let pageFrm = $('#pageFrm');
  		//페이지 번호 클릭시 이동하기
  		$('.paginate_button a').on('click', function(e) {
  			e.preventDefault(); //a 태그 기능 막음
  			let page = $(this).attr('href');
  			pageFrm.find('#page').val(page);
  			pageFrm.submit();
  		});
  		
  		//상세보기 클릭시 이동
  		$('.move').on('click', function(e) {
  			e.preventDefault(); //a 태그 기능 막음
  			let idx = $(this).attr('href');
  			let tag = "<input type='hidden' name='idx' value = '"+idx+"'>";
  			pageFrm.append(tag);
  			pageFrm.attr('action', '${cpath}/board/get');
  			pageFrm.attr('method', 'get');
  			pageFrm.submit();
  		});
  		
  	});
  	
  	let checkModal = (result)=>{
  		if(result == '') return;
  		if(parseInt(result) > 0){  			
  			$('.modal-body').html('게시글' + parseInt(result) + '번이 등록되었습니다.');
  		}
			$('#myModal').modal('show');
  	}
  	
  	function goMsg(){
  		alert("삭제된 게시물입니다.");
  	}
  </script>
</head>
<body> 
	<div class="card">
	  <div class="card-header">
	  	<div class="jumbotron jumbotron-fluid">
			  <div class="container">
			    <h1>Spring MVC</h1>
			  </div>
			</div>
	  </div>
	  <div class="card-body">
	  	<div class="row">
			  <div class="col-lg-2">
			  	<jsp:include page="left.jsp"/>
		  	</div>
			  <div class="col-lg-7">
		    	<table class="table table-bordered table-hover">
		    		<thead>
		    			<tr>
		    				<th>번호</th>
		    				<th>제목</th>
		    				<th>작성자</th>
		    				<th>작성일</th>
		    				<th>조회수</th>
		    			</tr>
		    		</thead>
		    		<c:forEach var="vo" items="${list}">
		    			<tr>
		    				<td>${vo.idx}</td>
		    				<td>
			    				<c:if test="${vo.boardLevel > 0}">
			    					<c:forEach begin="1" end="${vo.boardLevel}">
			    						<span style="padding-left: 10px"></span>
			    					</c:forEach>
			    					<i class="bi bi-arrow-return-right"></i>
			    				</c:if>
			    				<c:if test="${vo.boardLevel > 0}">
			    					<c:if test="${vo.boardAvailable == 1}">
			    						<a class="move" href="${vo.idx}"><c:out value="[RE]${vo.title}"/></a>
			    					</c:if>
			    					<c:if test="${vo.boardAvailable == 0}">
			    						<a href="javascript:goMsg()">[RE]삭제된 게시물입니다.</a>
			    					</c:if>
			    				</c:if>
			    				<c:if test="${vo.boardLevel == 0}">
			    					<c:if test="${vo.boardAvailable == 1}">
			    						<a class="move" href="${vo.idx}"><c:out value="${vo.title}"/></a>
			    					</c:if>
			    					<c:if test="${vo.boardAvailable == 0}">
			    						<a href="javascript:goMsg()">삭제된 게시물입니다.</a>
			    					</c:if>
			    				</c:if>
	    					</td>
		    				<td>${vo.writer}</td>
		    				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.indate}" /></td>
		    				<td>${vo.count}</td>
		    			</tr>
	    			</c:forEach>
	    			<c:if test="${!empty mvo}">
		    			<tr>
		    				<td colspan="5">
		    					<button id="regBtn" class="btn btn-sm btn-secondary pull-right">글쓰기</button>
		    				</td>
		    			</tr>
	    			</c:if>
		    	</table>
		    	<!-- 검색 메뉴 START -->
		    	<form class="form-inline" action="${cpath}/board/list" method="post">
			    	<div class="container">
				    	<div class="input-group mb-3">
		 					  <div class="input-group-append">
							    <select name="type" class="form-control">
							    	<option value="writer" ${pageMaker.cri.type == 'writer' ? 'selected' : ''}>이름</option>
							    	<option value="title" ${pageMaker.cri.type == 'title' ? 'selected' : ''}>제목</option>
							    	<option value="content" ${pageMaker.cri.type == 'content' ? 'selected' : ''}>내용</option>
							    </select>
							  </div>
							  <input type="text" class="form-control" name="keyword" value="${pageMaker.cri.keyword}">
							  <div class="input-group-append">
							    <button class="btn btn-success" type="submit">Search</button>
							  </div>
							</div>
						</div>
					</form>
		    	<!-- 검색 메뉴 END -->
		    	
		    	
		    	<!-- Paging START -->
		    	<ul class="pagination justify-content-center">
			    	<!-- 이전 처리 -->
			    	<c:if test="${pageMaker.prev}">
			    		<li class="paginate_button previous page-item">
			    			<a class="page-link" href="${pageMaker.startPage - 1}">Previous</a>
			    		</li>
			    	</c:if>
			    	
			    	<!-- 페이지 번호 처리 -->
			    	<c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						  	<li class="paginate_button ${pageMaker.cri.page == pageNum ? 'active' : ''} page-item">
						  		<a class="page-link" href="${pageNum}">${pageNum}</a>
					  		</li>
					  </c:forEach>
			    	
			    	<!-- 다음 처리 -->
			    	<c:if test="${pageMaker.next}">
			    		<li class="paginate_button next page-item">
			    			<a class="page-link" href="${pageMaker.endPage + 1}">Next</a>
			    		</li>
			    	</c:if>
	    		</ul>
		    	<form id="pageFrm" action="${cpath}/board/list" method="post">
		    		<input type="hidden" id="page" name="page" value="${pageMaker.cri.page}" >
		    		<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum}">
		    		<input type="hidden" name="type" value="${pageMaker.cri.type}">
		    		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		    	</form>
		    	<!-- Paging END -->
		    	
		    	<!-- Modal START -->
					<div id="myModal" class="modal fade" role="dialog">
					  <div class="modal-dialog">
					
					    <!-- Modal content-->
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">&times;</button>
					        <h4 class="modal-title">글등록</h4>
					      </div>
					      <div class="modal-body">
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					      </div>
					    </div>
					  </div>
		    	</div>
			  </div>
			  <div class="col-lg-3">
			  	<jsp:include page="right.jsp"/>
			  </div>
			</div>
	  </div> 
	  <div class="card-footer">Spring MVC</div>
	</div>

</body>
</html>

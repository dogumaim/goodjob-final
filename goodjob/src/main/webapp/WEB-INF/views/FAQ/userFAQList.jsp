<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	<title>Good Job</title>
</head>
<body>
	<div class="container">
	 <%@include file="/WEB-INF/views/header.jsp"%> 
		<section>
			<article>
			<div class="row">
				<c:if test="${empty list}">
				등록된 글이 없습니다
				</c:if>
				<c:if test="${!empty list}">
				<form id="seachFAQ">
				<select name="category">
				<option disabled>목록</option>
				<option>개인</option>
				<option>기업</option>
				</select>
				<input type="text"name="subject">
				<input type="hidden" name="cp">
				<input type="hidden" name="bAjax" value="true">
				<button type="button" class="search">검색</button>
				</form>
				</c:if>
				<c:forEach var="dto" items="${list}">
				${dto.subject}
				${dto.content}
				</c:forEach>
			</div>
			<div id="page">${page}</div>
			</article>
		</section>
	 <%@include file="/WEB-INF/views/footer.jsp"%> 
	</div>
	<script>
	$('.search').on('click',()=>{
		$.ajax({
			url:'userFAQList.do',
			data:$('#seachFAQ').serialize()
		}).done((data)=>{
			/////////////////////////////////
			for(var i=0;i<data.list.length;i++){
			$('.content').text(data.list[i].subject);
			}
			////////////////////////////////
			$('#page').children().remove();
			$('#page').append(data.page);
		})
	});
	</script>
</body>
</html>
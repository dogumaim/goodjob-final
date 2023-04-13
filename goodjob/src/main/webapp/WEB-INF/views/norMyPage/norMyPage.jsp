<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<title>Insert title here</title>
<style>
.container-fluid {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 20px;
}
</style>
</head>
<body>
	<div class="container">
	<%@include file="/WEB-INF/views/header.jsp"%>
	<c:if test="${empty dto }">등록된 글이 없습니다</c:if>
		<div class="row">
			<div class="col-5 offset-1 mb-4">
				<div class="card bg-secondary bg-opacity-10">
					<div class="card-body">
						<h2 class="card-title">내 정보</h2>
						<h5>${dto.name }</h5>
						<h5>${dto.gender }  ${dto.age }</h5>
						<h5>${dto.tel }</h5>
						<h5>${dto.addr }</h5>
						<input type ="button" value="수정" onclick="#">
					</div>
				</div>
				<br>
				<a onclick = "location.href = 'resumeUpdate.do'"><div class="card bg-secondary bg-opacity-10">
					<div class="card-body">
						<h2 class="card-title">내 이력서</h2>
						<br>
						<h5>${dto.subject }</h5>
						<br>
						<h5>${dto.writedate }</h5>
					</div>
				</div></a>
			</div>
			<div class="col-5 mb-4">
				<div class="card bg-secondary bg-opacity-10">
					<div class="card-body">
						<h1 class="card-title">
							<a href="">구직</a>
						</h1>
						<br>
						<div class="row">
							<div class="col-sm-12">
								<a href ="apNorList.do"><h5>신청한 아르바이트</h5></a>
								<h6>1</h6>
								<h6>2</h6>
								<h6>3</h6>
								<h6>4</h6>
								<h6>5</h6>
							</div>
							<br>
							<div class="col-sm-12">
								<a href="ofNorList.do"><h5>받은 제안</h5></a>
								<h6>1</h6>
								<h6>2</h6>
								<h6>3</h6>
								<h6>4</h6>
								<h6>5</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>
</body>
</html>
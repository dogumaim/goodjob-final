<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%
response.setHeader("Content-Disposition", "attachment;filename=member.doc");
response.setHeader("Content-Description", "JSP Generated Data");
response.setContentType("application/vnd.ms-word");
%> 
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
.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.addrtest1 {
	width: 400px;
}

h1 {
	margin: 100px 0px;
}

.container {
	text-align: center;
}

textarea {
	resize: none;
}

.card-body {
	text-align: center;
	margin: 30;
}
</style>
</head>
<body>
	<div class="container px-4 px-lg-5">
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<div class="col-md-12 col-lg-9 col-xl-8">
				<h1>이력서</h1>
				<div class="my-4"></div>
				<div class="card bg-primary bg-opacity-10">
					<div class="card-body">
						<table>
							<c:if test="${empty dto }">
								<tr>
									<th></th>
									<td>등록된 정보가 없습니다</td>
								</tr>
							</c:if>
							<tr>
								<th>이력서제목</th>
								<td>${dto.subject }</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>${dto.name}</td>
							</tr>
							<tr>
								<th>성별</th>
								<td>${dto.gender}</td>
							</tr>
							<tr>
								<th>나이</th>
								<td>${dto.age}</td>
							</tr>
							<tr>
								<th>주소</th>
								<td><span>${dto.addr } ${dto.detail_addr }</span></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${dto.email }</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${dto.tel }</td>
							</tr>
							<tr>
								<th>학력</th>
								<td>${dto.grade }</td>
							</tr>

						</table>
					</div>
				</div>

				<h2>경력사항</h2>
				<div class="my-4"></div>
				<div class="card bg-primary bg-opacity-10">
					<div class="card-body">
						<table>

							<tr>
								<th>경력구분</th>
								<td>&nbsp; &nbsp;${dto.career_check }</td>
							</tr>
							<tr>
								<th></th>
								<td><div id="carrer1">
										<c:choose>
											<c:when test="${dto.career_check == '신입' }"></c:when>
											<c:otherwise>
												<c:forEach var="list" items="${list }">
													<table>
														<tr>
															<th>회사명</th>
															<td>${list.com_name }</td>
														</tr>
														<tr>
															<th>근무기간</th>
															<td><span>${list.startday } </span> ~ <span>${list.endday }</span></td>
														</tr>
														<tr>
															<th>담당업무</th>
															<td>${list.part }</td>
														<tr>
														<tr>
															<th>서비스타입</th>
															<td>${list.service_type }</td>
														<tr>
													</table>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</div></td>
							</tr>
						</table>
					</div>
				</div>
				<h2>희망근무조건</h2>
				<div class="my-4"></div>
				<div class="card bg-primary bg-opacity-10">
					<div class="card-body">
						<table>

							<tr>
								<th>희망 근무지</th>
								<td>${dto.h_local1 }${dto.h_local2 }</td>
							</tr>
							<tr>
								<th>직종</th>
								<td>${dto.job }</td>
							</tr>
							<tr>
								<th>근무기간</th>
								<td>${dto.h_period }</td>
							</tr>
							<tr>
								<th>근무요일</th>
								<td>${yy }</td>
							</tr>

							<tr>
								<th>희망하는 근무시간</th>
								<td>${dto.h_worktime}</td>
							</tr>
							<tr>
								<th>급여종류</th>
								<td>${dto.h_pay_category}</td>
							</tr>
							<tr>
								<th>급여</th>
								<td>${dto.h_pay}</td>
							</tr>
						</table>
					</div>
				</div>
				<hr>

				<div>
					<h2>자기소개서</h2>
					<table>
						<tr>
							<td rows ="20" cols="50" name="content"> ${dto.content }
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
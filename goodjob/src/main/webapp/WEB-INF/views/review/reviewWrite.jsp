<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<%@include file="/WEB-INF/views/header.jsp"%>
		<h2>후기 작성</h2>
		<article>
			<form name="reviewWrite" action="reviewWrite.do" method="post">
				<input type="text" name="com_name" placeholder="회사이름을 적어주세요">
				<table>
					<c:if test="${empty dto}">
						<tr>
							<td>등록된 글이 없습니다</td>
						</tr>
					</c:if>

					<c:forEach var="dto" items="${dto}">

						<span> <input type="checkbox" name="keyword"
							id="keyword${dto.idx}" onclick="show(this)" value="${dto.idx}">${dto.content }
						</span>
					</c:forEach>


					<div class="input">
						<!-- 삽입할 위치 -->
					</div>


					<div>
						<input type="submit" value="작성" onclick="save(this)"> <input
							type="button" value="취소" onclick="location.href='reviewList.do'">
					</div>
				</table>
			</form>
		</article>
		<%@include file="/WEB-INF/views/footer.jsp"%>
	</div>

	<script>
		function show(obj) {
			let chkBoxIndex = document.getElementsByName("keyword").length + 1;
			let chkCnt = 0;

			for (var i = 1; i < chkBoxIndex; i++) {
				if ($('#keyword' + i)[0].checked) {
					chkCnt++;
				}
			}

			if (chkCnt > 3) {
				alert("3개까지 체크할 수 있습니다.")
				obj.checked = false;
				return false;
			}
		}

		function save(obj) {
			debugger
		}
	</script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<script type="text/javascript">
   var s_status='${sessionScope.status}';
   var s_category='${sessionScope.scategory}';
   var check_category='관리자';
   if( s_status==''){
      window.alert('로그인이 필요합니다');
      location.href='login.do';
   }else if(s_status=='블랙'){
      window.alert('차단된 회원입니다');
      location.href='index.do';
   }else if(s_category!=check_category){
      window.alert(check_category+'만 이용 가능한 페이지입니다');
      location.href='index.do';
   }
</script>
<style>
.btn-primary {
    color: #fff;
    background-color: #0d6efd;
    border-color: #0d6efd;
    
}
</style>
<body>
<section>
<article>
	<div class="container">
	<%@include file="/WEB-INF/views/header.jsp"%>
		<div class="text-left">
				<div class="mx-auto">
					<h2>일대일 문의</h2>
				</div>
		</div>
				<div class="row">
					<div  class="offset-sm-8 col-sm-4">
					<form name="manOneeList" id="manOneList">
					<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
					  <input type="radio" class="btn-check" name="category" id="btnradio1" autocomplete="off" checked value="개인">
					  <label class="btn btn-outline-primary" for="btnradio1">개인</label>
					
					  <input type="radio" class="btn-check" name="category" id="btnradio2" autocomplete="off" value="기업">
					  <label class="btn btn-outline-primary" for="btnradio2">기업</label>
					</div>
					<div class="input-group p-2">
								<input type="text" name="search" class="form-control" placeholder="제목을 입력하세요">
								<input type="button" id="submit" value="검색하기" class="btn btn-primary">
								</div>
						<input type="hidden" value="1" id="cp" name="cp">
						<input type="hidden" name="bAjax" value="true">	
					</form>
					</div>
				</div>
				<hr>
				<br>
			<table class="table table-hover">
				<thead>
					<tr class="table-dark">
						<th>No.</th>
						<th>문의카테고리</th>
						<th>문의제목</th>
						<th>답변상태</th>
						<th>수정일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty lists }">
						<tr>
							<td colspan="5" align="center">
								등록된 문의글이 없습니다.
							</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${lists }">
						<tr>
							<td>${dto.idx }</td>
							<td>${dto.category }</td>
							<c:url var="contentUrl" value="manOneContent.do">
								<c:param name="idx">${dto.idx }</c:param>
							</c:url>
							<td><a href="${contentUrl }">${dto.subject }</a></td>
							<c:if test="${dto.check == 0 }">
								<td>미답변</td>
							</c:if>
							<c:if test="${dto.check == 1 }">
								<td>답변</td>
							</c:if>
							<td>${dto.writedate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="page">${page }</div>
			<%@include file="/WEB-INF/views/footer.jsp" %>
	</div>
<script>
$("#manOneList").on("keydown", function(e) {
    if (e.keyCode == 13) {
        stopSubmit(e);
    }
});
 function stopSubmit(e) {
        e.preventDefault();
    }
 $('#submit').click(function() {
		$('#cp').attr({value:'1'});
		page();
	});
	$(document).on('click','#page button',function(){
		$('#cp').attr({value:$(this).val()});
		page();
	});
	
	function page() {
		  var para = $('#manOneList').serialize();
		  $.ajax({
		    url: 'manOneList.do',
		    data: para,
		    dataType: 'json', 
		    contentType: "application/json"
		  }).done(function(data) {
		    $('tbody').empty();
		    var list = data.lists; // ${list}에 해당하는 값으로 대체해주세요.
		    
		    if (list.length == 0) { // 등록된 문의가 없을 경우
		        var noListRow = $("<tr>")
		            .append($("<td>")
		                .attr("colspan", "5")
		                .attr("align", "center")
		                .text("등록된 문의가 없습니다."));
		        $("#table").append(noListRow);
		    } else { // 등록된 공고가 있을 경우
		        $.each(list, function(index, dto) {
		        	  var date = new Date(dto.writedate);
			            var year = date.getFullYear();
			            var month = ('0' + (date.getMonth() + 1)).slice(-2);
			            var day = ('0' + date.getDate()).slice(-2);
			            var formattedDate = year + '-' + month + '-' + day;
			            
		            var tr = $("<tr>")
		                .append($("<td>").text(dto.idx))
		                .append($("<td>").text(dto.subject))
		                .append($("<td>").text(dto.com_name))
		                .append($("<td>").text(dto.check))
		                .append($("<td>").text(formattedDate));
		          
		            $("tbody").append(tr);
		            
		            
		    $('#page').empty();
		    $('#page').append(data.page);
		  });
		}})}
	
</script>
</article>
</section>
</body>
</html>
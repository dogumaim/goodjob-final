<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko"> 
<head>
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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<%@include file="/WEB-INF/views/header.jsp"%>
		<section>
			<article>
			<h1><i class="bi bi-person-fill-x"></i>블랙리스트</h1>
				<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				  <input type="radio" class="btn-check" name="options" id="normal" autocomplete="off" value="개인" checked="checked">
					<label class="btn btn-outline-primary" for="normal">일반회원</label>
					<input type="radio" class="btn-check" name="options" id="company" value="기업" autocomplete="off">
					<label class="btn btn-outline-primary" for="company">기업회원</label>
				</div>
				<div id="my-div">
				</div>
				<input type="hidden" id="cp" value="1">
				<div id="page"></div>
			</article>
		</section>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</div>
<script>
showtab();
$('input[name=options]').change(function(){
	$('#my-div').empty();
	showtab();
	});


$(document).on('click','#page button',function(){
	$('#cp').attr({value:$(this).val()});
	$('#my-div').empty();
	showtab();
});

function showtab(){
	$.ajax({
	      url:'manBlackListGet.do',
	      type:'post',
	      data:{"category":$('.btn-check:checked').val(),"cp":$('#cp').val()},//전송데이터
	      dataType:'json'
	      //전송받을타입 json으로 선언하면 json으로 파싱안해도됨
	   }).done((data)=>{
	      //성공시 실행
		   var $table = $('<table>').addClass('table table-hover');
			  var $thead = $('<thead>');
			  var $theadRow = $('<tr>');
			  var $th1 = $('<th>').text('번호');
			  var $th2 = $('<th>').text('이름');
			  var $th3 = $('<th>').text('누적 신고');
			  var $th4 = $('<th>').text('등록일');
			  
			  $('#my-div').append($table);
			  $theadRow.append($th1);
			  $theadRow.append($th2);
			  $theadRow.append($th3);
			  $theadRow.append($th4);
			  
			  $thead.append($theadRow);
			  $table.append($thead);
			  
			  var $tbody = $('<tbody>');
			  
			  // 만약 lists가 비어있을 경우 "글이 없습니다" 행 추가
			  if (data.lists.length==0) {
			    var $noDataTr = $('<tr>').append($('<td>').attr('colspan', '4').text('글이 없습니다'));
			    $tbody.append($noDataTr);
			  } else {
			    // lists가 비어있지 않은 경우 데이터 행 추가
			    $.each(data.lists, function(index, dto) {
			      var $dataTr = $('<tr>');
			      var $td1 = $('<td>').text(dto.idx);
			      var $td2 = $('<td>').append($('<a>').attr('href', 'manBlackListContentForm.do?idx='+dto.idx).text(dto.name));
			      var $td3 = $('<td>').text(dto.singo_count);
			      var $td4 = $('<td>').text(dto.joindate ? formatDate(new Date(dto.joindate)) : 'N/A');

			      function formatDate(date) {
			        var year = date.getFullYear();
			        var month = (date.getMonth() + 1).toString().padStart(2, '0');
			        var day = date.getDate().toString().padStart(2, '0');
			        return year + '-' + month + '-' + day;
			      }
			      
			      $dataTr.append($td1);
			      $dataTr.append($td2);
			      $dataTr.append($td3);
			      $dataTr.append($td4);
			      
			      $tbody.append($dataTr);
			    });
			  }
			  
			  $table.append($tbody);
			  
			  $('#my-div').append($table);
			  $('#page').children().remove();
				$('#page').append(data.page);
			  
	   }).fail(()=>{
	      //실패시 실행
	   }).always(()=>{
	      //성공여부 무관 실행
		   
	   })
}
</script>
</body>
</html>
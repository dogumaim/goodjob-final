
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="container px-4 px-lg-5">
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<div class="col-md-12 col-lg-9 col-xl-8">
				<h1>이력서 작성</h1>
				<form id="writeForm" name="resumeWrite" action="resumeWrite.do"
					method="post">
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
									<th>${dto.name}/${nto.status}/${nto.review_num }</th>
									<td></td>
								</tr>
								<tr>
									<th>주소</th>
									<td><span>${dto.addr }</span>
										<div>
											상세주소 <input type="text" name="detail_addr" required>
										</div></td>
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
							</table>
							<div>
								<input type="hidden" name="name" value="${dto.name} "> <input
									type="hidden" name="addr" value="${dto.addr }"> <input
									type="hidden" name="gender" value="${nto.status }"> <input
									type="hidden" name="email" value="${dto.email }"> <input
									type="hidden" name="tel" value="${dto.tel }"> <input
									type="hidden" name="age" value="${nto.review_num }"> <input
									type="hidden" name="member_idx" value="${dto.idx}">

							</div>
						</div>
					</div>
					<div class="my-4"></div>
					<div class="card bg-primary bg-opacity-10">
						<div class="card-body">
							<table>
								<tr>
									<th>이력서제목</th>
									<td>
										<div>
											<input type="text" name="subject"
												class="form-control form-control-lg" required>
										</div>
									</td>

								</tr>
								<tr>
									<th>학력</th>
									<td><select name="grade"
										class="form-select form-select-lg mb-3"
										aria-label=".form-select-lg example">
											<option value="초등학교 졸업">초등학교 졸업</option>
											<option value="중학교 졸업">중학교 졸업</option>
											<option value="고등학교 졸업">고등학교 졸업</option>
											<option value="대학교 졸업">대학교 졸업</option>
											<option value="학력무관">학력무관</option>
									</select></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="my-4"></div>
					<h2>경력사항</h2>
					<div class="card bg-primary bg-opacity-10">
						<div class="card-body">
							<table>

								<tr>
									<th>경력구분</th>
									<td><input type="radio" value="신입" class="btn-check"
										id="career_check1" name="career_check" autocomplete="off"
										checked> <label class="btn btn-outline-primary"
										for="career_check1">신입</label> <input type="radio" value="경력"
										class="btn-check" id="career_check" name="career_check"
										autocomplete="off"> <label
										class="btn btn-outline-primary" for="career_check">경력</label></td>
								</tr>
								<tr>
									<th></th>
									<td><div id="carrer1" style="display: none;">
											<h5>나의 경력</h5>
											<table id="career">
												<tr>
													<th>회사명</th>
													<td><input type="text" name="com_name" id=""></td>
												</tr>
												<tr>
													<th>근무기간</th>
													<td><input type="text" id="date" name="startday_s"
														placeholder="근무시작일"> &nbsp; <input type="text"
														id="date2" name="endday_s" placeholder="근무종료일"></td>
												</tr>
												<tr>
													<th>담당업무</th>
													<td><input type="text" name="part"></td>
												</tr>
												<tr>
													<th>서비스타입</th>
													<td><select name="service_type"
														class="form-select form-select-lg mb-2"
														aria-label=".form-select-lg example">
															<option value="아르바이트">아르바이트</option>
															<option value="정직원">정직원</option>
													</select></td>
												</tr>
											</table>
											<div>
												<input type="button" class="chooga" value="추가">
											</div>
										</div></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="my-4"></div>
					<h2>희망근무조건</h2>
					<div class="card bg-primary bg-opacity-10">
						<div class="card-body">
							<table>

								<tr>
									<th>희망 근무지</th>
									<td><div class="addr input-group">
										<select class="h_local1" size="3" name="h_local1">
											<option selected>시 도</option>
										</select> <select class="h_local2" size="3" name="h_local2">
											<option selected>시 구 군</option>
										</select>
										<div class="lAddr"></div>
									</div></td>
								</tr>
								<tr>
								<tr>
									<th>직종</th>
									<td><input type="button" value="직종" onclick="show()">
										<input type="text" value="직종" name="job" id="job" readonly></td>
								</tr>
								</tr>


								<tr>
									<th>근무기간</th>
									<td><input type="radio" name="h_period" value="하루"
										class="btn-check" id="h_period" autocomplete="off" checked>
										<label class="btn btn-outline-primary" for="h_period">하루</label>
										<input type="radio" name="h_period" value="일주일이하"
										class="btn-check" id="h_period1" autocomplete="off"> <label
										class="btn btn-outline-primary" for="h_period1">일주일이하</label>
										<input type="radio" name="h_period" value="1주일~1개월"
										class="btn-check" id="h_period2" autocomplete="off"> <label
										class="btn btn-outline-primary" for="h_period2">1주일~1개월</label>
										<input type="radio" name="h_period" value="1개월~3개월"
										class="btn-check" id="h_period3" autocomplete="off"> <label
										class="btn btn-outline-primary" for="h_period3">1개월~3개월</label>
										<input type="radio" name="h_period" value="3개월~6개월"
										class="btn-check" id="h_period4" autocomplete="off"> <label
										class="btn btn-outline-primary" for="h_period4">3개월~6개월</label>
										<input type="radio" name="h_period" value="6개월~1년"
										class="btn-check" id="h_period5" autocomplete="off"> <label
										class="btn btn-outline-primary" for="h_period5">6개월~1년</label>
										<input type="radio" name="h_period" value="1년이상"
										class="btn-check" id="h_period6" autocomplete="off"> <label
										class="btn btn-outline-primary" for="h_period6">1년이상</label> <input
										type="radio" name="h_period" value="추후협의" class="btn-check"
										id="h_period7" autocomplete="off">
								</tr>
								<tr>
									<th>근무요일</th>
									<td><input type="radio" value="요일지정" class="btn-check"
										id="h_workday" name="h_workday" autocomplete="off" checked>
										<label class="btn btn-outline-primary" for="h_workday">요일지정</label>
								</tr>
								<tr>
									<th></th>
									<td><div id="checkh_h_workday" style="display: none;">
											<input type="checkbox" name="checkboxh_h_workday" value="mon"
												class="btn-check" id="mon"><label
												class="btn btn-outline-dark" for="mon">월</label> <input
												type="checkbox" name="checkboxh_h_workday" value="thu"
												class="btn-check" id="tue"><label
												class="btn btn-outline-dark" for="tue">화</label> <input
												type="checkbox" name="checkboxh_h_workday" value="wed"
												class="btn-check" id="wed"><label
												class="btn btn-outline-dark" for="wed">수</label> <input
												type="checkbox" name="checkboxh_h_workday" value="thu"
												class="btn-check" id="thu"><label
												class="btn btn-outline-dark" for="thu">목</label> <input
												type="checkbox" name="checkboxh_h_workday" value="fri"
												class="btn-check" id="fri"><label
												class="btn btn-outline-dark" for="fri">금</label> <input
												type="checkbox" name="checkboxh_h_workday" value="sat"
												class="btn-check" id="sat"><label
												class="btn btn-outline-dark" for="sat">토</label> <input
												type="checkbox" name="checkboxh_h_workday" value="sun"
												class="btn-check" id="sun"><label
												class="btn btn-outline-dark" for="sun">일</label> <input
												type="checkbox" name="checkboxh_h_workday" value="moo"
												class="btn-check" id="moo"><label
												class="btn btn-outline-dark" for="moo">무관</label>
										</div></td>
								</tr>
								<tr>
									<th>희망하는 근무시간</th>
									<td><select name="h_worktime"
										class="form-select form-select-lg mb-2"
										aria-label=".form-select-lg example">
											<option value="오전">오전</option>
											<option value="오후">오후</option>
											<option value="무관">무관</option>
									</select></td>
								</tr>
								<tr>
									<th>급여</th>
									<td><input type="radio" value="시급" class="btn-check"
										id="h_pay_category" name="h_pay_category" autocomplete="off"
										checked> <label class="btn btn-outline-primary"
										for="h_pay_category">시급</label> <input type="radio" value="월급"
										class="btn-check" id="h_pay_category1" name="h_pay_category"
										autocomplete="off"> <label
										class="btn btn-outline-primary" for="h_pay_category1">월급</label>
										<input type="text" name="h_pay">원
										<div id="week_h_worktime" style="display: none;">
											1주 근무시간<input type="number" name="h_worktimes" value="0">
										</div></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="my-4"></div>
					<h2>자기소개서</h2>
					<div class="card bg-primary bg-opacity-10">
						<div class="card-body">
							<textarea rows="30" cols="50" name="content"></textarea>
						</div>
					</div>
					<div>
						<div class="my-4"></div>
						<h2>공개여부</h2>
						<div class="card bg-primary bg-opacity-10">
							<div class="card-body">
								<label> <input type="checkbox" name="check" value=1
									required>공개
								</label> <label> <input type="checkbox" name="check" value=0>비공개
								</label>
							</div>
						</div>
					</div>
					<div class="my-4"></div>
					<button type="submit"
						class="btn btn-primary btn-icon-split btn-lg col-12">
						<span class="icon text-white-50"> <i class="bi bi-check-lg"></i>
						</span> <span class="text">등록</span>
					</button>
				</form>
			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/views/footer.jsp"%>
	<script>
	$.ajax({
		url:'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=*00000000',
	      type:'get',
	      contentType: "application/json"
	}).done((data)=>{
		for(var i=0;i<data.regcodes.length;i++){
			var op= $('<option>').attr({id:data.regcodes[i].code.substring(0,2)}).text(data.regcodes[i].name);
			$('.h_local1').append(op);
		}
	});
	$('.h_local1').on('change',()=>{
		$('.h_local2').empty();
		$('.lAddr').empty();
		var pattern=$('.h_local1 option:selected').attr('id');
		$.ajax({
			url:'https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern='+pattern+'*00000&is_ignore_zero=true',
			type:'get',
		      contentType:"application/json"
		}).done((data)=>{
			for(var i=0; i<data.regcodes.length; i++){
				  if (i > 0 && data.regcodes[i].code.substring(0, 5) - 1 == data.regcodes[i-1].code.substring(0, 5)) {
					  if(data.regcodes[i-1].code.substring(0, 5).substr(-1) == '0'){
				   		 $('#' + data.regcodes[i-1].code.substring(0, 5)).remove();
					  }
				  }
				  var name = data.regcodes[i].name;
				  var sname = name.split(' ');
				  if(sname.length==3){
					  var op = $('<option>').attr({id: data.regcodes[i].code.substring(0, 5)}).text(sname[1]+' '+sname[2]);
					  $('.h_local2').append(op);
				  }else{
					  
				  var op = $('<option>').attr({id: data.regcodes[i].code.substring(0, 5)}).text(sname.slice(1));
				  $('.h_local2').append(op);
				  }
				
				}
			})
	});
	$(document).ready(function() {
		$('#checkh_h_workday').show();
		$('input[name="h_workday"]').change(function() {
			if ($(this).val() == '요일지정') {
				$('#checkh_h_workday').show();
			} else {
				$('#checkh_h_workday').hide();
			}
		});
	});
	$(document).ready(function() {
		$('input[name="career_check"]').change(function() {
			if ($(this).val() == '경력') {
				$('#carrer1').show();
			} else {
				$('#carrer1').hide();
			}
		});
	});
	$(document).ready(function() {
		$('input[name=checkboxh_h_workday]').click(function() {
			if (this.id === 'moo') {
				$('input[name=checkboxh_h_workday]:lt(7)').prop('checked', false);
			} else {
				$('#moo').prop('checked', false);
			}
		});
	});

	function show() {

		var url = "joblist.do";
		var name = "h_job";
		var option = "width=500, heigt = 500, top=500, left =200";
		window.open(url, name, option);

	}

	$(document).ready(
			function() {
				$('input[type="checkbox"][name="check"]').click(
						function() {

							if ($(this).prop('checked')) {
								$('input[type="checkbox"][name="check"]').prop(
										'checked', false);
								$(this).prop('checked', true);
							}
						});
			});
	$(document).ready(function() {
	  $('input[name="h_pay_category"]').change(function() {
	    if ($(this).val() == '월급') {
	      $('#week_h_worktime').show();
	    } else {
	      $('#week_h_worktime').hide();
	    }
	  });
	});
	$(document).ready(function() {
		  $('button[type="submit"]').click(function() {
		    var selectedDays = '';
		    $('input[name="checkboxh_h_workday"]').each(function() {
		      if($(this).is(':checked')) {
		        selectedDays += '1';
		      } else {
		        selectedDays += '0';
		      }
		    });
		    $('#h_workday').val(selectedDays);
		  });
		});
	$('#date').datepicker({
		format : 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		templates : {
			leftArrow : '&laquo;',
			rightArrow : '&raquo;',
		}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
		showWeekDays : true, // 위에 요일 보여주는 옵션 기본값 : true
		title : '생년월일', //캘린더 상단에 보여주는 타이틀
		todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false
		toggleActive : true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		language : 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
	}).on('changeDate', function(e) {
		console.log(e);
	});
	$('#date2').datepicker({
		format : 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		templates : {
			leftArrow : '&laquo;',
			rightArrow : '&raquo;',
		}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
		showWeekDays : true, // 위에 요일 보여주는 옵션 기본값 : true
		title : '생년월일', //캘린더 상단에 보여주는 타이틀
		todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false
		toggleActive : true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		language : 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
	}).on('changeDate', function(e) {
		console.log(e);
	});
	$('.chooga').on('click',function(){
		$("#career").append('<tr><th>회사명</th><td><input type="text" name="com_name"></td></tr>');
		$("#career").append('<tr><th>근무기간</th><td><input type="date" id="date" name="startday_s" placeholder="근무시작일">&nbsp;<input type="date" id="date2" name="endday_s" placeholder="근무종료일"></td></tr>');
		$("#career").append('<tr><th>담당업무</th><td><input type="text" name="part"></td></tr>');
		$("#career").append('<tr><th>서비스타입</th><td><select name="service_type" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example"><option value="아르바이트">아르바이트</option><option value="정직원">정직원</option></select></td></tr>');
	})
	
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<div class="container">
	 <%@include file="/WEB-INF/views/header.jsp"%> 
		<section>
			<article>
				<form name="manBannerUpdate" action="manBannerUpdate.do" method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-sm-6 offset-sm-3">
						<h2 align="center">배너 수정</h2>
					</div>
				</div>
				<div class="row">
					<div class="offset-sm-3 col-sm-6" align="center">
						<a href="manBannerPage.do">추가</a> | <a href="manBannerUpdatePage.do">수정</a> | <a href="manBannerDelPage.do">삭제</a>
					</div>
				</div>
				<table class="table">
					<tr>
						<td>배너 제목 : <input type="text" name="subject" placeholder="제목를 입력해주세요" class="form-control" value="${dto.subject }"></td>
					</tr>
					<tr>
						<td>배너 파일 : 
						<input class="form-control" type="file" id="inputImage" name="file" style="display: block;">
						<br>
						미리보기 :
						<img style="width: 300px;" id="previewImage" src="https://dummyimage.com/300x100/ffffff/000000.png&text=PreviewImage">
						<script type="text/javascript">
						/**
						 * 단일파일 업로드
						 */
						function readImage(input) {
						    if (input.files && input.files[0]) {
						        const reader = new FileReader();
						        
						        reader.onload = (e) => {
						            const previewImage = document.getElementById('previewImage');
						            previewImage.src = e.target.result;
						        }
						        reader.readAsDataURL(input.files[0]);
						    }
						}
						// 이벤트 리스너
						document.getElementById('inputImage').addEventListener('change', (e) => {
						    readImage(e.target);
						})
						</script>
					</tr>
					<tr>
						<td>배너 링크 :
							<input type="text" class="form-control" name="link" placeholder="링크를 입력해주세요."	>
						</td>
					</tr>
					<tfoot>
						<tr>
							<td>
								<input type="hidden" value="${dto.idx }" name="idx">
								<input type="hidden" value="${dto.file_idx }" name="fileidx">
								<input type="hidden" value="banner" name="category">
								<input type="submit" value="수정하기" class="btn btn-primary">
							</td>
						</tr>
						</tfoot>
				</table>
				</form>
			</article>
		</section>
	 <%@include file="/WEB-INF/views/footer.jsp"%> 
	</div>
</body>
</html>
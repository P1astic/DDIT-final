<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link type="text/css" href="/resources/ckeditor5/sample/css/sample.css"
	rel="stylesheet" media="screen" />
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript" src="/resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<script type="text/javascript">
	function handleImg(e) {
		//e.target : <input type="file" id="uploadFile".. 이벤트 발생시킬 타겟 누르면 반응하는 곳
		let files = e.target.files; //선택한 파일들
		//잘라서 배열화
		//fileArr = [a.jpg, b.jpg,c.jpg]
		let fileArr = Array.prototype.slice.call(files);
		//f: a.jpg객체
		let accumStr = "";
		fileArr.forEach(function(f) {
			//만약 이미지가 아니면 ex)hwp
			// 		if(f.type.match("image.*")){
			if (!f.type.match("image.*")) {
				alert("이미지 확장자만 가능합니다");
				return;//함수 종료
			}
			//이미지가 맞다면 ex)jpg 
			//이미지를 읽는다
			let reader = new FileReader();
			//e : reader가 이미지 객체를 읽는 이벤트
			reader.onload = function(e) {
				accumStr += "<img src='" + e.target.result
						+ "' style='width:20%;border:1px solid #D7DCE1'/>";
				$("#pImg").html(accumStr);
			}
			reader.readAsDataURL(f);

		})
	};

	$(function() {
		console.log("모카");

		//비동기 등록
		$("#btnAjax").on(
				"click",
				function() {
					console.log("왔다");
					//가상 폼(폼데이터들을 넣을 가상폼)
					let formData = new FormData();

					//자동차 번호
					let carNum = $("#carNum").val();

					//고객 번호
					let custNum = $("#custNum").val();

					// 	제조사
					let mfr = $("#mfr").val();

					let myr = $("#myr").val();

					//주행거리
					let drvDst = $("#drvDst").val();

					//파일 처리
					let inputFile = $("input[name='uploadFile']");
					let files = inputFile[0].files;
					//files.length : 파일 객체의 개수
					for (let i = 0; i < files.length; i++) {
						//<input type="file" name="uploadFile" ;;; 반복

						formData.append("uploadFile", files[i]);

					}

					//<form>
					//   <input type="text" name="carNum" value="12가1234" />
					//   <input type="text" name="custNum" value="1" />
					//   <input type="text" name="mfr" value="audi" />
					//   <input type="text" name="myr" value="2024" />
					//   <input type="text" name="drvDst" value="12000" />
					//</form>

					formData.append("carNum", carNum);
					formData.append("custNum", custNum);
					formData.append("mfr", mfr);
					formData.append("myr", myr);
					formData.append("drvDst", drvDst);

					/*\
					Form
					 */

					//DATAtype : "text" return 문자열, 숫자
					// "json" return 객체 
					$.ajax({
						url : "/car/registPostAjax",
						processData : false,
						contentType : false,
						data : formData,
						type : "post",
						dataType : "text",
						beforeSend : function(xhr) {
							xhr.setRequestHeader("${_csrf.headerName}",
									"${_csrf.token}");
						},
						success : function(result) {
							console.log("result : ", result);

							//             $("#prodId").val(result);

							// success, error, warning, info, question
							//성공 팝업 메시지
							var Toast = Swal.mixin({
								toast : true,
								position : 'top-end',
								showConfirmButton : false,
								timer : 3000
							// 3초간 유지
							});

							Toast.fire({
								icon : 'success',
								title : '23'
							});

							setTimeout(function() {
								location.href = "/car/detail?carNum=" + result;
							}, 3000);
						}

					});

				});

	});
</script>

<div class="row">
	<div class="col-md-12">


		<div class="card card-primary">
			<div class="card-header">
				<h3 class="card-title">주차예약</h3>
			</div>



			<!-- 라벨  VO 이름 수정 -->
			<div class="form-group">
				<label for="custNum">주차장</label> <select name="mfr" id="mfr"
					class="form-control">
					<!-- 							<select  name="mfr" id="mfr"  -->
					<!-- 							class="form-control" > -->


					<option value="" disabled selected>선택해주세요</option>
					<option value="P1">P5</option>
					<option value="P2">외부 주차장</option>

				</select>

			</div>


			<div class="form-group">
				<label>입차일시</label>
				<div class="input-group date" id="reservationdate"
					data-target-input="nearest">
					<input type="text" class="form-control datetimepicker-input"
						data-target="#reservationdate">
					<div class="input-group-append" data-target="#reservationdate"
						data-toggle="datetimepicker">
						<div class="input-group-text">
							<i class="fa fa-calendar"></i>
						</div>
					</div>
				</div>
			</div>

			<label>출차일시</label>
			<div class="input-group date" id="reservationdate"
				data-target-input="nearest">
				<input type="text" class="form-control datetimepicker-input"
					data-target="#reservationdate">
				<div class="input-group-append" data-target="#reservationdate"
					data-toggle="datetimepicker">
					<div class="input-group-text">
						<i class="fa fa-calendar"></i>
					</div>
				</div>
			</div>
		</div>


		<form name="registForm" id="registForm" action="/car/registPost"
			method="post">
			<div class="card-body">
				<div class="form-group">
					<label for="carNum">주차장</label> <input type="text"
						class="form-control" id="carNum" name="carNum" maxlength="7"
						required placeholder="이름">
				</div>

				<div class="form-group">
					<label for="custNum"></label> <select name="custNum" id="custNum"
						class="form-control">
						<option value="" selected disabled>선택해주세요</option>
						<c:forEach var="custVO" items="${custVOList}">
							<option value="${custVO.custNum}">${custVO.custNm}(${custVO.custNum })
							</option>
						</c:forEach>
					</select>

				</div>

				<div class="form-group">
					<label for="custNum">제조사</label> <select name="mfr" id="mfr"
						class="form-control">
						<!-- 							<select  name="mfr" id="mfr"  -->
						<!-- 							class="form-control" > -->
						<option value="" selected disabled>선택해주세요</option>
						<c:forEach var="mfrVO" items="${mfrVOList}">
							<option value="${mfrVO.mfrCode}">${mfrVO.mfrNm}(${mfrVO.mfrCode})
							</option>
						</c:forEach>
					</select>

				</div>

				<div class="form-group">
					<label for="myr">제조일</label> <input type="number"
						class="form-control" id="myr" name="myr" placeholder="myr">
				</div>

				<div class="form-group">
					<label for="drvDst">주행거리</label> <input type="number"
						class="form-control" id="drvDst" name="drvDst"
						placeholder="drvDst">
				</div>





			</div>

			<div class="card-footer"
				style="justfy-content: space-between; display: flex;">
				<!-- 등록 오른쪽 목록 왼쪽 -->
				<div class="col-md-6">
					<a href="/emp/list" class="btn btn-primary" style="float: left;">목록</a>
				</div>
				<div class="col-md-6">
					<button type="button" id="btnAjax" class="btn btn-primary"
						style="float: right;">등록</button>
				</div>
			</div>

			<sec:csrfInput />
		</form>
	</div>
</div>
</div>
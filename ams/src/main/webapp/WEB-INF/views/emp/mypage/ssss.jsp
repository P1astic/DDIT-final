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




<div class="content-wrapper" style="min-height: 1604.44px;">



	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-3">

					<div class="card card-primary card-outline">
						<div class="card-body box-profile">
							<!-- 프로필 사진 -->
							<div class="text-center">
								<!-- 								<img class="profile-user-img img-fluid img-circle" -->
								<!-- 									src="WEB-INF/views/emp/mypage/KakaoTalk_20240822_114250244_10.jpg" -->
								<!-- 									alt="User profile picture"> -->
							</div>

							<label for="memId">${employeeVO.empNm}</label>
							<ul class="list-group list-group-unbordered mb-3">

							</ul>
<!-- 							<input type="text" class="profile-username text-center" -->
<%-- 								id="empNm" name="empNm" value="${memVO.employeeVO.empNm}" --%>
<!-- 								readonly> -->

						</div>
						<p class="text-muted text-center">직원구분</p>
						<p class="text-muted text-center">부서</p>

						<!-- 			<ul class="list-group list-group-unbordered mb-3"> -->

						<div class="form-group">
							<label for="memId">사원명</label> <input type="text"
								class="form-control" id="empNm" name="empNm"
								value="${employeeVO.empNm}" readonly>

						</div>


						<p class="text-muted text-left">
							<b>직위</b> <a class="float-right">부장</a>
						</p>


						<p class="text-muted text-left">
							<b>입사일자</b> <a class="float-right">2000-02-03</a>
						</p>
						<!-- 							</ul> -->
						<ul class="list-group list-group-unbordered mb-3">
							<li class="list-group-item"><b>이메일 </b> <a
								class="float-right">13djladj@gmaicl.com</a></li>
							<li class="list-group-item"><b>휴대전화</b> <a
								class="float-right">010-8944-5101</a></li>
						</ul>

					</div>


				</div>




			</div>

		</div>
</div>


<!-- 정보수정 카드 -->
<div class="col-md-9">
	<div class="card">
		<div class="card-header p-2">
			<ul class="nav nav-pills">
				<li class="nav-item"><a class="nav-link active" href="#info"
					data-toggle="tab">인사정보</a></li>
				<li class="nav-item"><a class="nav-link" href="#school"
					data-toggle="tab">학력</a></li>
				<li class="nav-item"><a class="nav-link" href="#career"
					data-toggle="tab">경력</a></li>
				<li class="nav-item"><a class="nav-link" href="#work"
					data-toggle="tab">담당업무</a></li>

			</ul>
		</div>
	</div>
	<div class="card-body">
		<div class="tab-content">
			<div class="tab-pane" id="info">

				<div class="post">


					<div class="row">
						<div class="col-sm-6">

							<div class="form-group">
								<label>Text</label> <input type="text" class="form-control"
									placeholder="Enter ...">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Text Disabled</label> <input type="text"
									class="form-control" placeholder="Enter ..." disabled="">
							</div>
						</div>
					</div>
				</div>


			</div>

			<div class="tab-pane" id="school">

				<div class="timeline timeline-inverse">

					<div class="row">
						<div class="col-sm-6">

							<div class="form-group">
								<label>Text</label> <input type="text" class="form-control"
									placeholder="Enter ...">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Text Disabled</label> <input type="text"
									class="form-control" placeholder="Enter ..." disabled="">
							</div>
						</div>
					</div>
				</div>



			</div>


			<div class="tab-pane active" id="career">
				<form class="form-horizontal">
					<div class="form-group row">
						<label for="inputName" class="col-sm-2 col-form-label">Name</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="inputName"
								placeholder="Name">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="inputEmail"
								placeholder="Email">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputName2" class="col-sm-2 col-form-label">Name</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputName2"
								placeholder="Name">
						</div>
					</div>

					<div class="form-group row">
						<div class="offset-sm-2 col-sm-10">
							<button type="submit" class="btn btn-danger">Submit</button>
						</div>
					</div>
				</form>
			</div>

			<div class="tab-pane active" id="work">
				<form class="form-horizontal">
					<div class="form-group row">
						<label for="inputName" class="col-sm-2 col-form-label">Name</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="inputName"
								placeholder="Name">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="inputEmail"
								placeholder="Email">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputName2" class="col-sm-2 col-form-label">Name</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputName2"
								placeholder="Name">
						</div>
					</div>
					<div class="form-group row">
						<label for="inputExperience" class="col-sm-2 col-form-label">Experience</label>
						<div class="col-sm-10">
							<textarea class="form-control" id="inputExperience"
								placeholder="Experience"></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label for="inputSkills" class="col-sm-2 col-form-label">Skills</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputSkills"
								placeholder="Skills">
						</div>
					</div>
					<div class="form-group row">
						<div class="offset-sm-2 col-sm-10">
							<div class="checkbox">
								<label> <input type="checkbox"> I agree to the <a
									href="#">terms and conditions</a>
								</label>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<div class="offset-sm-2 col-sm-10">
							<button type="submit" class="btn btn-danger">Submit</button>
						</div>
					</div>
				</form>
			</div>

		</div>

	</div>

</div>

</section>

</div>


<!-- <div class="form-group"> -->
<!-- 	<label for="carNum">자동차</label> <select name="carNum" id="carNum" -->
<!-- 		class="form-control" required> -->
<%-- 		<option value="${perSerVO.carNum}">${perSerVO.carNum}</option> --%>
<!-- 	</select> -->
<!-- </div> -->

<!-- <div class="form-group"> -->
<!-- 	<label for="amt">수리비</label> <input type="number" class="form-control" -->
<%-- 		name="amt" id="amt" placeholder="수리비" value="${perSerVO.amt}" readonly /> --%>
<!-- </div> -->
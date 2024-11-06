<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<aside class="main-sidebar sidebar-dark-primary elevation-4">


<!-- 
	2024.09.12. 홍정호
	사이드바 메뉴명 수정
 -->

	<!-- Brand Logo -->
	<a href="/" class="brand-link"> <img
		src="/resources/adminlte3/dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
		class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light">AMS</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
               

				<li class="nav-item"><a href="#"
					class="nav-link"> <i class="nav-icon fas fa-th"></i>
						<p>
							홈 
						</p>
				</a></li>
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-th"></i>
						<p>
							공지사항
						</p>
					</a>

				</li>
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-th"></i>
						<p>
							마이페이지 <i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>내정보</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>출퇴근</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>휴가</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>출장</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>외근</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>근태현황</p>
							</a>
						</li>
					</ul>
				</li>
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-th"></i>
						<p>
							전자결재 <i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="#" class="nav-link">
							<i class="far fa-circle nav-icon"></i>
							<p>
								결재하기<i class="fas fa-angle-left right"></i>
							</p>
							</a>
							<ul class="nav nav-treeview">
								<li class="nav-item">
									<a href="#" class="nav-link">
									<i class="far fa-dot-circle nav-icon"></i>
									<p>결재 생성하기</p>
									</a>
								</li>
								<li class="nav-item">
									<a href="#" class="nav-link">
									<i class="far fa-dot-circle nav-icon"></i>
									<p>결재 대기문서</p>
									</a>							
								</li>
								<li class="nav-item">
									<a href="#" class="nav-link">
									<i class="far fa-dot-circle nav-icon"></i>
									<p>결재 경비사용내역</p>
									</a>							
								</li>																
							</ul>
						</li>
						<li class="nav-item"><a href="#" class="nav-link">
							<i class="far fa-circle nav-icon"></i>
							<p>
								문서함<i class="fas fa-angle-left right"></i>
							</p>
							</a>
							<ul class="nav nav-treeview">
								<li class="nav-item">
									<a href="#" class="nav-link">
									<i class="far fa-dot-circle nav-icon"></i>
									<p>
										결재 문서함
									</p>
									</a>									
								</li>
								<li class="nav-item">
									<a href="#" class="nav-link">
									<i class="far fa-dot-circle nav-icon"></i>
									<p>
										수신문서
									</p>
									</a>									
								</li>
								<li class="nav-item">
									<a href="#" class="nav-link">
									<i class="far fa-dot-circle nav-icon"></i>
									<p>
										발신문서
									</p>
									</a>									
								</li>
								<li class="nav-item">
									<a href="#" class="nav-link">
									<i class="far fa-dot-circle nav-icon"></i>
									<p>
										참조/열람문서
									</p>
									</a>									
								</li>														
							</ul>
						</li>	
					</ul>
				</li>
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-th"></i>
						<p>
							메신저
						</p>
					</a>
				</li>
				<li class="nav-item"><a href="/resources/adminlte3/pages/calendar.html"
					class="nav-link"> <i class="nav-icon far fa-calendar-alt"></i>
						<p>
							캘린더
						</p>
				</a></li>
				<li class="nav-item">
					<a href="#" class="nav-link">
					<i class="nav-icon far fa-envelope"></i>
						<p>
						메일함 <i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="/resources/adminlte3/pages/mailbox/mailbox.html" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Inbox</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="/resources/adminlte3/pages/mailbox/compose.html" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Compose</p>
							</a>
						</li>
						<li class="nav-item"><a href="/resources/adminlte3/pages/mailbox/read-mail.html" class="nav-link">
							<i class="far fa-circle nav-icon"></i>
							<p>Read</p>
							</a>
						</li>
					</ul>
				</li>
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-th"></i>
						<p>
							인사 <i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="#" class="nav-link">
							<i class="far fa-dot-circle nav-icon"></i>
							<p>
								조직도
							</p>
							</a>	
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">
							<i class="far fa-dot-circle nav-icon"></i>
							<p>
								사원
							</p>
							</a>	
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">
							<i class="far fa-dot-circle nav-icon"></i>
							<p>
								급여
							</p>
							</a>	
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">
							<i class="far fa-dot-circle nav-icon"></i>
							<p>
								근태현황
							</p>
							</a>	
						</li>																		
					</ul>
				</li>
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-th"></i>
						<p>
							공항관리 <i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="#" class="nav-link">
							<i class="far fa-dot-circle nav-icon"></i>
							<p>
								항공사관리 <i class="fas fa-angle-left right"></i>
							</p>
							</a>
							<ul class="nav nav-treeview">
								<li class="nav-item">
									<a href="#" class="nav-link">
									<i class="far fa-dot-circle nav-icon"></i>
									<p>
										카운터 위치관리
									</p>
									</a>	
								</li>	
								<li class="nav-item">
									<a href="#" class="nav-link">
									<i class="far fa-dot-circle nav-icon"></i>
									<p>
										탑승장 위치관리
									</p>
									</a>	
								</li>								
							</ul>					
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">
							<i class="far fa-dot-circle nav-icon"></i>
							<p>
								출입증 관리
							</p>
							</a>
							<ul class="nav nav-treeview">
								<li class="nav-item">
									<a href="#" class="nav-link">
									<i class="far fa-dot-circle nav-icon"></i>
									<p>
										출입증 신청내역 <i class="fas fa-angle-left right"></i>
									</p>
									</a>						
								</li>
							</ul>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">
							<i class="far fa-dot-circle nav-icon"></i>
							<p>
								고객소리함 처리
							</p>
							</a>							
						</li>												
					</ul>
				</li>
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-th"></i>
						<p>
							시설관리 <i class="fas fa-angle-left right"></i>
						</p>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="far fa-dot-circle nav-icon"></i>
								<p>
									차량정보관리 <i class="fas fa-angle-left right"></i>
								</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="far fa-dot-circle nav-icon"></i>
								<p>
									유지보수관리 <i class="fas fa-angle-left right"></i>
								</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="far fa-dot-circle nav-icon"></i>
								<p>
									사내시설이용 <i class="fas fa-angle-left right"></i>
								</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">
								<i class="far fa-dot-circle nav-icon"></i>
								<p>
									상업시설관리 <i class="fas fa-angle-left right"></i>
								</p>
							</a>
						</li>																		
					</ul>
				</li>
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-th"></i>
						<p>
							재고관리 <i class="fas fa-angle-left right"></i>
						</p>
					</a>
				</li>
				<li class="nav-item">
					<a href="#" class="nav-link">
						<i class="nav-icon fas fa-th"></i>
						<p>
							회계 <i class="fas fa-angle-left right"></i>
						</p>
					</a>
				</li>
				<li class="nav-item"><a href="/resources/adminlte3/index3.html"
					class="nav-link"> <i
						class="nav-icon fas fa-tachometer-alt"></i>
						<p>
							통계조회
						</p>
				</a>
				</li>
				<li class="nav-item"><a href="/role/list"
					class="nav-link"> <i
						class="nav-icon fas fa-tachometer-alt"></i>
						<p>
							권한관리
						</p>
				</a>
				</li>
				<li class="nav-header">참고하면 좋은 컴포넌트들 24.9.12. 홍정호</li>
				
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-chart-pie"></i>
						<p>
							Charts <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="/resources/adminlte3/pages/charts/chartjs.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>ChartJS</p>
						</a></li>
						<li class="nav-item"><a href="/resources/adminlte3/pages/charts/flot.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Flot</p>
						</a></li>
						<li class="nav-item"><a href="/resources/adminlte3/pages/charts/inline.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>Inline</p>
						</a></li>
						<li class="nav-item"><a href="/resources/adminlte3/pages/charts/uplot.html"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p>uPlot</p>
						</a></li>
					</ul></li>				
					
			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>
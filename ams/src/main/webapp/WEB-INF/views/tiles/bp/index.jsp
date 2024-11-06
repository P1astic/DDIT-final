<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html style="width:1280px; height:1024px; overflow-y:auto; max-width:1280px;">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AMS</title>

  <!-- 부트스트랩 아이콘 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/resources/adminlte3/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="/resources/adminlte3/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/resources/adminlte3/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
<!--   <link rel="stylesheet" href="/resources/adminlte3/plugins/jqvmap/jqvmap.min.css"> -->
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/adminlte3/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="/resources/adminlte3/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="/resources/adminlte3/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="/resources/adminlte3/plugins/summernote/summernote-bs4.min.css">
  <!-- favicon -->
  <link rel="icon" href="/resources/images/favicon/airplane3.png">
  
</head>
<body class="hold-transition sidebar-mini layout-fixed" style="font-family:Pretendard;">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="/resources/adminlte3/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- ---------------- Navbar header.jsp 시작 ---------------- -->
  <tiles:insertAttribute name="header" />
  <!-- ---------------- /.navbar header.jsp 끝----------------  -->

  <!-- Main Sidebar Container aside.jsp 시작 -->
  <tiles:insertAttribute name="aside" />
  <!-- Main Sidebar Container aside.jsp 끝 -->
  

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="background-color:white; padding-top:56px;">
<!--   style="min-height: 900px; -->
<!-- /*     width: auto; */ -->
<!-- /*     display: flex; */ -->
<!-- /* /*     background-color: green; */ */ -->
<!--     flex-direction: column;"> -->
<!--     Main content -->
    <section class="content"> 
<%--     style="padding: 0px; --%>
<%--     margin: 0 auto; --%>
<%--     box-sizing: border-box;" --%>
      <div class="container-fluid">
        <!-- -------------------- body 시작 -------------------- -->
        <tiles:insertAttribute name="body" />
        <!-- -------------------- body 끝 -------------------- -->
      </div>
    </section>
    <!-- /.content -->
	</div>
    <!-- /.content-wrapper -->
  
  <!-- --------------  footer.jsp 시작 ----------------------- -->
<%--   <tiles:insertAttribute name="footer" /> --%>
  <!-- --------------  footer.jsp 끝 ----------------------- -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="/resources/adminlte3/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/resources/adminlte3/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="/resources/adminlte3/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Sparkline -->
<!-- <script src="/resources/adminlte3/plugins/sparklines/sparkline.js"></script> -->
<!-- JQVMap -->
<!-- <script src="/resources/adminlte3/plugins/jqvmap/jquery.vmap.min.js"></script> -->
<!-- <script src="/resources/adminlte3/plugins/jqvmap/maps/jquery.vmap.usa.js"></script> -->
<!-- jQuery Knob Chart -->
<script src="/resources/adminlte3/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="/resources/adminlte3/plugins/moment/moment.min.js"></script>
<script src="/resources/adminlte3/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="/resources/adminlte3/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="/resources/adminlte3/plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="/resources/adminlte3/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/adminlte3/dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<!--24.9.12. 홍정호 내용 : 접속시 팝업창이 안뜨게 설정함 -->
<!-- <script src="/resources/adminlte3/dist/js/demo.js"></script> -->
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<!-- <script src="/resources/adminlte3/dist/js/pages/dashboard.js"></script> -->
</body>
</html>

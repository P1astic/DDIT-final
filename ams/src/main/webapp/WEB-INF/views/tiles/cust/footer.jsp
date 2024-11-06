<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/cust/airPage2.css">
<script>

$(function(){
	$("#a1").on("click",function(){
		window.location.href = '/cust/map/route';
	})
	$("#a2").on("click",function(){
		window.location.href = '/cust/floorInfo/info';
	})
	$("#a3").on("click",function(){
		window.location.href = '/cust/airportFacility/list';
	})
	$("#a4").on("click",function(){
		window.location.href = '/cust/airplane/arrivalList';
	})
	$("#a5").on("click",function(){
		window.location.href = '/cust/map/route';
	})
});

</script>
<style>
.a{
color: #737373;
cursor: pointer;
}
.f_menu {
    overflow: hidden;
    width: 100%;
    box-sizing: border-box;
        display: flex;
    /* justify-content: flex-start; */
    gap: 20px;
    padding-left: 67px;
    height: 23px;
}
</style>


    <footer class="site-footer">
	<ul class="f_menu">

		<li><a href="/gimpo/cms/frCon/index.do?MENU_ID=1830"
			target="_self" style="color: #19a0ff !important">개인정보처리방침</a></li>
		<li><a href="/gimpo/cms/frCon/index.do?MENU_ID=1940"
			target="_self">영상정보처리기기 운영관리방침</a></li>
		<li><a href="/gimpo/cms/frCon/index.do?MENU_ID=2330"
			target="_self">서비스 제휴안내</a></li>
		<li><a href="/gimpo/cms/frCon/index.do?MENU_ID=1840"
			target="_self">이메일무단수집거부</a></li>
		<li><a href="/gimpo/cms/frCon/index.do?MENU_ID=1850"
			target="_self">고객서비스헌장</a></li>

	</ul>
	<div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-6">
          <p>&nbsp;</p>
            <h6>한국공항공사 고객센터 1661-2626</h6>
		  <p>&nbsp;</p>
		<p style="color: #737373; font-size: 14px;">07505 서울시 강서구 하늘길 112(공항동)<br></p>
<!--             <p class="text-justify" >  -->
<!-- 			    <i style="color: #737373; font-size: 14px;">김포공항은 서울의 주요 공항으로, 대한민국 항공 역사의 중요한 역할을 맡고 있습니다.<br>  -->
<!-- 			    국내외 여행객들에게 편리한 교통 허브를 제공하며, 서울과 수도권을 연결하는 빠르고 <br>효율적인 관문입니다.  -->
<!-- 			    다양한 편의 시설과 원활한 교통 접근성으로, 여행객들에게 쾌적한<br> 경험을 선사합니다.</i> -->
<!-- 			</p> -->
          </div>
          <div class="col-xs-6 col-md-3">
            <h6>&nbsp;</h6>
          </div>

          
<!--           <div class="col-xs-6 col-md-3"> -->
<!--             <p>&nbsp;</p> -->
<!--             <h6>Categories</h6> -->
<!--             <ul class="footer-links"> -->
<!--               <li id="a1" class="a">오시는길</li> -->
<!--               <li id="a2" class="a">층별 시설안내</li> -->
<!--               <li id="a3" class="a">공항시설 예약안내</li> -->
<!--               <li id="a4" class="a">항공스케줄조회</li> -->
<!--               <li id="a5" class="a">고객소리함</li> -->
<!--             </ul> -->
<!--           </div> -->

        </div>
        <hr>
      </div>
      <div class="container">
        <p>&nbsp;</p>
        <div class="row">
          <div class="col-md-8 col-sm-6 col-xs-12">
            <p class="copyright-text">Ams &copy; 2020 Korea Airports Corporation. All Rights Reserved.
         <a href="#">amshome</a>.
            </p>
          </div>

<!--           <div class="col-md-4 col-sm-6 col-xs-12"> -->
<!--             <ul class="social-icons"> -->
<!--               <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li> -->
<!--               <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li> -->
<!--               <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li> -->
<!--               <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>    -->
<!--             </ul> -->
<!--           </div> -->
        </div>
      </div>
</footer>
<style>
.site-footer
{
  background-color:#26272b;
  padding:45px 0 20px;
  font-size:15px;
  line-height:24px;
  color:#737373;
}
.site-footer hr
{
  border-top-color:#bbb;
  opacity:0.5
}
.site-footer hr.small
{
  margin:20px 0
}
.site-footer h6
{
  color:#fff;
  font-size:16px;
  text-transform:uppercase;
  margin-top:5px;
  letter-spacing:2px
}
.site-footer a
{
  color:#737373;
}
.site-footer a:hover
{
  color:#3366cc;
  text-decoration:none;
}
.footer-links
{
  padding-left:0;
  list-style:none
}
.footer-links li
{
  display:block
}
.footer-links a
{
  color:#737373
}
.footer-links a:active,.footer-links a:focus,.footer-links a:hover
{
  color:#3366cc;
  text-decoration:none;
}
.footer-links.inline li
{
  display:inline-block
}
.site-footer .social-icons
{
  text-align:right
}
.site-footer .social-icons a
{
  width:40px;
  height:40px;
  line-height:40px;
  margin-left:6px;
  margin-right:0;
  border-radius:100%;
  background-color:#33353d
}
.copyright-text
{
  margin:0
}
@media (max-width:991px)
{
  .site-footer [class^=col-]
  {
    margin-bottom:30px
  }
}
@media (max-width:767px)
{
  .site-footer
  {
    padding-bottom:0
  }
  .site-footer .copyright-text,.site-footer .social-icons
  {
    text-align:center
  }
}
.social-icons
{
  padding-left:0;
  margin-bottom:0;
  list-style:none
}
.social-icons li
{
  display:inline-block;
  margin-bottom:4px
}
.social-icons li.title
{
  margin-right:15px;
  text-transform:uppercase;
  color:#96a2b2;
  font-weight:700;
  font-size:13px
}
.social-icons a{
  background-color:#eceeef;
  color:#818a91;
  font-size:16px;
  display:inline-block;
  line-height:44px;
  width:44px;
  height:44px;
  text-align:center;
  margin-right:8px;
  border-radius:100%;
  -webkit-transition:all .2s linear;
  -o-transition:all .2s linear;
  transition:all .2s linear
}
.social-icons a:active,.social-icons a:focus,.social-icons a:hover
{
  color:#fff;
  background-color:#29aafe
}
.social-icons.size-sm a
{
  line-height:34px;
  height:34px;
  width:34px;
  font-size:14px
}
.social-icons a.facebook:hover
{
  background-color:#3b5998
}
.social-icons a.twitter:hover
{
  background-color:#00aced
}
.social-icons a.linkedin:hover
{
  background-color:#007bb6
}
.social-icons a.dribbble:hover
{
  background-color:#ea4c89
}
@media (max-width:767px)
{
  .social-icons li.title
  {
    display:block;
    margin-right:0;
    font-weight:600
  }
}



</style>

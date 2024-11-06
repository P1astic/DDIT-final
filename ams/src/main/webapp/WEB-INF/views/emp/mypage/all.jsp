<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="go_content go_ehr_attend_personal go_renew" id="content"><div><header class="content_top">
    <h1>
        <span class="txt single_txt">근태현황 </span>
    </h1>
</header>
<div class="content_page">
    <!-- tool bar -->
    <div class="tool_bar calendar_tool_bar">
        <div class="current_date">
            <span class="btn_ic_prev2 btn_border" title="이전" id="prevMonth"><span class="ic_ehr ic_date_prev"></span></span>
            <span class="date" id="baseDate">
                2024.10
            </span>
            <span class="btn_ic_next2 btn_border" title="이후" id="nextMonth"><span class="ic_ehr ic_date_next"></span></span>
            <input id="calendarDatepicker" type="text" style="border:0px;width:0px;height:0px;" class="hasDatepicker">
            <span class="btn_tool"><span class="txt" id="currentMonth">오늘</span></span>
        </div>
    </div>
    <!-- //tool bar -->
    <!-- ehr statistics -->
    <div id="summary"><div class="wrap_statistics"><div class="tool_bar">
    <div class="critical">

        <span class="info_group">
            <span class="tit">(기본근태) B형</span>
            <span class="txt">자유출퇴근</span>
        </span>

        <span class="btn_wrap">
            <span class="ic ic_info btn-toggle-desc" title="근태 설명보기" id="timeline_info">
                <span class="layer_tail tooltip-desc" el-backdrop="" style="display: none" id="timeline_info_desc">
                    <i class="ic ic_tail"></i>
                    <div>
                            hoodemo,&nbsp;handemo<br><br>
                        [그룹 변경 내역]
                        <br> <br>
                         2024-10-01 : 
                                     (기본근태) B형 
                        <br>

                    </div>
                    <div>
                        * 연장/야간&nbsp;근로&nbsp;시,&nbsp;근로시간&nbsp;인정을&nbsp;위해서&nbsp;전자결재를&nbsp;이용할&nbsp;수도&nbsp;있습니다.&nbsp;자세한&nbsp;내용은&nbsp;도움말을&nbsp;참조하세요.<br>
                        * 휴게시간은 총 근무시간에 포함되지 않습니다.<br>
                        * 관리자 설정으로 지정된 시간이며, 설정에 따라  총 근무시간은 상이해질 수 있습니다.<br>
                    </div>
                </span>
            </span>
        </span>
    </div>
    <div class="optional">
        <a class="btn_tool" id="overtime" data-bypass="">
            <span class="ic_toolbar doc"></span>
            <span class="txt">연장근무신청</span>
        </a>
        <a class="btn_tool" id="download" data-bypass="">
            <span class="ic_toolbar download"></span>
            <span class="txt">목록 다운로드</span>
        </a>
    </div>
</div>
<div class="wrap_ehr_data">
    <div class="ehr_stat_data">
        <p class="stat_tit">이번주 누적</p>
        <p class="stat_txt ">0h 0m 0s</p>
    </div>
    <span class="divide_bar"></span>
    <div class="ehr_stat_data">
        <p class="stat_tit">이번주 초과</p>
        <p class="stat_txt">0h 0m 0s</p>
    </div>
    <div class="ehr_stat_data">
        <p class="stat_tit">이번주 잔여</p>
        <p class="stat_txt">40h 0m 0s</p>
    </div>
    <span class="divide_bar"></span>
    <div class="ehr_stat_data month_data">
        <p class="stat_tit">이번달 누적</p>
        <p class="stat_txt">29h 21m 43s</p>
    </div>
    <div class="ehr_stat_data month_data">
        <p class="stat_tit">이번달 연장</p>
        <p class="stat_txt">0h 0m 0s</p>
    </div>

</div>
</div></div>
    <div id="month" class="wrap_tb_list"><div><div><div class="wrap_tb_box" id="week">

    <section class="wrap_tb_tit">
        <h2 class="table_tit"><span class="btn_wrap"><span class="ic_ehr ic_open" id="weekToggle"></span></span>1 주차</h2>
        <div class="tb_optional">
            <span class="txt">누적 근무시간 <strong class="">29h 42m 28s</strong></span>
            <span class="desc">(초과 근무시간 <strong>0h 0m 0s</strong>)</span>
        </div>
    </section>
    <div class="wrap_tb_shadow" id="day_area" style="display: none">
        <div class="tb_attend_header">
            <div class="tb_content date">
                <span class="txt">일자</span>
            </div>
            <div class="tb_content attend">
                <span class="txt">업무시작</span>
            </div>
            <div class="tb_content leave">
                <span class="txt">업무종료</span>
            </div>
            <div class="tb_content total_time">
                <span class="txt">총 근무시간</span>
            </div>
            <div class="tb_content status">
                <span class="txt">근무시간 상세</span>
            </div>
            <div class="tb_content approval_list">
                <span class="txt">승인요청내역</span>
            </div>
        </div>
        <div class="tb_attend_body" id="day_list">
        <div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">30</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">월</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">13:24:51
            <span class="icx2 ip wrap_tool_tip">
                <span class="tool_tip top">

                    <strong>IP :</strong> 203.246.171.20

                </span>
            </span>
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">13:45:43
            <span class="icx2 ip wrap_tool_tip">
                <span class="tool_tip top">

                     <strong>IP :</strong> 39.126.188.28

                </span>
            </span>
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt">0h 20m 44s</span>
    </div>
    <div class="tb_content status">
        기본 0h 20m 44s / 연장 0h 0m 0s / 야간 0h 0m 0s
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">01</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">화</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  modify  ">09:00:00
            <span class="icx2 ip wrap_tool_tip">
                <span class="tool_tip top">

                    <strong>IP :</strong> 211.212.230.143

                </span>
            </span>
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">17:26:08 (+1)
            <span class="icx2 ip wrap_tool_tip">
                <span class="tool_tip top">

                     <strong>IP :</strong> 1.245.228.208

                </span>
            </span>
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt">29h 21m 3s</span>
    </div>
    <div class="tb_content status">
        기본 29h 21m 3s / 연장 0h 0m 0s / 야간 0h 0m 0s
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">02</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">수</span>
    </div>
    <div class="tb_content attend">ㅗ
        <span class="txt  ">17:26:17
            <span class="icx2 ip wrap_tool_tip">
                <span class="tool_tip top">

                    <strong>IP :</strong> 1.245.228.208

                </span>
            </span>
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">17:26:58
            <span class="icx2 ip wrap_tool_tip">
                <span class="tool_tip top">

                     <strong>IP :</strong> 1.245.228.208

                </span>
            </span>
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt">0h 0m 26s</span>
    </div>
    <div class="tb_content status">
        기본 0h 0m 26s / 연장 0h 0m 0s / 야간 0h 0m 0s
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list day_holiday">    <div class="tb_content date_l">
        <span class="txt">03</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">목</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">04</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">금</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">11:14:32
            <span class="icx2 ip wrap_tool_tip">
                <span class="tool_tip top">

                    <strong>IP :</strong> 14.36.141.71

                </span>
            </span>
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">11:14:48
            <span class="icx2 ip wrap_tool_tip">
                <span class="tool_tip top">

                     <strong>IP :</strong> 14.36.141.71

                </span>
            </span>
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt">0h 0m 13s</span>
    </div>
    <div class="tb_content status">
        기본 0h 0m 13s / 연장 0h 0m 0s / 야간 0h 0m 0s
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list day_sat">    <div class="tb_content date_l">
        <span class="txt">05</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">토</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list day_sun">    <div class="tb_content date_l">
        <span class="txt">06</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">일</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div></div>
    </div>
</div></div><div><div class="wrap_tb_box" id="week">

    <section class="wrap_tb_tit">
        <h2 class="table_tit"><span class="btn_wrap"><span class="ic_ehr ic_close" id="weekToggle"></span></span>2 주차</h2>
        <div class="tb_optional">
            <span class="txt">누적 근무시간 <strong class="">0h 0m 0s</strong></span>
            <span class="desc">(초과 근무시간 <strong>0h 0m 0s</strong>)</span>
        </div>
    </section>
    <div class="wrap_tb_shadow" id="day_area" style="">
        <div class="tb_attend_header">
            <div class="tb_content date">
                <span class="txt">일자</span>
            </div>
            <div class="tb_content attend">
                <span class="txt">업무시작</span>
            </div>
            <div class="tb_content leave">
                <span class="txt">업무종료</span>
            </div>
            <div class="tb_content total_time">
                <span class="txt">총 근무시간</span>
            </div>
            <div class="tb_content status">
                <span class="txt">근무시간 상세</span>
            </div>
            <div class="tb_content approval_list">
                <span class="txt">승인요청내역</span>
            </div>
        </div>
        <div class="tb_attend_body" id="day_list">
        <div class="tb_attend_list today tb_attend_select">    <div class="tb_content date_l">
        <span class="txt">07</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">월</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_detail2"><div id="time_zone" class="tb_div tb_head">

<div class="tb_cell workinghours"> <span class="time">00</span> </div><div class="tb_cell"> <span class="time">01</span> </div><div class="tb_cell"> <span class="time">02</span> </div><div class="tb_cell"> <span class="time">03</span> </div><div class="tb_cell"> <span class="time">04</span> </div><div class="tb_cell"> <span class="time">05</span> </div><div class="tb_cell"> <span class="time">06</span> </div><div class="tb_cell"> <span class="time">07</span> </div><div class="tb_cell"> <span class="time">08</span> </div><div class="tb_cell"> <span class="time">09</span> </div><div class="tb_cell"> <span class="time">10</span> </div><div class="tb_cell"> <span class="time">11</span> </div><div class="tb_cell"> <span class="time">12</span> </div><div class="tb_cell"> <span class="time">13</span> </div><div class="tb_cell"> <span class="time">14</span> </div><div class="tb_cell"> <span class="time">15</span> </div><div class="tb_cell"> <span class="time">16</span> </div><div class="tb_cell"> <span class="time">17</span> </div><div class="tb_cell"> <span class="time">18</span> </div><div class="tb_cell"> <span class="time">19</span> </div><div class="tb_cell"> <span class="time">20</span> </div><div class="tb_cell"> <span class="time">21</span> </div><div class="tb_cell"> <span class="time">22</span> </div><div class="tb_cell"> <span class="time">23</span> </div></div>

<div class="wrap_timeline tb_body">
    <!--
        클래스명 설명
        .part_default : 일반 근무 시간
        .part_approval : 승인 근무 시간
        .part_overtime : 초과 근무 시간
        .part_approval.wait : 연장근무 승인대기
        .part_overtime.wait : 초과근무 승인대기
        .start : 시작
        .close : 종료
        .initial : 최초 출근 시(출근 30분 후 클래스 제거), 출/퇴근이 60분 이내에 이루어졌을 경우 적용
    -->
    <div id="data_zone" class="tb_div time_data">
        <div id="clockinout_progress" class="tb_row total_time"></div>
        <div id="approval_progress" class="tb_row total_time"></div>
    </div>


        <!-- 상태 추가 시 row가 한줄씩 추가됨 (상태가 여러개일 경우 레이블이 서로 겹치는 현상을 방지하기 위함)-->
    <div id="time_wrapper" class="tb_div tb_bg" style="height:72px"> <div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min break">
</div><div class="min break">
</div><div class="min break">
</div><div class="min break">
</div><div class="min break">
</div><div class="min break">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div><div class="tb_cell workinghours">
<div class="tb_div">

<div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div><div class="min">
</div></div>
</div></div>
</div>

<!--
<div class="time_tb" id="timeline_list">
</div>
-->
</div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">08</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">화</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list day_holiday">    <div class="tb_content date_l">
        <span class="txt">09</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">수</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">10</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">목</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">11</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">금</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list day_sat">    <div class="tb_content date_l">
        <span class="txt">12</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">토</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list day_sun">    <div class="tb_content date_l">
        <span class="txt">13</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">일</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div></div>
    </div>
</div></div><div><div class="wrap_tb_box" id="week">

    <section class="wrap_tb_tit">
        <h2 class="table_tit"><span class="btn_wrap"><span class="ic_ehr ic_open" id="weekToggle"></span></span>3 주차</h2>
        <div class="tb_optional">
            <span class="txt">누적 근무시간 <strong class="">0h 0m 0s</strong></span>
            <span class="desc">(초과 근무시간 <strong>0h 0m 0s</strong>)</span>
        </div>
    </section>
    <div class="wrap_tb_shadow" id="day_area" style="display: none">
        <div class="tb_attend_header">
            <div class="tb_content date">
                <span class="txt">일자</span>
            </div>
            <div class="tb_content attend">
                <span class="txt">업무시작</span>
            </div>
            <div class="tb_content leave">
                <span class="txt">업무종료</span>
            </div>
            <div class="tb_content total_time">
                <span class="txt">총 근무시간</span>
            </div>
            <div class="tb_content status">
                <span class="txt">근무시간 상세</span>
            </div>
            <div class="tb_content approval_list">
                <span class="txt">승인요청내역</span>
            </div>
        </div>
        <div class="tb_attend_body" id="day_list">
        <div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">14</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">월</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">15</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">화</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">16</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">수</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
        <p>
            <span class="txt"> 완료 (경조 8.00h) </span>
        </p>
    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">17</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">목</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">18</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">금</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list day_sat">    <div class="tb_content date_l">
        <span class="txt">19</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">토</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list day_sun">    <div class="tb_content date_l">
        <span class="txt">20</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">일</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div></div>
    </div>
</div></div><div><div class="wrap_tb_box" id="week">

    <section class="wrap_tb_tit">
        <h2 class="table_tit"><span class="btn_wrap"><span class="ic_ehr ic_open" id="weekToggle"></span></span>4 주차</h2>
        <div class="tb_optional">
            <span class="txt">누적 근무시간 <strong class="">0h 0m 0s</strong></span>
            <span class="desc">(초과 근무시간 <strong>0h 0m 0s</strong>)</span>
        </div>
    </section>
    <div class="wrap_tb_shadow" id="day_area" style="display: none">
        <div class="tb_attend_header">
            <div class="tb_content date">
                <span class="txt">일자</span>
            </div>
            <div class="tb_content attend">
                <span class="txt">업무시작</span>
            </div>
            <div class="tb_content leave">
                <span class="txt">업무종료</span>
            </div>
            <div class="tb_content total_time">
                <span class="txt">총 근무시간</span>
            </div>
            <div class="tb_content status">
                <span class="txt">근무시간 상세</span>
            </div>
            <div class="tb_content approval_list">
                <span class="txt">승인요청내역</span>
            </div>
        </div>
        <div class="tb_attend_body" id="day_list">
        <div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">21</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">월</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">22</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">화</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">23</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">수</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">24</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">목</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">25</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">금</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list day_sat">    <div class="tb_content date_l">
        <span class="txt">26</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">토</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list day_sun">    <div class="tb_content date_l">
        <span class="txt">27</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">일</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div></div>
    </div>
</div></div><div><div class="wrap_tb_box" id="week">

    <section class="wrap_tb_tit">
        <h2 class="table_tit"><span class="btn_wrap"><span class="ic_ehr ic_open" id="weekToggle"></span></span>5 주차</h2>
        <div class="tb_optional">
            <span class="txt">누적 근무시간 <strong class="">0h 0m 0s</strong></span>
            <span class="desc">(초과 근무시간 <strong>0h 0m 0s</strong>)</span>
        </div>
    </section>
    <div class="wrap_tb_shadow" id="day_area" style="display: none">
        <div class="tb_attend_header">
            <div class="tb_content date">
                <span class="txt">일자</span>
            </div>
            <div class="tb_content attend">
                <span class="txt">업무시작</span>
            </div>
            <div class="tb_content leave">
                <span class="txt">업무종료</span>
            </div>
            <div class="tb_content total_time">
                <span class="txt">총 근무시간</span>
            </div>
            <div class="tb_content status">
                <span class="txt">근무시간 상세</span>
            </div>
            <div class="tb_content approval_list">
                <span class="txt">승인요청내역</span>
            </div>
        </div>
        <div class="tb_attend_body" id="day_list">
        <div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">28</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">월</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">29</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">화</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">30</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">수</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">31</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">목</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list">    <div class="tb_content date_l">
        <span class="txt">01</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">금</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list day_sat">    <div class="tb_content date_l">
        <span class="txt">02</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">토</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div><div class="tb_attend_list day_sun">    <div class="tb_content date_l">
        <span class="txt">03</span>
    </div>
    <div class="tb_content date_r">
        <span class="txt">일</span>
    </div>
    <div class="tb_content attend">
        <span class="txt  ">
        </span>
    </div>
    <div class="tb_content leave">
        <span class="txt ">
        </span>
    </div>
    <div class="tb_content total_time">
        <span class="txt"></span>
    </div>
    <div class="tb_content status">
        
    </div>
    <div class="tb_content approval_list">
    </div></div></div>
    </div>
</div></div></div></div>
    <!-- //ehr datatable -->
    <div class="tool_bar tool_absolute wrap_tb_box">
        <div class="critical">
            <section class="marker2">
                <ul>
                    <li class="normal"><span></span>정상</li>
                    <li class="late"><span></span>지각</li>
                    <li class="modify"><span></span>수정</li>
                </ul>
            </section>
        </div>
    </div>
    <div id="history"><div><div class="reply_wrap">
    <header class="single_title">
        <span class="txt">변경이력</span><span class="num">3</span>
    </header>
    <div class="aside_wrapper_body">
        <ul class="type_simple_list simple_list_alarm">

            <li>
                <p data-id="232" style="cursor:pointer" class="photo"><img src="/thumb/user/small/4301-212117" title="김상후" 대표이사="" alt="김상후"><!--외부메일발신자,프로필사진이 없는 발신자 사진 동일--></p>
                <div class="info">
                    <p class="name">김상후 대표이사</p>
                    <span class="date">10-02 17:26</span>
                    <p class="subject">[상태 삭제] 2024-10-02 17:26:23 업무 asdasd</p>
                </div>
            </li>
            <li>
                <p data-id="232" style="cursor:pointer" class="photo"><img src="/thumb/user/small/4301-212117" title="김상후" 대표이사="" alt="김상후"><!--외부메일발신자,프로필사진이 없는 발신자 사진 동일--></p>
                <div class="info">
                    <p class="name">김상후 대표이사</p>
                    <span class="date">10-02 17:26</span>
                    <p class="subject">[상태 삭제] 2024-10-02 17:26:27 외근 asdasd</p>
                </div>
            </li>
            <li>
                <p data-id="232" style="cursor:pointer" class="photo"><img src="/thumb/user/small/4301-212117" title="김상후" 대표이사="" alt="김상후"><!--외부메일발신자,프로필사진이 없는 발신자 사진 동일--></p>
                <div class="info">
                    <p class="name">김상후 대표이사</p>
                    <span class="date">10-01 09:15</span>
                    <p class="subject">[상태 등록] 2024-10-01 09:00:00 출근</p>
                </div>
            </li>

        </ul>
    </div>
</div></div></div>
</div></div></div>

<div id="summary"><div class="wrap_statistics"><div class="tool_bar">
    <div class="critical">

        <span class="info_group">
            <span class="tit">(기본근태) B형</span>
            <span class="txt">자유출퇴근</span>
        </span>

        <span class="btn_wrap">
            <span class="ic ic_info btn-toggle-desc" title="근태 설명보기" id="timeline_info">
                <span class="layer_tail tooltip-desc" el-backdrop="" style="display: none" id="timeline_info_desc">
                    <i class="ic ic_tail"></i>
                    <div>
                            hoodemo,&nbsp;handemo<br><br>
                        [그룹 변경 내역]
                        <br> <br>
                         2024-10-01 : 
                                     (기본근태) B형 
                        <br>

                    </div>
                    <div>
                        * 연장/야간&nbsp;근로&nbsp;시,&nbsp;근로시간&nbsp;인정을&nbsp;위해서&nbsp;전자결재를&nbsp;이용할&nbsp;수도&nbsp;있습니다.&nbsp;자세한&nbsp;내용은&nbsp;도움말을&nbsp;참조하세요.<br>
                        * 휴게시간은 총 근무시간에 포함되지 않습니다.<br>
                        * 관리자 설정으로 지정된 시간이며, 설정에 따라  총 근무시간은 상이해질 수 있습니다.<br>
                    </div>
                </span>
            </span>
        </span>
    </div>
    <div class="optional">
        <a class="btn_tool" id="overtime" data-bypass="">
            <span class="ic_toolbar doc"></span>
            <span class="txt">연장근무신청</span>
        </a>
        <a class="btn_tool" id="download" data-bypass="">
            <span class="ic_toolbar download"></span>
            <span class="txt">목록 다운로드</span>
        </a>
    </div>
</div>
<div class="wrap_ehr_data">
    <div class="ehr_stat_data">
        <p class="stat_tit">이번주 누적</p>
        <p class="stat_txt ">0h 0m 0s</p>
    </div>
    <span class="divide_bar"></span>
    <div class="ehr_stat_data">
        <p class="stat_tit">이번주 초과</p>
        <p class="stat_txt">0h 0m 0s</p>
    </div>
    <div class="ehr_stat_data">
        <p class="stat_tit">이번주 잔여</p>
        <p class="stat_txt">40h 0m 0s</p>
    </div>
    <span class="divide_bar"></span>
    <div class="ehr_stat_data month_data">
        <p class="stat_tit">이번달 누적</p>
        <p class="stat_txt">29h 21m 43s</p>
    </div>
    <div class="ehr_stat_data month_data">
        <p class="stat_tit">이번달 연장</p>
        <p class="stat_txt">0h 0m 0s</p>
    </div>

</div>
</div></div><div id="summary"><div class="wrap_statistics"><div class="tool_bar">
    <div class="critical">

        <span class="info_group">
            <span class="tit">(기본근태) B형</span>
            <span class="txt">자유출퇴근</span>
        </span>

        <span class="btn_wrap">
            <span class="ic ic_info btn-toggle-desc" title="근태 설명보기" id="timeline_info">
                <span class="layer_tail tooltip-desc" el-backdrop="" style="display: none" id="timeline_info_desc">
                    <i class="ic ic_tail"></i>
                    <div>
                            hoodemo,&nbsp;handemo<br><br>
                        [그룹 변경 내역]
                        <br> <br>
                         2024-10-01 : 
                                     (기본근태) B형 
                        <br>

                    </div>
                    <div>
                        * 연장/야간&nbsp;근로&nbsp;시,&nbsp;근로시간&nbsp;인정을&nbsp;위해서&nbsp;전자결재를&nbsp;이용할&nbsp;수도&nbsp;있습니다.&nbsp;자세한&nbsp;내용은&nbsp;도움말을&nbsp;참조하세요.<br>
                        * 휴게시간은 총 근무시간에 포함되지 않습니다.<br>
                        * 관리자 설정으로 지정된 시간이며, 설정에 따라  총 근무시간은 상이해질 수 있습니다.<br>
                    </div>
                </span>
            </span>
        </span>
    </div>
    <div class="optional">
        <a class="btn_tool" id="overtime" data-bypass="">
            <span class="ic_toolbar doc"></span>
            <span class="txt">연장근무신청</span>
        </a>
        <a class="btn_tool" id="download" data-bypass="">
            <span class="ic_toolbar download"></span>
            <span class="txt">목록 다운로드</span>
        </a>
    </div>
</div>
<div class="wrap_ehr_data">
    <div class="ehr_stat_data">
        <p class="stat_tit">이번주 누적</p>
        <p class="stat_txt ">0h 0m 0s</p>
    </div>
    <span class="divide_bar"></span>
    <div class="ehr_stat_data">
        <p class="stat_tit">이번주 초과</p>
        <p class="stat_txt">0h 0m 0s</p>
    </div>
    <div class="ehr_stat_data">
        <p class="stat_tit">이번주 잔여</p>
        <p class="stat_txt">40h 0m 0s</p>
    </div>
    <span class="divide_bar"></span>
    <div class="ehr_stat_data month_data">
        <p class="stat_tit">이번달 누적</p>
        <p class="stat_txt">29h 21m 43s</p>
    </div>
    <div class="ehr_stat_data month_data">
        <p class="stat_tit">이번달 연장</p>
        <p class="stat_txt">0h 0m 0s</p>
    </div>

</div>
</div></div>


<!-- 프로필 -->

<div class="go_popup layer_member_card_type2 ui-draggable" id="gpopupLayer" data-id="5dc3494b-f1b3-496f-a939-11458d9148c3" data-close="false" style="width: 520px; top: 50%; left: 220px; position: fixed; margin: 0px; z-index: 99;" data-layer=""><div class="content"><span id="popupContent"><div style="position:absolute;top:0;left:0;width:100%;display:inline-block;height:100%; cursor: move; z-index: -1" class="handle"></div>

<div class="info_main">
	<span class="ic_profile ic_close" title="닫기" data-type="close" data-bypass=""></span>

	<span class="ic_profile ic_modify" title="수정" data-type="modify" data-bypass=""></span>

	<span class="wrap_photo">
		<img alt="김상후" src="/thumb/user/small/4301-212117" title="김상후">
	</span>
	<div class="wrap_attend_info">
		<a id="timeline_status" class="btn_attend_info ">
			<span class="txt">
				<span class="txt">출근 전</span>
				<span class="ic_profile ic_info"></span>
			</span>
		</a>
		<div id="timeline_message" class="layer_attend_info" style="display: none;">
			<p class="tit">출근 전 입니다.</p>
			<p class="txt">2024-10-07(월)</p>
		</div>
	</div>
	<div class="wrap_list_info">
		<ul class="list_info">
			<li>
				<span class="name">김상후 대표이사</span>
			</li>
			<li>
				<p class="department">
					<span class="txt">다우그룹  </span><span class="ic_v2 ic_profile ic_profile_tooltip" title=""></span>
				</p>
			</li>
			<li>
				<span class="mail">hoodemo@dodemo.com</span>
			</li>
		</ul>
	</div>

	<div class="btn_func">
		<a class="btn_v2_normal btn_v2_mail" data-type="mail" data-bypass="">
			<span class="ic_v2 ic_v2_mail"></span>
			<span class="txt">이메일</span>
		</a>
		<a class="btn_v2_normal btn_v2_calendar" data-type="calendar" data-bypass="">
			<span class="ic_v2 ic_v2_calendar"></span>
			<span class="txt">일정 보기</span>
		</a>
	</div>
</div>
<div class="info_more">
	<ul class="list_info_more">
			<li>
				<span class="tit">회사명</span>
				<span class="data">다우그룹</span>
			</li>
			<li>
				<span class="tit">직책/부서</span>
				<div class="wrap_list_position_team">
				<div>
<ul class="list_position_team">
    <li>
            <p class="position">다우그룹    </p>
            <p class="team"></p>
    </li>
</ul>
</div></div>
			</li>
			<li>
				<span class="tit">직통전화</span>
				<span class="data">070-4451-4584</span>
			</li>
			<li>
				<span class="tit">휴대전화</span>
				<span class="data">010-1234-5678</span>
			</li>
			<li>
				<span class="tit">생일</span>
				<span class="data">2018-03-13</span>
			</li>
	</ul>
</div>
</span></div></div>
<div class="content"><span id="popupContent"><div style="position:absolute;top:0;left:0;width:100%;display:inline-block;height:100%; cursor: move; z-index: -1" class="handle"></div>

<div class="info_main">
	<span class="ic_profile ic_close" title="닫기" data-type="close" data-bypass=""></span>

	<span class="ic_profile ic_modify" title="수정" data-type="modify" data-bypass=""></span>

	<span class="wrap_photo">
		<img alt="김상후" src="/thumb/user/small/4301-212117" title="김상후">
	</span>
	<div class="wrap_attend_info">
		<a id="timeline_status" class="btn_attend_info ">
			<span class="txt">
				<span class="txt">출근 전</span>
				<span class="ic_profile ic_info"></span>
			</span>
		</a>
		<div id="timeline_message" class="layer_attend_info" style="display: none;">
			<p class="tit">출근 전 입니다.</p>
			<p class="txt">2024-10-07(월)</p>
		</div>
	</div>
	<div class="wrap_list_info">
		<ul class="list_info">
			<li>
				<span class="name">김상후 대표이사</span>
			</li>
			<li>
				<p class="department">
					<span class="txt">다우그룹  </span><span class="ic_v2 ic_profile ic_profile_tooltip" title=""></span>
				</p>
			</li>
			<li>
				<span class="mail">hoodemo@dodemo.com</span>
			</li>
		</ul>
	</div>

	<div class="btn_func">
		<a class="btn_v2_normal btn_v2_mail" data-type="mail" data-bypass="">
			<span class="ic_v2 ic_v2_mail"></span>
			<span class="txt">이메일</span>
		</a>
		<a class="btn_v2_normal btn_v2_calendar" data-type="calendar" data-bypass="">
			<span class="ic_v2 ic_v2_calendar"></span>
			<span class="txt">일정 보기</span>
		</a>
	</div>
</div>
<div class="info_more">
	<ul class="list_info_more">
			<li>
				<span class="tit">회사명</span>
				<span class="data">다우그룹</span>
			</li>
			<li>
				<span class="tit">직책/부서</span>
				<div class="wrap_list_position_team">
				<div>
<ul class="list_position_team">
    <li>
            <p class="position">다우그룹    </p>
            <p class="team"></p>
    </li>
</ul>
</div></div>
			</li>
			<li>
				<span class="tit">직통전화</span>
				<span class="data">070-4451-4584</span>
			</li>
			<li>
				<span class="tit">휴대전화</span>
				<span class="data">010-1234-5678</span>
			</li>
			<li>
				<span class="tit">생일</span>
				<span class="data">2018-03-13</span>
			</li>
	</ul>
</div>
</span></div>
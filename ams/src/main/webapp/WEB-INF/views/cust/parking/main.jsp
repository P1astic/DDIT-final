<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link rel="stylesheet" type="text/css"
	href="/resources/css/custUser/v2.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- css모음 -->
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/airport.css"	>
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/board.css"	>
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/common.css"	>
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/jquery-ui.css"	>
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/jquery-ui.theme.css"	>
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/kac_n.css"	>
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/kac.css"	>
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/layout.css"	>
<link rel="stylesheet" type="text/css" href="/resources/css/custUser/GIMPO/slick.css"	>
	
<div id="contents">
	<article>
		<script type="text/javascript">
			var toDate = new Date();
			toDate.setDate(toDate.getDate() + 45);
			var fromYear = toDate.getFullYear();
			var fromMonth = toDate.getMonth() + 1;
			var fromDay = toDate.getDate();
			var toDate = fromYear + "" + fn_setDay(fromMonth) + ""
					+ fn_setDay(fromDay);

			function fn_setDay(val) {
				if (val < 10) {
					val = '0' + val;
				}
				return val;
			}

			$(function() {
				$(".reservation_search .list_calendar>.startCal .selCalender")
						.css({
							"margin-right" : "0px"
						});
				$(".reservation_search .list_calendar>.startCal .selTime").css(
						{
							"margin-right" : "-30px"
						});
				$(".reservation_search .list_calendar>.endCal .selCalender")
						.css({
							"margin-right" : "0px"
						});
				$(".reservation_search .search_optGrp .list_calendar").css({
					"width" : "320px"
				});
				$(".reservation_search .search_optGrp .list_calendar>.cal")
						.css({
							"width" : "100%"
						});
				var SearchOpt = {
					pickAirport : 'PLT-002',
					pickStartDt : null,
					pickEndDt : null,
					pickStartTime : null,
					pickEndTime : null,
					pickType : 'DC001'
				}

				var VisualCaleandar = {
					step : 0,
					pickStartDt : null,
					pickEndDt : null,
					pickStartTime : null,
					pickEndTime : null,
					getDateFormat : function(str, format) {
						if (format == 'yyyy-mm-dd') {
							return String(str).substr(0, 4) + '-'
									+ String(str).substr(4, 2) + '-'
									+ String(str).substr(6, 2);
						} else if (format == 'mmdd(Day)') {
							var stDate = new Date(VisualCaleandar
									.getDateFormat(str, 'yyyy-mm-dd'));
							var day = stDate.getDay();
							if (day == 0)
								day = '일';
							if (day == 1)
								day = '월';
							if (day == 2)
								day = '화';
							if (day == 3)
								day = '수';
							if (day == 4)
								day = '목';
							if (day == 5)
								day = '금';
							if (day == 6)
								day = '토';
							return String(str).substr(4, 2) + '월'
									+ String(str).substr(6, 2) + '일(' + day
									+ ')';
						} else if (format == 'y.m.d(Day)') {
							var stDate = new Date(VisualCaleandar
									.getDateFormat(str, 'yyyy-mm-dd'));
							var day = stDate.getDay();
							if (day == 0)
								day = '일';
							if (day == 1)
								day = '월';
							if (day == 2)
								day = '화';
							if (day == 3)
								day = '수';
							if (day == 4)
								day = '목';
							if (day == 5)
								day = '금';
							if (day == 6)
								day = '토';
							return String(str).substr(0, 4) + '.'
									+ String(str).substr(4, 2) + '.'
									+ String(str).substr(6, 2) + '(' + day
									+ ')';
						}
					},
					setCaleandarData : function() {
						if (SearchOpt.pickStartDt != null) {
							$(
									'.visualSearch.parking .search_date:eq(0) .btn_choice')
									.html(
											'<span class="sort">입차일시</span>'
													+ VisualCaleandar
															.getDateFormat(
																	SearchOpt.pickStartDt,
																	'mmdd(Day)')
													+ ' '
													+ VisualCaleandar.pickStartTime);
						} else {
							$(
									'.visualSearch.parking .search_date:eq(0) .btn_choice')
									.html(
											'<span class="sort">입차일시</span>선택하세요.');
						}
						if (SearchOpt.pickEndDt != null) {
							$(
									'.visualSearch.parking .search_date:eq(1) .btn_choice')
									.html(
											'<span class="sort">출차일시</span>'
													+ VisualCaleandar
															.getDateFormat(
																	SearchOpt.pickEndDt,
																	'mmdd(Day)')
													+ ' '
													+ VisualCaleandar.pickEndTime);
						} else {
							$(
									'.visualSearch.parking .search_date:eq(1) .btn_choice')
									.html(
											'<span class="sort">출차일시</span>선택하세요.');
						}
					},
					setCaleandar : function(step, gbn) {
						var startDate = new Date();
						startDate.setDate(1);
						startDate.setMonth(startDate.getMonth() + step);
						var endDate = new Date();
						endDate.setDate(1);
						endDate.setMonth(endDate.getMonth() + (step));

						VisualCaleandar.drawCaleandar(startDate, 'start');
						VisualCaleandar.drawCaleandar(endDate, 'end');
					},
					drawCaleandar : function(date, gbn) {
						var curDate = new Date();
						var curYear = curDate.getFullYear();
						var curMonth = curDate.getMonth() + 1;
						var curDay = curDate.getDate();

						var year = date.getFullYear();
						var month = (date.getMonth() + 1);

						var strMonth = month;
						if (parseInt(strMonth) < 10)
							strMonth = '0' + strMonth;

						//해당월의 마지막 날
						var lastDay = new Date(year, month, 0).getDate();
						//첫 요일
						var firstDay = new Date(year + '/' + strMonth
								+ '/01 00:00:00').getDay();

						var trObj = '<tr>';
						var totalCnt = 1;
						var tempCnt = 1;

						//첫날까지 빈값
						for (var i = 0; i < firstDay; i++) {
							trObj += '<td class="disabled"></td>';
							totalCnt++;
						}

						var strCalTxt = year + '' + strMonth;

						for (var idx = 0; idx < lastDay; idx++) {

							if ((totalCnt % 7) == 1) {
								trObj += '<tr>';
								if (!(idx == 0 && firstDay == 0)) {
									tempCnt++;
								}
							}

							if (year == curYear && month == curMonth
									&& (idx + 1) < curDay)
								trObj += '<td class="disabled" title="선택불가">';
							else if (year == curYear && month < curMonth)
								trObj += '<td class="disabled" title="선택불가">';
							else if (year < curYear)
								trObj += '<td class="disabled" title="선택불가">';
							else
								trObj += '<td>';

							var strDate = (idx + 1);
							if (parseInt(strDate) < 10)
								strDate = '0' + strDate;
							strDate = strCalTxt + '' + strDate;

							trObj += '<div class="dayBox">';
							trObj += '<button name="day_'
									+ (idx + 1)
									+ '" class="dateNum" type="button" data-day="'
									+ strDate + '">' + (idx + 1) + '</button>';
							trObj += '</div>';
							trObj += '</td>';

							if ((totalCnt % 7) == 0)
								trObj += '</tr>';
							totalCnt++;
						}

						if (tempCnt < 6) {
							trObj += '<tr><td><div class="dayBox"><button disabled="disabled" style="cursor:default;color:white !important;background:white !important;">X</button></div></td></tr>';
						}

						if (gbn == 'start') {
							$(
									".reservation_search .search_optGrp .list_calendar .startCal .date b")
									.text(year + '.' + strMonth);
							$(
									'.reservation_search .search_optGrp .list_calendar .startCal .reserve_tb tbody')
									.empty();
							$(trObj)
									.appendTo(
											$('.reservation_search .search_optGrp .list_calendar .startCal .reserve_tb tbody'));
							$(
									'.reservation_search .search_optGrp .list_calendar .startCal .reserve_tb tbody tr')
									.each(
											function() {
												$(this).find('td:eq(0)')
														.addClass('daySun');
											});
						} else {
							$(
									".reservation_search .search_optGrp .list_calendar .endCal .date b")
									.text(year + '.' + strMonth);
							$(
									'.reservation_search .search_optGrp .list_calendar .endCal .reserve_tb tbody')
									.empty();
							$(trObj)
									.appendTo(
											$('.reservation_search .search_optGrp .list_calendar .endCal .reserve_tb tbody'));
							$(
									'.reservation_search .search_optGrp .list_calendar .endCal .reserve_tb tbody tr')
									.each(
											function() {
												$(this).find('td:eq(0)')
														.addClass('daySun');
											});
						}
					},
					betweenOnDate : function() {
						//$('.reservation_search .search_optGrp .list_calendar tbody td').removeClass('on');

						/* $('.reservation_search .search_optGrp .list_calendar tbody td').each(function(){
							var thisDay = $(this).find('button').data('day');
							if(parseInt(VisualCaleandar.pickStartDt) <= parseInt(thisDay) && parseInt(VisualCaleandar.pickEndDt) >= parseInt(thisDay)){
								$(this).addClass('on');
							}
						}); */
					}
				}

				VisualCaleandar.setCaleandar(VisualCaleandar.step);

				$(document)
						.on(
								'click',
								'.reservation_search .search_optGrp .list_calendar .btn_prev',
								function() {
									VisualCaleandar.step = VisualCaleandar.step - 1;
									VisualCaleandar
											.setCaleandar(VisualCaleandar.step);
									if (VisualCaleandar.pickStartDt != null)
										$(
												'.reservation_search .search_optGrp .list_calendar tbody td button[data-day='
														+ VisualCaleandar.pickStartDt
														+ ']').parents('td')
												.addClass('startPick')
												.addClass('on');
									if (VisualCaleandar.pickEndDt != null)
										$(
												'.reservation_search .search_optGrp .list_calendar tbody td button[data-day='
														+ VisualCaleandar.pickEndDt
														+ ']').parents('td')
												.addClass('endPick').addClass(
														'on');
									VisualCaleandar.betweenOnDate();
								});
				$(document)
						.on(
								'click',
								'.reservation_search .search_optGrp .list_calendar .btn_next',
								function() {
									VisualCaleandar.step = (VisualCaleandar.step + 1);
									VisualCaleandar
											.setCaleandar(VisualCaleandar.step);
									if (VisualCaleandar.pickStartDt != null)
										$(
												'.reservation_search .search_optGrp .list_calendar tbody td button[data-day='
														+ VisualCaleandar.pickStartDt
														+ ']').parents('td')
												.addClass('startPick')
												.addClass('on');
									if (VisualCaleandar.pickEndDt != null)
										$(
												'.reservation_search .search_optGrp .list_calendar tbody td button[data-day='
														+ VisualCaleandar.pickEndDt
														+ ']').parents('td')
												.addClass('endPick').addClass(
														'on');
									VisualCaleandar.betweenOnDate();
								});

				$(document)
						.on(
								'click',
								'.reservation_search .search_optGrp .list_calendar tbody td:not(.disabled)',
								function() {
									//var onLength = $('.reservation_search .search_optGrp .list_calendar tbody td.on').length;
									var thisDay = $(this).find('button').data(
											'day');

									/* var onLength = 0;
									if(VisualCaleandar.pickStartDt) onLength++;
									if(VisualCaleandar.pickEndDt) onLength++;
									
									if(onLength == 1){
										if(parseInt(thisDay) < parseInt(VisualCaleandar.pickStartDt)){
											$('.reservation_search .search_optGrp .list_calendar tbody td').removeClass('on').removeClass('startPick').removeClass('endPick');
											$(this).addClass('startPick').addClass('on');
											VisualCaleandar.pickStartDt = thisDay;
											VisualCaleandar.pickEndDt = null;
										}else{
											$(this).addClass('endPick').addClass('on');
											VisualCaleandar.pickEndDt = thisDay;
											//사이값 전부 on처리
											VisualCaleandar.betweenOnDate();
										}
									}else{
										$('.reservation_search .search_optGrp .list_calendar tbody td').removeClass('on').removeClass('startPick').removeClass('endPick');
										$(this).addClass('startPick').addClass('on');
										VisualCaleandar.pickStartDt = thisDay;
										VisualCaleandar.pickEndDt = null;
									} */
									if ($("#search_frDate").hasClass('on')) {
										$(
												'.reservation_search .search_optGrp .list_calendar .startCal tbody td')
												.removeClass('on').removeClass(
														'startPick');
										$(this).addClass('startPick').addClass(
												'on');
										VisualCaleandar.pickStartDt = thisDay;
									} else {
										$(
												'.reservation_search .search_optGrp .list_calendar .endCal tbody td')
												.removeClass('on').removeClass(
														'endPick');
										$(this).addClass('endPick').addClass(
												'on');
										VisualCaleandar.pickEndDt = thisDay;
									}
								});

				$(document)
						.on(
								'click',
								'.btnRedA',
								function() {
									//세팅
									VisualCaleandar.pickStartTime = $(
											'input[name=pStartTime]')
											.val();
									VisualCaleandar.pickEndTime = $(
											'input[name=pEndTime]').val();
									if ($("#search_frDate").hasClass('on')) {
										SearchOpt.pickStartDt = VisualCaleandar.pickStartDt;
										SearchOpt.pickStartTime = VisualCaleandar.pickStartTime;
									} else {
										SearchOpt.pickEndDt = VisualCaleandar.pickEndDt;
										SearchOpt.pickEndTime = VisualCaleandar.pickEndTime;
									}

									VisualCaleandar.setCaleandarData();
									$(".reservation_search .search_date button")
											.parent().parent()
											.removeClass('on');
									$(
											".reservation_search .search_optGrp .list_calendar")
											.removeClass('on');
									$(".ct_reservation .search_optGrp")
											.removeClass('on');
								});
				$(document)
						.on(
								'click',
								'.btnGray',
								function() {
									$(".reservation_search .search_date button")
											.parent().parent()
											.removeClass('on');
									$(
											".reservation_search .search_optGrp .list_calendar")
											.removeClass('on');
									$(".ct_reservation .search_optGrp")
											.removeClass('on');
								});

				//공항선택
				$(document)
						.on(
								'click',
								'.search_optGrp .list_loc .list li',
								function() {
									$('.search_optGrp .list_loc .list li')
											.removeClass('on');
									$(this).addClass('on');

									SearchOpt.pickAirport = $(this)
											.data('idno');
									$(
											".reservation_search .search_loc button.btn_choice")
											.html(
													'<span class="sort">공항선택</span>'
															+ $(this).find(
																	'button')
																	.text());
									$('.mVisualSearch .mAirport span').text(
											$(this).find('button').text());
									$(
											".reservation_search .search_optGrp .list_loc")
											.removeClass('on');
									$(".ct_reservation .search_optGrp")
											.removeClass('on');
								});
				$(document)
						.on(
								'click',
								'.search_optGrp .list_car .list li',
								function() {
									$('.search_optGrp .list_car .list li')
											.removeClass('on');
									$(this).addClass('on');

									SearchOpt.pickType = $(this).data('val');
									$(
											".reservation_search .search_etc button.btn_choice")
											.html(
													'<span class="sort">차량선택</span>'
															+ $(this).find(
																	'button')
																	.text());
									$(
											".reservation_search .parking .search_optGrp .list_car")
											.removeClass('on');
									$(".ct_reservation .search_optGrp")
											.removeClass('on');
								});

				$(document)
						.on(
								'click',
								'.visualSearch .btn_search',
								function() {

									//     	SearchOpt.pickStartDt = VisualCaleandar.pickStartDt;
									//     	SearchOpt.pickEndDt = VisualCaleandar.pickEndDt;
									//     	SearchOpt.pickStartTime = VisualCaleandar.pickStartTime;
									//     	SearchOpt.pickEndTime = VisualCaleandar.pickEndTime;

									//예약
									if (SearchOpt.pickAirport == null) {
										alert('공항을 선택하세요.');
										return;
									}
									if (SearchOpt.pickStartDt == null) {
										alert('입차일시를 선택하세요.');
										return;
									}
									if (SearchOpt.pickEndDt == null) {
										alert('출차일시를 선택하세요.');
										return;
									}
									if (SearchOpt.pickStartTime == null) {
										alert('입차시간을 선택하세요.');
										return;
									}
									if (SearchOpt.pickEndTime == null) {
										alert('출차시간을 선택하세요.');
										return;
									}
									if (SearchOpt.pickStartDt > toDate) {
										alert('입차일시는 현재일로부터 45일 이전까지만 선택 가능합니다.');
										return;
									}
									if (SearchOpt.pickStartDt
											+ SearchOpt.pickStartTime >= SearchOpt.pickEndDt
											+ SearchOpt.pickEndTime) {
										alert('입차일시는 출차일시보다 빨라야 합니다.');
										return;
									}
									if (SearchOpt.pickType == null) {
										alert('차량을 선택하세요.');
										return;
									}

									var iLot = 2;

									if (SearchOpt.pickAirport == "PLT-002") {
										iLot = 2;
									} else if (SearchOpt.pickAirport == "PLT-003") {
										iLot = 14;
									} else if (SearchOpt.pickAirport == "PLT-005") {
										iLot = 34;
									} else {
										iLot = 2;
									}

									var url = '/cust/parking/regist2';
									url += '?prkRsvtCarType='
											+ SearchOpt.pickAirport;
									url += '?parkingDivCd='
											+ SearchOpt.pickAirport;
// 									url += '&phone='
// 											+ phone;
									url += '&prkEntvhclTm='
											+ VisualCaleandar.getDateFormat(
													SearchOpt.pickStartDt,
													'yyyy-mm-dd') + ' '
											+ SearchOpt.pickStartTime + ":00";
									url += '&prkLvvhclTm='
											+ VisualCaleandar.getDateFormat(
													SearchOpt.pickEndDt,
													'yyyy-mm-dd') + ' '
											+ SearchOpt.pickEndTime + ":00";
								

					
									$(this).attr("href", url);

								});
			});
		</script>
		<div class="siteGoing parking">
			<div class="ct_reservation">


			
<!-- 				timepicker -->
<!-- 				<script src="/type/common/js/timepicker/jquery.timepicker.min.js"></script> -->
				<!-- timepicker -->
				<script>
					$(function() {
						/* 검색창 노출 */
						function vSearch() {
							$(".reservation_search").addClass('on');
							$(".reservation_search .visualTit").addClass('on');

							/* 개별 */
							$(".reservation_search .visualSearch.parking")
									.addClass('on'); /*200910 추가*/
							$(
									".reservation_search .visualSearch.parking>.btn_search")
									.text("예약");
						}

						function searchOptGrp_reset() {
							$(
									".reservation_search .visualSearch .search_date .locGrp")
									.removeClass('on');
							$(".reservation_search .search_optGrp>div")
									.removeClass('on');
							$(".reservation_search .search_optGrp>div>div")
									.removeClass('on');
						}

						/* 공항(지역) 옵션 선택 */
						$(".reservation_search .search_loc button")
								.click(
										function() {
											if (window.innerWidth >= 1041) {
												if ($(
														".reservation_search .search_optGrp .list_loc")
														.hasClass('on')) {
													$(
															".reservation_search .search_optGrp .list_loc")
															.removeClass('on');
												} else {
													searchOptGrp_reset();
													$(
															".reservation_search .search_optGrp .list_loc")
															.addClass('on');
												}
											} else {
												$("#header")
														.css("z-index", "2");
												$("#snb_nav").css("z-index",
														"2"); /*200915수정*/
												$(
														".airTicket_search .searchResultZone")
														.hide();
												$(
														".ct_reservation .search_optGrp")
														.addClass('on');
												$(
														".ct_reservation .reservation_search .search_optGrp .list_loc")
														.addClass('on');
											}
										});

						/* 캘린더 옵션 선택 */
						$(".reservation_search .search_date button")
								.click(
										function() {
											if (window.innerWidth >= 1041) {
												if ($(this).parent().parent()
														.hasClass('on')) {
													$(
															".reservation_search .search_optGrp .list_calendar .startCal")
															.show();
													$(
															".reservation_search .search_optGrp .list_calendar .endCal")
															.show();
													$(
															".reservation_search .search_date button")
															.parent().parent()
															.removeClass('on');
													$(
															".reservation_search .search_optGrp .list_calendar")
															.removeClass('on');
												} else {
													searchOptGrp_reset();
													$(this).parent().parent()
															.addClass('on');
													$(
															".reservation_search .search_optGrp .list_calendar")
															.addClass('on');
													if ($(this).parent()
															.parent()
															.attr('id') == "search_frDate") {
														$(
																".reservation_search .search_optGrp .list_calendar .startCal")
																.show();
														$(
																".reservation_search .search_optGrp .list_calendar .endCal")
																.hide();
														$("#search_frDate")
																.addClass('on');
														$("#search_toDate")
																.removeClass(
																		'on');
														$(
																".reservation_search .search_optGrp .list_calendar")
																.css(
																		{
																			"left" : "25%"
																		});
													} else {
														$(
																".reservation_search .search_optGrp .list_calendar .startCal")
																.hide();
														$(
																".reservation_search .search_optGrp .list_calendar .endCal")
																.css(
																		{
																			"width" : "110%",
																			"margin-left" : "-31px"
																		});
														$(
																".reservation_search .search_optGrp .list_calendar .endCal")
																.show();
														$("#search_frDate")
																.removeClass(
																		'on');
														$("#search_toDate")
																.addClass('on');
														$(
																".reservation_search .search_optGrp .list_calendar")
																.css(
																		{
																			"left" : "50%"
																		});
													}
												}
											} else {
												$("#header")
														.css("z-index", "2");
												$("#snb_nav").css("z-index",
														"2"); /*200915수정*/
												$(
														".airTicket_search .searchResultZone")
														.hide();
												$(
														".ct_reservation .search_optGrp")
														.addClass('on');
												$(
														".ct_reservation .reservation_search .search_optGrp .list_calendar")
														.addClass('on');
												$(
														".reservation_search .search_optGrp .list_calendar .endCal")
														.css(
																{
																	"margin-left" : "0px"
																});
												if ($(this).parent().parent()
														.hasClass('on')) {
													$(
															".reservation_search .search_optGrp .list_calendar .startCal")
															.show();
													$(
															".reservation_search .search_optGrp .list_calendar .endCal")
															.show();
													$(
															".reservation_search .search_date button")
															.parent().parent()
															.removeClass('on');
													$(
															".reservation_search .search_optGrp .list_calendar")
															.removeClass('on');
												} else {
													searchOptGrp_reset();
													$(this).parent().parent()
															.addClass('on');
													$(
															".reservation_search .search_optGrp .list_calendar")
															.addClass('on');
													if ($(this).parent()
															.parent()
															.attr('id') == "search_frDate") {
														$(
																".reservation_search .search_optGrp .list_calendar .startCal")
																.show();
														$(
																".reservation_search .search_optGrp .list_calendar .endCal")
																.hide();
														$("#search_frDate")
																.addClass('on');
														$("#search_toDate")
																.removeClass(
																		'on');
														$(
																".reservation_search .search_optGrp .list_calendar")
																.css(
																		{
																			"left" : "25%"
																		});
														$(
																".reservation_search .list_calendar>.startCal .selTime")
																.css(
																		{
																			"margin-right" : "0px"
																		});
													} else {
														$(
																".reservation_search .search_optGrp .list_calendar .startCal")
																.hide();
														$(
																".reservation_search .search_optGrp .list_calendar .endCal")
																.css(
																		{
																			"width" : "100%",
																			"margin-left" : "0px"
																		});
														$(
																".reservation_search .search_optGrp .list_calendar .endCal")
																.show();
														$("#search_frDate")
																.removeClass(
																		'on');
														$("#search_toDate")
																.addClass('on');
														$(
																".reservation_search .search_optGrp .list_calendar")
																.css(
																		{
																			"left" : "50%"
																		});
														$(
																".reservation_search .list_calendar>.endCal .selTime")
																.css(
																		{
																			"width" : ""
																		});
													}
												}
											}
										});

						/* 기타 옵션 선택 */
						$(".reservation_search .parking .search_etc button")
								.click(
										function() {
											if (window.innerWidth >= 1041) {
												if ($(
														".reservation_search .parking .search_optGrp .list_car")
														.hasClass('on')) {
													$(
															".reservation_search .parking .search_optGrp .list_car")
															.removeClass('on');
												} else {
													searchOptGrp_reset();
													$(
															".reservation_search .parking .search_optGrp .list_car")
															.addClass('on');
												}
											} else {
												$("#header")
														.css("z-index", "2");
												$("#snb_nav").css("z-index",
														"2"); /*200915수정*/
												$(
														".airTicket_search .searchResultZone")
														.hide();
												$(
														".ct_reservation .search_optGrp")
														.addClass('on');
												$(
														".ct_reservation .reservation_search .parking .search_optGrp .list_car")
														.addClass('on');
											}
										});

						/* 모바일 검색 옵션 */
						$(".search_optGrp .mBtn_searchPop_close")
								.click(
										function() {
											$(".ct_reservation .search_optGrp")
													.removeClass('on');
											$(
													".ct_reservation .search_optGrp>div")
													.removeClass('on');
											$("#header").css("z-index", "");
											$("#snb_nav").css("z-index", ""); /*200915수정*/
											$(
													".airTicket_search .searchResultZone")
													.show();

											$(
													".reservation_search .search_date button")
													.parent().parent()
													.removeClass('on');
											$(
													".reservation_search .search_optGrp .list_calendar")
													.removeClass('on');
											$(".ct_reservation .search_optGrp")
													.removeClass('on');
										});

						$(window).bind('load resize', function() {
							vSearch();/*예약검색 반응형 대응*/
						});

						var today = new Date();
						var tHours = today.getHours() + 1;
						if (tHours >= 24) {
							tHours = 0;
						}
						if (tHours < 10) {
							tHours = "0" + tHours;
						}
						tHours = tHours + ":00";

						$('.timepicker.time03_1').timepicker({
							timeFormat : 'HH:mm',
							interval : 10,
							minTime : '0',
							maxTime : '23:50',
							defaultTime : tHours,
							startTime : '00:00',
							dynamic : false,
							dropdown : true,
							scrollbar : true
						});
						$('.timepicker.time03_2').timepicker({
							timeFormat : 'HH:mm',
							interval : 10,
							minTime : '00',
							maxTime : '23:50',
							defaultTime : '00',
							startTime : '00:00',
							dynamic : false,
							dropdown : true,
							scrollbar : true
						});

					});
				</script>

				<div class="reservation_search on">
					<div class="searchWrap">
						<strong class="visualTit on"></strong>
						<div class="visualSearch parking on">
							<div class="search_loc">
								<button type="button" class="btn_first">공항선택</button>
								<button type="button" class="btn_choice on">
									<span class="sort">공항선택</span>DDIT국제공항
								</button>
							</div>
							<div class="search_date" id="search_frDate">
								<div>
									<button type="button" class="btn_first">입차일시</button>
									<button type="button" class="btn_choice on">
										<span class="sort">입차일시</span>선택하세요.
									</button>
								</div>
							</div>
							<div class="search_date" id="search_toDate">
								<div>
									<button type="button" class="btn_first">출차일시</button>
									<button type="button" class="btn_choice on">
										<span class="sort">출차일시</span>선택하세요.
									</button>
								</div>
							</div>
							<div class="search_etc">
								<div>
									<button type="button" class="btn_first">차량선택</button>
									<button type="button" class="btn_choice on">
										<span class="sort">차량선택</span>일반
									</button>
								</div>
							</div>
							<!-- <button type="button" class="btn_search">검색</button> -->
							<a href="javascript:void(0);" target="_blank" class="btn_search">예약</a>
							<!-- 옵션-->
							<div class="search_optGrp parking_search_optGrp">
								<div class="list_loc">
									<strong class="mOpt_tit">공항 선택</strong>
									<ul class="list">
										<li class="on" data-idno="PLT-002"><button type="button">DDIT국제공항</button></li>
										<li data-idno="PLT-003"><button type="button">김해국제공항</button></li>
										<!-- 						<li data-idno="PLT-005"><button type="button">대구국제공항</button></li> -->
									</ul>
									<button type="button" class="mBtn_searchPop_close">팝업
										닫기</button>
								</div>
								<div class="list_calendar" style="width: 320px;">
									<strong class="mOpt_tit">기간 선택</strong>
									<div class="cal startCal" style="width: 100%;">
										<div class="selCalender" style="margin-right: 0px;">
											<div class="date">
												<button type="button" class="btn_prev">이전 월</button>
												<b>2024.10</b>
												<button type="button" class="btn_next">다음 월</button>
											</div>
											<div class="reserve_tb">
												<table>
													<caption>
														<p>일자 순으로 날짜를 서비스 예약 날짜를 선택할 수 있는 표</p>
													</caption>
													<colgroup>
														<col>
														<col>
														<col>
														<col>
														<col>
														<col>
														<col>
													</colgroup>
													<thead>
														<tr>
															<th>일</th>
															<th>월</th>
															<th>화</th>
															<th>수</th>
															<th>목</th>
															<th>금</th>
															<th>토</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="disabled daySun"></td>
															<td class="disabled"></td>
															<td class="disabled" title="선택불가"><div
																	class="dayBox">
																	<button name="day_1" class="dateNum" type="button"
																		data-day="20241001">1</button>
																</div></td>
															<td class="disabled" title="선택불가"><div
																	class="dayBox">
																	<button name="day_2" class="dateNum" type="button"
																		data-day="20241002">2</button>
																</div></td>
															<td class="disabled" title="선택불가"><div
																	class="dayBox">
																	<button name="day_3" class="dateNum" type="button"
																		data-day="20241003">3</button>
																</div></td>
															<td class="disabled" title="선택불가"><div
																	class="dayBox">
																	<button name="day_4" class="dateNum" type="button"
																		data-day="20241004">4</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_5" class="dateNum" type="button"
																		data-day="20241005">5</button>
																</div></td>
														</tr>
														<tr>
															<td class="daySun"><div class="dayBox">
																	<button name="day_6" class="dateNum" type="button"
																		data-day="20241006">6</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_7" class="dateNum" type="button"
																		data-day="20241007">7</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_8" class="dateNum" type="button"
																		data-day="20241008">8</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_9" class="dateNum" type="button"
																		data-day="20241009">9</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_10" class="dateNum" type="button"
																		data-day="20241010">10</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_11" class="dateNum" type="button"
																		data-day="20241011">11</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_12" class="dateNum" type="button"
																		data-day="20241012">12</button>
																</div></td>
														</tr>
														<tr>
															<td class="daySun"><div class="dayBox">
																	<button name="day_13" class="dateNum" type="button"
																		data-day="20241013">13</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_14" class="dateNum" type="button"
																		data-day="20241014">14</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_15" class="dateNum" type="button"
																		data-day="20241015">15</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_16" class="dateNum" type="button"
																		data-day="20241016">16</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_17" class="dateNum" type="button"
																		data-day="20241017">17</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_18" class="dateNum" type="button"
																		data-day="20241018">18</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_19" class="dateNum" type="button"
																		data-day="20241019">19</button>
																</div></td>
														</tr>
														<tr>
															<td class="daySun"><div class="dayBox">
																	<button name="day_20" class="dateNum" type="button"
																		data-day="20241020">20</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_21" class="dateNum" type="button"
																		data-day="20241021">21</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_22" class="dateNum" type="button"
																		data-day="20241022">22</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_23" class="dateNum" type="button"
																		data-day="20241023">23</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_24" class="dateNum" type="button"
																		data-day="20241024">24</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_25" class="dateNum" type="button"
																		data-day="20241025">25</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_26" class="dateNum" type="button"
																		data-day="20241026">26</button>
																</div></td>
														</tr>
														<tr>
															<td class="daySun"><div class="dayBox">
																	<button name="day_27" class="dateNum" type="button"
																		data-day="20241027">27</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_28" class="dateNum" type="button"
																		data-day="20241028">28</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_29" class="dateNum" type="button"
																		data-day="20241029">29</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_30" class="dateNum" type="button"
																		data-day="20241030">30</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_31" class="dateNum" type="button"
																		data-day="20241031">31</button>
																</div></td>
														</tr>
														<tr>
															<td class="daySun"><div class="dayBox">
																	<button disabled="disabled"
																		style="cursor: default; color: white !important; background: white !important;">X</button>
																</div></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="selTime" style="margin-right: -30px;">
											<b>입차시간</b>
											<input type="time"	class="inp_t timepicker time03_1" name="pStartTime"
												id="timepicker03_1" title="시간 입력" style="width: 50%;">
										</div>
									</div>
									<div class="cal endCal" style="width: 100%;">
										<div class="selCalender" style="margin-right: 0px;">
											<div class="date">
												<button type="button" class="btn_prev">이전 월</button>
												<b>2024.10</b>
												<button type="button" class="btn_next">다음 월</button>
											</div>
											<div class="reserve_tb">
												<table>
													<caption>
														<p>일자 순으로 날짜를 서비스 예약 날짜를 선택할 수 있는 표</p>
													</caption>
													<colgroup>
														<col>
														<col>
														<col>
														<col>
														<col>
														<col>
														<col>
													</colgroup>
													<thead>
														<tr>
															<th>일</th>
															<th>월</th>
															<th>화</th>
															<th>수</th>
															<th>목</th>
															<th>금</th>
															<th>토</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="disabled daySun"></td>
															<td class="disabled"></td>
															<td class="disabled" title="선택불가"><div
																	class="dayBox">
																	<button name="day_1" class="dateNum" type="button"
																		data-day="20241001">1</button>
																</div></td>
															<td class="disabled" title="선택불가"><div
																	class="dayBox">
																	<button name="day_2" class="dateNum" type="button"
																		data-day="20241002">2</button>
																</div></td>
															<td class="disabled" title="선택불가"><div
																	class="dayBox">
																	<button name="day_3" class="dateNum" type="button"
																		data-day="20241003">3</button>
																</div></td>
															<td class="disabled" title="선택불가"><div
																	class="dayBox">
																	<button name="day_4" class="dateNum" type="button"
																		data-day="20241004">4</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_5" class="dateNum" type="button"
																		data-day="20241005">5</button>
																</div></td>
														</tr>
														<tr>
															<td class="daySun"><div class="dayBox">
																	<button name="day_6" class="dateNum" type="button"
																		data-day="20241006">6</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_7" class="dateNum" type="button"
																		data-day="20241007">7</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_8" class="dateNum" type="button"
																		data-day="20241008">8</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_9" class="dateNum" type="button"
																		data-day="20241009">9</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_10" class="dateNum" type="button"
																		data-day="20241010">10</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_11" class="dateNum" type="button"
																		data-day="20241011">11</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_12" class="dateNum" type="button"
																		data-day="20241012">12</button>
																</div></td>
														</tr>
														<tr>
															<td class="daySun"><div class="dayBox">
																	<button name="day_13" class="dateNum" type="button"
																		data-day="20241013">13</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_14" class="dateNum" type="button"
																		data-day="20241014">14</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_15" class="dateNum" type="button"
																		data-day="20241015">15</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_16" class="dateNum" type="button"
																		data-day="20241016">16</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_17" class="dateNum" type="button"
																		data-day="20241017">17</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_18" class="dateNum" type="button"
																		data-day="20241018">18</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_19" class="dateNum" type="button"
																		data-day="20241019">19</button>
																</div></td>
														</tr>
														<tr>
															<td class="daySun"><div class="dayBox">
																	<button name="day_20" class="dateNum" type="button"
																		data-day="20241020">20</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_21" class="dateNum" type="button"
																		data-day="20241021">21</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_22" class="dateNum" type="button"
																		data-day="20241022">22</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_23" class="dateNum" type="button"
																		data-day="20241023">23</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_24" class="dateNum" type="button"
																		data-day="20241024">24</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_25" class="dateNum" type="button"
																		data-day="20241025">25</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_26" class="dateNum" type="button"
																		data-day="20241026">26</button>
																</div></td>
														</tr>
														<tr>
															<td class="daySun"><div class="dayBox">
																	<button name="day_27" class="dateNum" type="button"
																		data-day="20241027">27</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_28" class="dateNum" type="button"
																		data-day="20241028">28</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_29" class="dateNum" type="button"
																		data-day="20241029">29</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_30" class="dateNum" type="button"
																		data-day="20241030">30</button>
																</div></td>
															<td><div class="dayBox">
																	<button name="day_31" class="dateNum" type="button"
																		data-day="20241031">31</button>
																</div></td>
														</tr>
														<tr>
															<td class="daySun"><div class="dayBox">
																	<button disabled="disabled"
																		style="cursor: default; color: white !important; background: white !important;">X</button>
																</div></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="selTime">
											<b>출차시간</b> <input type="time"
												class="inp_t timepicker time03_2" name="pEndTime"
												id="timepicker03_2" title="시간 입력" style="width: 50%;">
										</div>
									</div>
									<div class="btn">
										<a href="#none" class="btnC_s btnGray"><span>취소</span></a> <a
											href="#none" class="btnC_s btnRedA"><span>선택</span></a>
									</div>
									<button type="button" class="mBtn_searchPop_close">팝업
										닫기</button>
								</div>
								<div class="list_car">
									<strong class="mOpt_tit">차량 선택</strong>
									<ul class="list">
										<li class="on" data-val="DC001"><button type="button">일반</button></li>
										<li data-val="DC002"><button type="button">장애인</button></li>
									</ul>
									<button type="button" class="mBtn_searchPop_close">팝업
										닫기</button>
								</div>
							</div>
							<!-- //옵션 -->

							<!-- 			<p class="search_info"> -->
							<!-- 				<span class="exClam">대여지점과 반납지점이 상이할 경우 별도의 수수료가 부과됩니다.</span> -->
							<!-- 			</p> -->
						</div>

						<div class="mVisualSearch parking">
							<strong class="mAirport"> <span>김포국제공항</span>
							</strong>
							<ul class="mInfo">
								<li class="mDate">선택하세요.</li>
								<li class="mEtc">일반</li>
							</ul>
							<button type="button" class="btn_reSearch">재검색</button>
							<p class="search_info">
								<span class="exClam">대여지점과 반납지점이 상이할 경우 별도의 수수료가 부과됩니다.</span>
							</p>
						</div>
						<!-- //주차 -->
					</div>
					<button type="button" class="mVisualSearch_close">닫기</button>
				</div>
			</div>
			<div class="siteGoingInner">
				<div class="goingTIt">주차 예약 서비스 사이트로 이동합니다.</div>
				<div class="goingTxt">
					예약 일정과 차량 정보(일반 차량/장애인 차량)를 선택하면 주차 예약 시스템 사이트로 이동하여 예약을 진행합니다.<br>
					
				</div>
			</div>
			<c:if test="${phone == null}">
			<div class="btnArea">	
				<a
					href="/cust/validation/custPass?link=parking"
					target="_blank" class="btnC"><span>예약변경/조회/취소</span></a>
			</div>
			</c:if>
			
		</div>








	</article>
</div>
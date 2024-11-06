<article>
	            




<script type="text/javascript">
console.log("0");
$(function() {
	$("input:radio[name=scores]").click(function() {
		switch ($(this)[0].id) {
		case "lv1":
		case "lv2":
		case "lv3": $("#cmpln").hide(); $("#scoreCmplnCd option:eq(0)").prop("selected", true); $("#scoreDesc").val(""); break;
		case "lv4":
		case "lv5": $("#cmpln").show(); break;
		}
	});
});

function deleteReq() {
	if(!confirm("삭제하시겠습니까?")) {
        return;
    }
	
	fn_comm_ajax({
	    url : "/gimpo/ajaxf/frVocSvc/deleteReq.do",
	    data : {
	    	"vocSeq": 12250
	    },
	    dataType : "json",
	    success : function(data) {
	    	
	    	alert(data.MSG);
	    	
	    	if(data.RESULT == '1'){
		    	
	    		location.href = "/gimpo/cms/frCon/index.do?MENU_ID=1800&CONTENTS_NO=2&searchKey=&searchVal=&currentPage=1";
	    	}
	    	
	    }
	});
}

function scoreReq() {
	var scoreRadio = document.getElementsByName("scores");
	var checked = false;
	var score = "";
	for (var i = 0; i < scoreRadio.length; i++) {
		if (scoreRadio[i].checked == true) {
			checked = true;
			score = scoreRadio[i].value;
			break;
		}
	}
	
	if (!checked) {
		alert("만족도를 선택해주세요.");
		return;
	}
	
	if (Number(score) <= 25) {
		if ($("#scoreCmplnCd").val() == "") {
			alert("불만족 사유를 선택해주세요.");
			return;
		}
		
		if ($("#scoreDesc").val() == "") {
			alert("불만족 내용을 입력해주세요.");
			return;
		}
	}

	if(!confirm("만족도를 등록하시겠습니까?")) {
        return;
    }
	
	fn_comm_ajax({
	    url : "/gimpo/ajaxf/frVocSvc/scoreReq.do",
	    data : {
	    	"vocSeq": 12250,
	    	"orderNos": "1",
	    	"scores": score,
	    	"scoreCmplnCd": $("#scoreCmplnCd").val(),
	    	"scoreDesc": $("#scoreDesc").val()
	    },
	    dataType : "json",
	    success : function(data) {
	    	
	    	alert(data.MSG);
	    	
	    	if(data.RESULT == '1'){
		    	
	    		location.href = "/gimpo/cms/frVocCon/vocDetail.do?MENU_ID=1800&vocSeq=12250&searchKey=&searchVal=&currentPage=1&vocCd=1&pageType=1";
	    	}
	    	
	    }
	});
}

</script>

<div class="voc-wrap Noto">
	
	
    <div class="board_area">
        <p class="subTit2">김**님의 고객의 소리 입니다.</p>
        <div class="lineList_tbW">
            <table>
            	<caption>제목, 발생지(공항), 등록일, 처리상태, 답변필요여부, 내용, 첨부파일이 표기된 표입니다.</caption>
                <colgroup>
                    <col>
                    <col>
                    <col>
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">
                            제목
                        </th>
                        <td colspan="3">
                            d
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row">
                            발생지(공항)
                        </th>
                        <td>
							
                            김포공항
                            
							
                        </td>
                        <th scope="row">
                            등록일
                        </th>
                        <td class="Roboto">
                            2024-10-11 12:47:38
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row">
                            처리상태
                        </th>
                        <td>
							
                            미접수
                            
							
                        </td>
                        <th scope="row">
                            답변필요여부
                        </th>
                        <td>
                            아니오
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row">
                            내용
                        </th>
                        <td colspan="3">
                            <p class="tabTxt1">
                                d
                            </p>
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row">
                            발생일시
                        </th>
                        <td colspan="3">
                            
                        </td>
                    </tr>

                    <tr class="w_txt">
                        <th scope="row">
                            첨부파일
                        </th>
                        <td colspan="3">
                        	
                        	
                        		
	                        		
	                        		<a href="/gimpo/ajaxf/frVocSvc/fileDownload.do?vocSeq=12250&amp;id=298fed65-6812-4406-9ed3-a2e173dd4765">예약_완료.PNG</a>
                        		
                        	
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        
      	
      	
      		
  		
        
        	<!-- 버튼영역 -->
			<div class="tbArea_btn iTem3">
				<a href="javascript:deleteReq();" class="btnC"><span>삭제하기</span></a>
				<a href="/gimpo/cms/frVocCon/vocWrite.do?MENU_ID=1800&amp;vocSeq=12250&amp;vocCd=1&amp;searchKey=&amp;searchVal=&amp;currentPage=1" class="btnC"><span>수정하기</span></a>
				<a href="/gimpo/cms/frCon/index.do?MENU_ID=1800&amp;searchKey=&amp;searchVal=&amp;currentPage=1&amp;CONTENTS_NO=2" class="btnC btnGray"><span>목록으로</span></a>
			</div>
			<!-- //버튼영역 -->
        
        
    </div>
    
    
</div>

			
				
	            
				
					<div class="pageCharge">
						<ul>
							<li><b>담당부서</b> 서비스개발부</li>
							
							<li><b>연락처</b> 02-2660-2443</li>
						</ul>

					</div>
				
					
				
					<div class="pageEval">
						<form id="satisForm" method="post">
							<input type="hidden" name="SITE_NO" value="4">
							<input type="hidden" name="MENU_NO" value="1800">
							<input type="hidden" name="CONTENTS_NO" value="1">
							<p>현재 페이지에서 제공하는 안내 및 정보 제공에 만족하십니까?</p>
							<div class="eval_sel">
								<span class="inp_r"><input type="radio" name="SCO" id="pageEval_5" value="5"><label for="pageEval_5">매우 만족</label></span>
								<span class="inp_r"><input type="radio" name="SCO" id="pageEval_4" value="4"><label for="pageEval_4">만족</label></span>
								<span class="inp_r"><input type="radio" name="SCO" id="pageEval_3" value="3"><label for="pageEval_3">보통</label></span>
								<span class="inp_r"><input type="radio" name="SCO" id="pageEval_2" value="2"><label for="pageEval_2">불만</label></span>
								<span class="inp_r"><input type="radio" name="SCO" id="pageEval_1" value="1"><label for="pageEval_1">매우 불만</label></span>
							</div>
							<fieldset class="eval_txt">
								<legend>페이지 평가 작성</legend>
								<input type="text" class="inp_t" name="OPINION" title="페이지 평가 입력">
								<button type="button" onclick="fn_save_opinion();">평가하기</button>
							</fieldset>
						</form>
					</div>
				
				
			</article>
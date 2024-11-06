package kr.or.ddit.finance.util;

import java.util.List;
import java.util.Map;

//페이징 관련 정보 + 게시글 정보
/**
 * @author plastic
 *
 * @param <T>
 */
public class FinancePagination<T> {
	//전체글 수
	private int total;
	//현재 페이지 번호
	private int currentPage;
	//전체 페이지 수
	private int totalPages;
	//블록의 시작 번호
	private int startPage;
	//블록의 종료 번호
	private int endPage;
	//검색어
	private String keyword = "";
	//요청URl
	private String url = "";
	//select 결과 데이터
	private List<T> content;
	//페이징 처리
	private String pagingArea = "";
	
	
	//24.9.18 홍정호 권한코드 검색
	private String startDate;
	//24.9.18 홍정호 부서코드 검색
	private String endDate;
	
	//생성자(Constructor) : 페이징 정보를 생성
	//					753				1				10			select결과
	public FinancePagination(int total, int currentPage, int size, List<T> content
				, String keyword) {
		//size : 한 화면에 보여질 목록의 행 수
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		this.keyword = keyword;
		
		//전체글 수가 0이면?
		if(total==0) {
			totalPages = 0;
			startPage = 0;	//블록 시작번호
			endPage = 0;	//블록 종료번호
		}else {	//글이 있다면
			//전체 페이지 수 = 전체글 수 / 한 화면에 보여질 목록의 행 수
			totalPages = total / size;// 31 / 10 = 3
			//나머지가 있다면, 페이지를 1 증가
			if(total %size > 0) {
				totalPages++;
			}
			
			//블록 시작 번호를 구하는 공식
			//블록 시작 번호 = 현재페이지 / 블록크기 * 블록크기 + 1
			startPage = currentPage / 5 * 5 + 1;
			
			//현재페이지 % 페이지크기 => 0일 때 보정
			if(currentPage % 5 ==0) {
				startPage -= 5;
			}
			
			//블록종료번호 = 블록시작번호 + (블록크기 - 1)
			//   [5]        [1]    +   5   - 1
			//[1][2][3][4][5][다음]
			endPage = startPage + (5 - 1);
			
			//블록종료번호 > 전체페이지수
			if(endPage > totalPages) {
				endPage = totalPages;
			}
		}
	}//생성자 끝
	
	//오버로딩 : 동일한 클래스 안에 같은 이름의 메소드를 여러개 사용
	//		  파라미터의 개수가 다르거나 매개변수의 타입을 다르게 함
	//생성자(Constructor) : 페이징 정보를 생성
	//					753				1				10			select결과
	public FinancePagination(int total, int currentPage, int size, List<T> content
			, Map<String,Object> map) {
		//size : 한 화면에 보여질 목록의 행 수
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		
		// 24.9.18. 홍정호
		this.startDate = (String) map.get("startDate");
		this.endDate = (String) map.get("endDate");
		
		//전체글 수가 0이면?
		if(total==0) {
			totalPages = 0;
			startPage = 0;	//블록 시작번호
			endPage = 0;	//블록 종료번호
		}else {	//글이 있다면
			//전체 페이지 수 = 전체글 수 / 한 화면에 보여질 목록의 행 수
			totalPages = total / size;// 31 / 10 = 3
			//나머지가 있다면, 페이지를 1 증가
			if(total %size > 0) {
				totalPages++;
			}
			
			//블록 시작 번호를 구하는 공식
			//블록 시작 번호 = 현재페이지 / 블록크기 * 블록크기 + 1
			startPage = currentPage / 4 * 4 + 1;
			
			//현재페이지 % 페이지크기 => 0일 때 보정
			if(currentPage % 4 ==0) {
				startPage -= 4;
			}
			
			//블록종료번호 = 블록시작번호 + (블록크기 - 1)
			//   [4]        [1]    +   4   - 1
			//[1][2][3][4][다음]
			endPage = startPage + (4 - 1);
			
			//블록종료번호 > 전체페이지수
			if(endPage > totalPages) {
				endPage = totalPages;
			}
		}//end if
		
		this.pagingArea = "<ul class='pagination pagination-sm m-0 d-flex justify-content-center'>"; 
		this.pagingArea += "<li class='page-item "; 
		if(this.startPage<5) {
			this.pagingArea += "disabled";
		}
		this.pagingArea += "'><a class='page-link' "; 
		this.pagingArea += "href='/emp/finance/transList?startDate="+this.startDate+"&endDate="+this.endDate+"&currentPage="+(this.startPage-4)+"'>«</a></li>";
		for(int pNo=this.startPage;pNo<=this.endPage;pNo++) {
			this.pagingArea += "<li class='page-item ";
				if(this.currentPage==pNo) {
					this.pagingArea += " active";
				}//end if
			this.pagingArea += "'><a class='page-link' ";
			this.pagingArea += " href='/emp/finance/transList?startDate="+this.startDate+"&endDate="+this.endDate+"&currentPage="+pNo+"'>"+pNo+"</a></li>"; 
		}//end for
		this.pagingArea += "<li class='page-item";
		if(this.endPage >= this.totalPages) {
			this.pagingArea += " disabled ";
		}
		this.pagingArea += "'><a class='page-link'";
		this.pagingArea += "href='/emp/finance/transList?startDate="+this.startDate+"&endDate="+this.endDate+"&currentPage="+(this.startPage+5)+"'>»</a></li>"; 
		this.pagingArea += "</ul>";	
	}//생성자 끝

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<T> getContent() {
		return content;
	}

	public void setContent(List<T> content) {
		this.content = content;
	}

	public String getPagingArea() {
		return pagingArea;
	}

	public void setPagingArea(String pagingArea) {
		this.pagingArea = pagingArea;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	
}






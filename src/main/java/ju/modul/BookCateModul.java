package ju.modul;

import java.util.ArrayList;

public class BookCateModul {
	
	int eb_lg;
	int eb_md;
	String eb_lgStr;
	ArrayList<String> eb_mdList;
	
	public BookCateModul() {
	}

	private String BookSwitch(int eb_lg) {
		switch(eb_lg){
			case 0 : eb_lgStr="철학"; break;
			case 1 : eb_lgStr="종교"; break;
			case 2 : eb_lgStr="인문과학"; break;
			case 3 : eb_lgStr="자연과학"; break;
			case 4 : eb_lgStr="예술"; break;
			case 5 : eb_lgStr="언어"; break;
			case 6 : eb_lgStr="문학"; break;
			case 7 : eb_lgStr="역사"; break;
			case 8 : eb_lgStr="잡지"; break;
			case 9 : eb_lgStr="교육"; break;
			default : eb_lgStr="Err"; break;
		}
		return eb_lgStr;
	}
	
	public String BookLgSelect(int start, int end, Boolean all) {
		StringBuffer book_Lg=new StringBuffer();
		
		book_Lg.append("<select id='cateLg' name='cateLg' class='form-control'>");
		if(all){
			book_Lg.append("<optgroup><option value='99'>전체</option></optgroup><optgroup>");
		}
		for(int i=start ; i<=end ; i++){
			book_Lg.append("<option value=" +i + ">");
			String optionStr=BookSwitch(i);
			book_Lg.append(optionStr + "</option>");
		}
		book_Lg.append("</optgroup></select>");
		return book_Lg.toString();
	}
	
	public String BookLgSelectId(int start, int end, Boolean all, String num) {
		StringBuffer book_Lg=new StringBuffer();
		
		book_Lg.append("<select id='cateLg_"+num+"' name='cateLg_"+num+"' class='form-control'>");
		if(all){
			book_Lg.append("<optgroup><option value='99'>전체</option></optgroup><optgroup>");
		}
		for(int i=start ; i<=end ; i++){
			book_Lg.append("<option value=" +i + ">");
			String optionStr=BookSwitch(i);
			book_Lg.append(optionStr + "</option>");
		}
		book_Lg.append("</optgroup></select>");
		return book_Lg.toString();
	}
	
	private ArrayList<String> Md_0() {
		eb_mdList=new ArrayList<String>();
		eb_mdList.add("미학/예술철학");
		eb_mdList.add("종교학/신화학");
		eb_mdList.add("논리학");
		eb_mdList.add("윤리학");
		eb_mdList.add("철학/사상");
		eb_mdList.add("한국철학");
		eb_mdList.add("동양철학");
		eb_mdList.add("서양철학");
		return eb_mdList;
	}
	
	private ArrayList<String> Md_1() {
		eb_mdList=new ArrayList<String>();
		eb_mdList.add("종교 일반");
		eb_mdList.add("기독교(개신교)");
		eb_mdList.add("천주교");
		eb_mdList.add("불교");
		eb_mdList.add("세계종교");
		eb_mdList.add("역학/사주");
		return eb_mdList;
	}
	
	private ArrayList<String> Md_2() {
		eb_mdList=new ArrayList<String>();
		eb_mdList.add("경제");
		eb_mdList.add("경영");
		eb_mdList.add("마케팅/세일즈");
		eb_mdList.add("투자/재테크");
		eb_mdList.add("CEO/비즈니스맨");
		eb_mdList.add("인터넷비즈니스");
		eb_mdList.add("총람/연감");
		eb_mdList.add("정부간행물");
		eb_mdList.add("심리");
		eb_mdList.add("인문일반");
		eb_mdList.add("기호학/언어학");
		return eb_mdList;
	}
	
	private ArrayList<String> Md_3() {
		eb_mdList=new ArrayList<String>();
		eb_mdList.add("과학");
		eb_mdList.add("수학");
		eb_mdList.add("물리학");
		eb_mdList.add("화학");
		eb_mdList.add("나노과학");
		eb_mdList.add("생명과학");
		eb_mdList.add("뇌과학");
		eb_mdList.add("인체");
		eb_mdList.add("천문학");
		eb_mdList.add("지구과학");
		eb_mdList.add("공학");
		eb_mdList.add("농/축/수산학");
		return eb_mdList;
	}
	
	private ArrayList<String> Md_4() {
		eb_mdList=new ArrayList<String>();
		eb_mdList.add("예술기행");
		eb_mdList.add("예술일반/예술사");
		eb_mdList.add("건축");
		eb_mdList.add("미술");
		eb_mdList.add("음악");
		eb_mdList.add("사진");
		eb_mdList.add("무용");
		eb_mdList.add("대중문화론");
		eb_mdList.add("TV/라디오");
		eb_mdList.add("연극/공연");
		eb_mdList.add("영화/드라마");
		eb_mdList.add("대중음악");
		eb_mdList.add("아트북");
		eb_mdList.add("예술치료");
		return eb_mdList;
	}
	
	private ArrayList<String> Md_5() {
		eb_mdList=new ArrayList<String>();
		eb_mdList.add("언어일반");
		eb_mdList.add("한국어");
		eb_mdList.add("중국어");
		eb_mdList.add("일본어 및 기타 아시아어");
		eb_mdList.add("영어");
		eb_mdList.add("독일어 및 기타 게르만어");
		eb_mdList.add("프랑스어");
		eb_mdList.add("스페인어");
		eb_mdList.add("이탈리어");
		eb_mdList.add("기타언어");
		return eb_mdList;
	}
	
	private ArrayList<String> Md_6() {
		eb_mdList=new ArrayList<String>();
		eb_mdList.add("소설");
		eb_mdList.add("에세이");
		eb_mdList.add("역사/장르문학");
		eb_mdList.add("테마소설");
		eb_mdList.add("고전문학/신화");
		eb_mdList.add("시/희곡");
		eb_mdList.add("비평/창작/이론");
		return eb_mdList;
	}
	
	private ArrayList<String> Md_7() {
		eb_mdList=new ArrayList<String>();
		eb_mdList.add("역사와 문화 교양서");
		eb_mdList.add("역사학 이론/비평");
		eb_mdList.add("한국사/한국문화");
		eb_mdList.add("동양사/동양문화");
		eb_mdList.add("서양사/서양문화");
		eb_mdList.add("세계사/세계문화");
		eb_mdList.add("기타 역사");
		return eb_mdList;
	}
	
	private ArrayList<String> Md_8() {
		eb_mdList=new ArrayList<String>();
		eb_mdList.add("경제");
		eb_mdList.add("스포츠");
		eb_mdList.add("리빙");
		eb_mdList.add("여행");
		eb_mdList.add("기타");
		return eb_mdList;
	}
	
	private ArrayList<String> Md_9() {
		eb_mdList=new ArrayList<String>();
		eb_mdList.add("국어");
		eb_mdList.add("수학");
		eb_mdList.add("영어");
		eb_mdList.add("한국사");
		eb_mdList.add("사회/사회탐구");
		eb_mdList.add("과학/과학탐구");
		
		return eb_mdList;
	}
	
	public ArrayList<String> BookMdArr(int eb_lg) {
		eb_mdList=new ArrayList<String>();
		switch(eb_lg){
		case 0 : eb_mdList=Md_0(); break;
		case 1 : eb_mdList=Md_1(); break;
		case 2 : eb_mdList=Md_2(); break;
		case 3 : eb_mdList=Md_3(); break;
		case 4 : eb_mdList=Md_4(); break;
		case 5 : eb_mdList=Md_5(); break;
		case 6 : eb_mdList=Md_6(); break;
		case 7 : eb_mdList=Md_7(); break;
		case 8 : eb_mdList=Md_8(); break;
		case 9 : eb_mdList=Md_9(); break;
		default : eb_mdList=null; break;
	}
	return eb_mdList;
	}
	
}
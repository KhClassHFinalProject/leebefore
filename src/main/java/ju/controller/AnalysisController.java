package ju.controller;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.Calendar;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AnalysisController {

	@RequestMapping(value="/analSearch.ju")
	public ModelAndView analysis(){
		// 검색어 빈도
		File f = new File("../LOG/book/searchList.log");
		Map<String, Integer> map = new HashMap<String, Integer>();
		ValueComparator bvc =  new ValueComparator(map);
        TreeMap<String,Integer> sorted_map = new TreeMap<String,Integer>(bvc);
        
		if(f.exists()){
			try {
				BufferedReader in = new BufferedReader(new FileReader(f));
				String s;
				while ((s = in.readLine()) != null) {
					String arr[] = s.split("/");
					for (int i = 0; i < arr.length; i++) {
						if(map.get(arr[i])==null){
							map.put(arr[i], 1);
						}else{
							int count = map.get(arr[i])+1;
							map.put(arr[i], count);
						}
					}
				}
				in.close();
			} catch (Exception e) {
			}
		}
		sorted_map.putAll(map);
        
		String json = "[";
		int count = 0;
        for (Map.Entry<String,Integer> entry : sorted_map.entrySet()) {
            //정렬한 리스트에서 순번을 배열번호로 변경하여 원본 리스트에서 추출
        	count++;
        	if(count>7){
        		break;
    		}else{
    			json += "{text:'" + entry.getKey() + "', count:'" + map.get(entry.getKey()) + "'},";
    		}
        }
        json = json.substring(0, json.length()-1);
        json += "]";
		
		ModelAndView mav = new ModelAndView("/anal/analMain");
		mav.addObject("list", json);
		return mav;
	}
	
	/* 유저통계 */
	@RequestMapping(value="/analUser.ju")
	public ModelAndView analUser(){
		//유저빈도
		File f = new File("../LOG/member/memberInfo.log");
		Map<String, Integer> map = new HashMap<String, Integer>();
		if(f.exists()){
			try {
				BufferedReader in = new BufferedReader(new FileReader(f));
				String s;
				while ((s = in.readLine()) != null) {
					if(s.contains("join")){
						String arr[] = s.split(",");
						for (int i = 0; i < arr.length; i++) {
							//age
							if(arr[i].substring(0, 5).equals("birth")){
								String birthArr[] = arr[i].split(":");
								String birth = "";
								if( birthArr[1].substring(0, 1).equals("0")||birthArr[1].substring(0, 1).equals("1") ){
									birth = "20"+birthArr[1].substring(0, 2);
								}else{
									birth = "19"+birthArr[1].substring(0, 2);
								}
								int age = (Calendar.getInstance().get(Calendar.YEAR)-Integer.parseInt(birth)+1);
								if( (age>=1) && (age<20) ){
									if(map.get("20세미만")==null){
										map.put("20세미만", 1);
									}else{
										map.put("20세미만", map.get("20세미만")+1);
									}
								}else if((age>=20) && (age<30)){
									if(map.get("20대")==null){
										map.put("20대", 1);
									}else{
										map.put("20대", map.get("20대")+1);
									}
								}else if((age>=30) && (age<40)){
									if(map.get("30대")==null){
										map.put("30대", 1);
									}else{
										map.put("30대", map.get("30대")+1);
									}
								}else if((age>=40) && (age<50)){
									if(map.get("40대")==null){
										map.put("40대", 1);
									}else{
										map.put("40대", map.get("40대")+1);
									}
								}else if( age>=50 ){
									if(map.get("50대이상")==null){
										map.put("50대이상", 1);
									}else{
										map.put("50대이상", map.get("50대이상")+1);
									}
								}
							}//age end
							
							//gender
							if(arr[i].substring(0, 6).equals("gender")){
								String genderArr[] = arr[i].split(":");
								if( genderArr[1].equals("1")||genderArr[1].equals("3") ){
									if(map.get("Man")==null){
										map.put("Man", 1);
									}else{
										map.put("Man", map.get("Man")+1);
									}
								}
								if( genderArr[1].equals("2")||genderArr[1].equals("4") ){
									if(map.get("Woman")==null){
										map.put("Woman", 1);
									}else{
										map.put("Woman", map.get("Woman")+1);
									}
								}
							}//gender end
							
							//like
							if(arr[i].substring(0, 4).equals("like")){
								String likeArr[] = arr[i].split(":");
								int likeNum = Integer.parseInt(likeArr[1].substring(0, 1));
								if(likeNum==0){
									if(map.get("like0")==null){
										map.put("like0", 1);
									}else{
										map.put("like0", map.get("like0")+1);
									}
								}else if(likeNum==1){
									if(map.get("like1")==null){
										map.put("like1", 1);
									}else{
										map.put("like1", map.get("like1")+1);
									}
								}else if(likeNum==2){
									if(map.get("like2")==null){
										map.put("like2", 1);
									}else{
										map.put("like2", map.get("like2")+1);
									}
								}else if(likeNum==3){
									if(map.get("like3")==null){
										map.put("like3", 1);
									}else{
										map.put("like3", map.get("like3")+1);
									}
								}else if(likeNum==4){
									if(map.get("like4")==null){
										map.put("like4", 1);
									}else{
										map.put("like4", map.get("like4")+1);
									}
								}else if(likeNum==5){
									if(map.get("like5")==null){
										map.put("like5", 1);
									}else{
										map.put("like5", map.get("like5")+1);
									}
								}else if(likeNum==6){
									if(map.get("like6")==null){
										map.put("like6", 1);
									}else{
										map.put("like6", map.get("like6")+1);
									}
								}else if(likeNum==7){
									if(map.get("like7")==null){
										map.put("like7", 1);
									}else{
										map.put("like7", map.get("like7")+1);
									}
								}else if(likeNum==8){
									if(map.get("like8")==null){
										map.put("like8", 1);
									}else{
										map.put("like8", map.get("like8")+1);
									}
								}
							}//like end
							
							//email
							if(arr[i].substring(0, 4).equals("mail")){
								String mailArr[] = arr[i].split(":");
								String mailNum = mailArr[1];
								if(mailNum.equals("hanmail")){
									if(map.get("mail0")==null){
										map.put("mail0", 1);
									}else{
										map.put("mail0", map.get("mail0")+1);
									}
								}else if(mailNum.equals("naver")){
									if(map.get("mail1")==null){
										map.put("mail1", 1);
									}else{
										map.put("mail1", map.get("mail1")+1);
									}
								}else if(mailNum.equals("gmail")){
									if(map.get("mail2")==null){
										map.put("mail2", 1);
									}else{
										map.put("mail2", map.get("mail2")+1);
									}
								}else if(mailNum.equals("nate")){
									if(map.get("mail3")==null){
										map.put("mail3", 1);
									}else{
										map.put("mail3", map.get("mail3")+1);
									}
								}else if(mailNum.equals("hotmail")){
									if(map.get("mail4")==null){
										map.put("mail4", 1);
									}else{
										map.put("mail4", map.get("mail4")+1);
									}
								}else if(mailNum.equals("msn")){
									if(map.get("mail5")==null){
										map.put("mail5", 1);
									}else{
										map.put("mail5", map.get("mail5")+1);
									}
								}else{
									if(map.get("mail6")==null){
										map.put("mail6", 1);
									}else{
										map.put("mail6", map.get("mail6")+1);
									}
								}
							}//email end
							
						}//end for
					}//end if(s.contains)
				}//end while
				in.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// gender
		double man_per = (double)map.get("Man")/(double)(map.get("Man")+map.get("Woman"))*100.0;
		double woman_per = (double)map.get("Woman")/(double)(map.get("Man")+map.get("Woman"))*100.0;
		String gender = "[['Man',"+man_per+"],['Woman',"+woman_per+"]]";
		// age
		String age = "[['','Member'],['20세미만',"+map.get("20세미만")+"],['20대',"+map.get("20대")+"],['30대',"+map.get("30대")+"],['40대',"+map.get("40대")+"],['50대이상',"+map.get("50대이상")+"]]";
		// like
		String like = "[['','Like'],['나의존재',"+map.get("like0")+"],['삶과죽음',"+map.get("like1")+"],['사회',"+map.get("like2")+"],['과학',"+map.get("like3")+"],['문화생활',"+map.get("like4")+"],['지구촌',"+map.get("like5")+"],['갈등',"+map.get("like6")+"],['과거 현재 미래',"+map.get("like7")+"],['새로배움',"+map.get("like8")+"]]";
		// email
		String email = "[['Hanmail',"+map.get("mail0")+"],['Naver',"+map.get("mail1")+"],['Gmail',"+map.get("mail2")+"],['Nate',"+map.get("mail3")+"],['Hotmail',"+map.get("mail4")+"],['Msn',"+map.get("mail5")+"],['Etc',"+map.get("mail6")+"]]";
		ModelAndView mav = new ModelAndView("/anal/analUser");
		mav.addObject("gender", gender);
		mav.addObject("age", age);
		mav.addObject("like", like);
		mav.addObject("email", email);
		
		return mav;
	}
	
	@RequestMapping(value="/analLogin.ju")
	public ModelAndView analLogin(){
		ModelAndView mav = new ModelAndView("/anal/analLogin");
		return mav;
	}
	
	
	
	// 내림차순정렬
	class ValueComparator implements Comparator<String> {
		 
	    Map<String, Integer> base;
	     
	    public ValueComparator(Map<String, Integer> base) {
	        this.base = base;
	    }
	 
	    // Note: this comparator imposes orderings that are inconsistent with equals.    
	    public int compare(String a, String b) {
	        if (base.get(a) >= base.get(b)) { //반대로 하면 오름차순 <=
	            return -1;
	        } else {
	            return 1;
	        } // returning 0 would merge keys
	    }
	}
	
}

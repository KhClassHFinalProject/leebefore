package ju.audio.module;

public class ModulePage {
	
	public static String guestPageMake(String pageName,int totalCount,int currentPage,int pageSize,int listSize){
		
		StringBuffer page = new StringBuffer(); 
		
		int totalPage=(totalCount/listSize)+1; 
		if(totalCount%listSize==0)totalPage--; 
		
		int userGroup=(currentPage/pageSize); 
		if(currentPage%pageSize==0)userGroup--; 
		
		int start = userGroup*pageSize+1;   
		int end = userGroup*pageSize+pageSize;
		
		if(userGroup!=0){ 
			page.append("<li data-page='before'><a href='#'");  
			page.append("onclick='return false' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a>");
		}
		
		for(int i=start;i<=end;i++){ 
			page.append("<li data-page='"+i+"'><a href='#'");
			page.append("onclick='return false'>");
			page.append(i);
			page.append("</a></li>");
			if(i==totalPage)break;
		}
		
		if(userGroup!=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){  
			page.append("<li data-page='after'><a href='#'");  
			page.append("onclick='return false' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a>");
		}
		return page.toString(); 
	}
	
}

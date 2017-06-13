package ju.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ju.dto.RegistDTO;
import ju.dto.SubjectDTO;
import ju.learning.model.LearningDAO;
import ju.model.SubjectDAO;

@Controller
public class LearningController {
	@Autowired
	SubjectDAO subjectdao;
	
	@Autowired
	LearningDAO ligdao;
	
	@RequestMapping(value="/duplicateRegist.ju", method=RequestMethod.POST)
	public ModelAndView duplRegist(String mem_idx){
		List<String> list = ligdao.checkMyRgst(mem_idx);
		return new ModelAndView("juJson","myrgst",list);
	}
	
	@RequestMapping("/learningIndex.ju")
	public ModelAndView libList(HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		List<SubjectDTO> list = ligdao.checkSubjectList();
		for(int i = 0; i<list.size();i++){
			list.get(i).setSj_sd(list.get(i).getSj_sd().substring(0, 11));
			list.get(i).setSj_ed(list.get(i).getSj_ed().substring(0, 11));
		}
		
		mav.addObject("sublist", list);
		mav.setViewName("learning/ligList");
		return mav;
	}
	
	@RequestMapping("/rgstList.ju")
	public ModelAndView rgstList(HttpSession session){
		String mem_idx = (String)session.getAttribute("sidx");
		List<SubjectDTO> list = ligdao.checkMyRgstList(mem_idx);
		for(int i = 0; i<list.size();i++){
			list.get(i).setSj_sd(list.get(i).getSj_sd().substring(0, 11));
			list.get(i).setSj_ed(list.get(i).getSj_ed().substring(0, 11));
		}
		return new ModelAndView("learning/rgstList","mylist",list);
	}
	
	@RequestMapping("/rgst.ju")
	public ModelAndView rgst(RegistDTO dto, HttpSession session){
		dto.setMem_idx((String)session.getAttribute("sidx"));
		
		Long unixTime=System.currentTimeMillis();
        dto.setRg_idx("RG"+unixTime);
		
		return new ModelAndView("learning/ligMsg","msg",ligdao.rgst(dto)>0?"수강신청 성공":"수강신청 실패");
	}
	
	@RequestMapping("/deleteRgst.ju")
	public ModelAndView deleteRgst(RegistDTO dto, HttpSession session){
		dto.setMem_idx((String)session.getAttribute("sidx"));
		return new ModelAndView("learning/ligMsg","msg",ligdao.deleteRgst(dto)>0?"삭제성공":"삭제실패");
	}
	
	@RequestMapping("/ligTest.ju")
	public ModelAndView ligTest(HttpSession session){
		session.invalidate();
		return new ModelAndView("index");
	}
}

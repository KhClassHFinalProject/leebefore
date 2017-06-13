package ju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ju.model.SubjectDAO;

@Controller
public class LearningController {
	@Autowired
	SubjectDAO subjectdao;
	
	@RequestMapping("/learningIndex.ju")
	public ModelAndView libList(){
		
		return new ModelAndView("learning/ligList", "sublist", subjectdao.classList());
	}
	@RequestMapping("/rgstList.ju")
	public ModelAndView rgstList(){
		return new ModelAndView("learning/rgstList");
	}

}

package ju.controller;


import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	Logger log = Logger.getLogger(this.getClass());
	
	
	@RequestMapping("/index.ju")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}
	@RequestMapping("/disable.ju")
	public ModelAndView disable() {
        //client ip
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
        String ip = req.getHeader("X-FORWARDED-FOR");
        if (ip == null){
        	ip = req.getRemoteAddr();
        }
        log.info("ip:"+ip+"/");
        
        ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;
	}
	
	

}

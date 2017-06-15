package ju.controller;

import java.text.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ju.dto.RefRoomDTO;

@Controller
public class adminSeatController {

	@Autowired
	private ju.booking.model.BookingDAO bigdao;

	/**move study room to book*/
	@RequestMapping("/srBook1.ju")
	public ModelAndView srBook() {
		return new ModelAndView("admin/seatManage/srBook");
	}
	
	/**move booking index page*/
	@RequestMapping("/bookingIndex1.ju")
	public ModelAndView bigIndex() {
		return new ModelAndView("admin/seatManage/bookingIndex");
	}

	/**book read room or computer room*/
	@RequestMapping("/rrBook1.ju")
	public ModelAndView rrBook(RefRoomDTO dto) throws ParseException {
		Long unixTime=System.currentTimeMillis();
		String rr_idx="RR"+unixTime;
		
		dto.setRr_idx(rr_idx);
		dto.setRr_start(bigdao.getStart());
		return new ModelAndView("admin/seatManage/bookMsg", "msg", bigdao.booking(dto) > 0 ? "성공" : "행복");
	}
	
	@RequestMapping("/rrAjax1.ju")
	public ModelAndView rrAjax(){
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("rlist1",bigdao.rrCheck(1));
		mav.addObject("rlist2",bigdao.rrCheck(2));
		mav.addObject("rlist3",bigdao.rrCheck(3));
		mav.setViewName("juJson");
		return mav;
	}
	
}

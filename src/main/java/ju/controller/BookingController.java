package ju.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ju.booking.model.BookingDAO;
import ju.dto.RefRoomDTO;
import ju.dto.StudyRoomDTO;

@Controller
public class BookingController {

	@Autowired
	private BookingDAO bigdao;

	@RequestMapping("/rr.ju")
	public ModelAndView rrJson() {
		ModelAndView mav = new ModelAndView();

		mav.addObject("rlist1", bigdao.rrCheck(1));
		mav.addObject("rlist2", bigdao.rrCheck(2));
		mav.addObject("rlist3", bigdao.rrCheck(3));
		mav.setViewName("juJson");
		return mav;
	}

	 @RequestMapping(value="/srUserCheck.ju",method=RequestMethod.POST)
	 public ModelAndView srUserCheck(int roomno, int time, String resdate){
		 
		 return new ModelAndView("juJson","userCheck",bigdao.srUserCheck(roomno, time, resdate));
	 }

	@RequestMapping("/bookingIndex.ju")
	public ModelAndView bigIndex() {
		return new ModelAndView("big/bookingIndex");
	}

	@RequestMapping(value = "/srBook.ju", method = RequestMethod.GET)
	public ModelAndView srBookForm() {
		return new ModelAndView("big/srBook");
	}

	@RequestMapping(value = "/srBook.ju", method = RequestMethod.POST)
	public ModelAndView srBook(StudyRoomDTO dto, @RequestParam("resdate") String resdate_s) throws ParseException {

		Long unixTime = System.currentTimeMillis();
		String sr_idx = "SR" + unixTime;

		String dateFormat = "yyyy-MM-dd";

		dto.setSr_resdate(new Date(new java.text.SimpleDateFormat(dateFormat).parse(resdate_s).getTime()));

		dto.setSr_idx(sr_idx);

		return new ModelAndView("big/bookMsg", "msg", bigdao.srBook(dto) > 0 ? "성공" : "실패");
	}

	@RequestMapping(value = "/srCal.ju", method = RequestMethod.POST)
	public ModelAndView srCal(String start) {
		return new ModelAndView("juJson","srarr",bigdao.srCheck(start));
	}
	
	@RequestMapping("/srCancel.ju")
	public ModelAndView srCancel(
			@RequestParam(value="sr_time", defaultValue="0") int sr_time,
			@RequestParam(value="sr_roomno", defaultValue="0") int sr_roomno
			){
		if(sr_time==0||sr_roomno==0){
			return new ModelAndView("big/bookMsg","msg","잘못된 경로를 입력하셨습니다.");
		}
		
		return new ModelAndView("big/bookMsg","msg",bigdao.srCancel(sr_roomno, sr_time)>0?"성공":"실패");
	}
}

package ju.controller;

import java.sql.Date;
import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import ju.model.BookingDAO;
import ju.model.MemberDAO;
import ju.dto.BanDTO;
import ju.dto.MemberDTO;

import ju.dto.RefRoomDTO;
import ju.dto.StudyRoomDTO;

@Controller
public class adminSeatController {

	@Autowired
	private ju.booking.model.BookingDAO bigdao;
	MemberDAO memdao;

	@RequestMapping(value = "/rrInfo.ju", method = RequestMethod.POST)
	public ModelAndView rrInfo(int seatno, int cate) {

		return new ModelAndView("juJson", "rrInfo", bigdao.adminSeatInfo(seatno, cate));
	}
	
	@RequestMapping(value = "/srRoomInfo.ju", method = RequestMethod.POST)
	public ModelAndView rrInfo(int roomno, int time, String resdate) {
		
		return new ModelAndView("juJson", "roomInfo", bigdao.adminRoomInfo(roomno, time, resdate));
	}

	/** move study room to book */
	@RequestMapping("/adminSeatManage.ju")
	public ModelAndView adminSeatManage() {
		return new ModelAndView("admin/seatManage/adminSeatIndex");
	}
	
	@RequestMapping("/adminSrManage.ju")
	public ModelAndView adminSrManage() {
		return new ModelAndView("admin/seatManage/manageSrBook");
	}

	/** move admin seat index page */
	@RequestMapping("/seatIndex.ju")
	public ModelAndView seatIndex() {
		return new ModelAndView("admin/seatManage/seatIndex");
	}

	@RequestMapping("/seatLogout.ju")
	public ModelAndView seatLogout(HttpSession session) {
		session.removeAttribute("rrdto");
		session.removeAttribute("normalMember");
		session.removeAttribute("checkTime");
		return new ModelAndView("admin/seatManage/seatMsg","msg","로그아웃되었습니다.");
	}

	/** login with barcode */
	@RequestMapping(value = "/bigBarcodeLogin.ju", method = RequestMethod.POST)
	public ModelAndView bigBarcodeLogin(@RequestParam(value = "mem_idx", defaultValue = "") String mem_idx,
			HttpSession session) {
		// check idx is null?
		if (mem_idx == null || mem_idx.equals("")) {
			return new ModelAndView("admin/seatManage/seatMsg", "msg", "잘못된 경로입니다.");
		}

		// check member idx
		MemberDTO memdto = bigdao.bigBarcodeLogin(mem_idx);
		if (memdto == null) {
			return new ModelAndView("admin/seatManage/seatMsg", "msg", "회원을 등록해주세요.");
		}


		session.setAttribute("normalMember", memdto.getMem_idx());

		RefRoomDTO rrdto = bigdao.bigBarcodeCheck(mem_idx);
		if (rrdto == null) {
			session.setAttribute("rrdto", rrdto);
			return new ModelAndView("admin/seatManage/seatMsg", "msg", memdto.getMem_name() + "님 환영합니다.");
		}
		if (!rrdto.getRr_add().equals("불가")){
			rrdto.setRr_add(Integer.parseInt(rrdto.getRr_add().split("~")[0]) == Integer.parseInt(rrdto.getRr_add().split("~")[1])? "불가" : rrdto.getRr_add().split("~")[0]);
		}
		
		String startTime = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss").format(rrdto.getRr_start());
		String endTime = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss").format(rrdto.getRr_end());
		startTime = startTime.substring(11, startTime.length());
		endTime = endTime.substring(11, endTime.length());
		
		Map checkTimeMap = new HashMap();
		
		checkTimeMap.put("startTime", startTime);
		checkTimeMap.put("endTime", endTime);
		
		session.setAttribute("checkTime", checkTimeMap);
		session.setAttribute("rrdto", rrdto);
		return new ModelAndView("admin/seatManage/seatMsg", "msg", memdto.getMem_name() + "님 환영합니다.");
	}

	/** book read room or computer room */
	@RequestMapping("/rrBook.ju")
	public ModelAndView rrBook(RefRoomDTO dto, HttpSession session) throws ParseException {
		Long unixTime = System.currentTimeMillis();
		String rr_idx = "RR" + unixTime;

		dto.setRr_idx(rr_idx);
		dto.setRr_start(bigdao.getStart());
		dto.setRr_add("0~3");
		session.removeAttribute("normalMember");
		session.removeAttribute("rrdto");

		return new ModelAndView("admin/seatManage/seatMsg", "msg", bigdao.booking(dto) > 0 ? "성공" : "행복");
	}
	
	@RequestMapping("/crBook.ju")
	public ModelAndView crBook(RefRoomDTO dto, HttpSession session) throws ParseException {
		Long unixTime = System.currentTimeMillis();
		String rr_idx = "RR" + unixTime;
		
		dto.setRr_idx(rr_idx);
		dto.setRr_start(bigdao.getStart());
		dto.setRr_add("불가");
		session.removeAttribute("normalMember");
		session.removeAttribute("rrdto");
		
		return new ModelAndView("admin/seatManage/seatMsg", "msg", bigdao.booking(dto) > 0 ? "성공" : "행복");
	}

	@RequestMapping("/returnSeat.ju")
	public ModelAndView returnSeat(@RequestParam(value = "rr_idx", defaultValue = "") String rr_idx,
			HttpSession session) {
		session.removeAttribute("normalMember");
		session.removeAttribute("rrdto");
		if (rr_idx.equals("")) {
			return new ModelAndView("admin/seatManage/seatMsg", "msg", "에러발생");
		}
		return new ModelAndView("admin/seatManage/seatMsg", "msg", bigdao.returnSeat(rr_idx) > 0 ? "반납성공" : "반납실패");
	}
	
	@RequestMapping("/returnAdminSeat.ju")
	public ModelAndView returnAdminSeat(@RequestParam(value = "rr_idx", defaultValue = "") String rr_idx,
			HttpSession session) {
		if (rr_idx.equals("")) {
			return new ModelAndView("admin/seatManage/seatMsg", "msg", "에러발생");
		}
		return new ModelAndView("admin/seatManage/seatAdminMsg", "msg", bigdao.returnSeat(rr_idx) > 0 ? "반납성공" : "반납실패");
	}

	@RequestMapping("/bigAdd.ju")
	public ModelAndView bigAdd(@RequestParam(value = "rr_idx", defaultValue = "") String rr_idx,
			@RequestParam(value = "rr_add", defaultValue = "") String rr_add, HttpSession session) {
		session.removeAttribute("normalMember");
		session.removeAttribute("rrdto");
		if (rr_idx.equals("") || rr_add.equals("")) {
			return new ModelAndView("admin/seatManage/seatMsg", "msg", "잘못된 경로입니다.");
		}

		return new ModelAndView("admin/seatManage/seatMsg", "msg", bigdao.bigAddTime(rr_idx, rr_add) > 0 ? "연장되었습니다." : "실패했습니다.");
	}

	@RequestMapping("/adminSeatDisabled.ju")
	public ModelAndView adminSeatDisabled(RefRoomDTO dto) throws ParseException {
		Long unixTime = System.currentTimeMillis();
		String rr_idx = "RR" + unixTime;

		dto.setRr_idx(rr_idx);
		dto.setRr_start(bigdao.getStart());

		return new ModelAndView("admin/seatManage/seatAdminMsg", "msg", bigdao.adminSeatDisabled(dto) > 0 ? "성공" : "실패");
	}
	
	@RequestMapping("/adminRoomDisabled.ju")
	public ModelAndView adminRoomDisabled(StudyRoomDTO dto, @RequestParam("resdate") String resdate_s) throws ParseException {
		Long unixTime = System.currentTimeMillis();
		String sr_idx = "SR" + unixTime;
		
		dto.setSr_idx(sr_idx);
		String dateFormat = "yyyy-MM-dd";

		dto.setSr_resdate(new Date(new java.text.SimpleDateFormat(dateFormat).parse(resdate_s).getTime()));
		
		return new ModelAndView("admin/seatManage/seatAdminMsg", "msg", bigdao.adminRoomDisabled(dto) > 0 ? "성공" : "실패");
	}
	
	@RequestMapping("/srAdminCancel.ju")
	public ModelAndView srAdminCancel(
			@RequestParam(value="sr_time", defaultValue="0") int sr_time,
			@RequestParam(value="sr_roomno", defaultValue="0") int sr_roomno
			){
		if(sr_time==0||sr_roomno==0){
			return new ModelAndView("admin/seatManage/seatAdminMsg","msg","잘못된 경로를 입력하셨습니다.");
		}
		
		return new ModelAndView("admin/seatManage/seatAdminMsg","msg",bigdao.srCancel(sr_roomno, sr_time)>0?"성공":"실패");
	}
}

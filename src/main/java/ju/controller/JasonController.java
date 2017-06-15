package ju.controller;

import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ju.audiobook.model.AudioDAO;
import ju.dto.AudioListDTO;
import ju.dto.ElibDTO;

@Controller
public class JasonController {
	@Autowired
	private AudioDAO audioDao;

	
	public String audioPath(HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("/resources/elib/eAudio/");
		System.out.println(path);
		return path;
	}
	//오디오 리스트 및 mp3 경로
	@RequestMapping("/audioList.ju")
	public ModelAndView audiojson(@RequestParam(value="elIdx")String elIdx,String path, HttpServletRequest req) {
		// mp3 파일 경로 불러오기
		ModelAndView mav = new ModelAndView();
//		System.out.println("test : "+elIdx);
		path = audioPath(req);
		mav.addObject("elIdx",elIdx);
		ElibDTO dto = audioDao.selMplist(elIdx);
		
		File f = new File(path+"\\"+dto.getEl_idx());
//		System.out.println(path+"\\"+dto.getEl_idx());
		
		File files[] = f.listFiles(new FilenameFilter() {
			public boolean accept(File dir, String name) {
				return name.endsWith(".mp3");
			}
		});

		List<AudioListDTO> list = new ArrayList<AudioListDTO>();


		for (int i = 0; i < files.length; i++) {

			// 오디오 트랙번호, 파일이름, 파일 이름, 재생시간 가져오기
			int trackNum = i + 1;
			String name = files[i].getName();
//			System.out.println(name);

			String[] fileName = name.split("\\."); // split 할떄에는 자료형에 배열을 주어준다.

//			System.out.println(fileName[1]);
			String duration = " ";
			AudioListDTO aList = new AudioListDTO(trackNum, fileName[0], fileName[0], duration);

			list.add(i, aList);

			mav.addObject("audios", list);
			mav.setViewName("juJson");
		}
		return mav;
	}
}

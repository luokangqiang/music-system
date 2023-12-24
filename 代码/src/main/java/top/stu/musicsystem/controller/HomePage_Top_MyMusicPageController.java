

package top.stu.musicsystem.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import top.stu.musicsystem.service.MyMusicService;
import top.stu.musicsystem.utils.OneDayOneWord;
import top.stu.musicsystem.model.Song;
import top.stu.musicsystem.utils.Static;

@Controller
public class HomePage_Top_MyMusicPageController {
	@Autowired
	private MyMusicService myMusicService;

	public HomePage_Top_MyMusicPageController() {
	}

	@GetMapping({"myMusicFrameLoad.do"})
	public ModelAndView myMusicFrameLoad(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("HomePage_Top_myMusicFrame");
		modelAndView.addObject("oneDayOneWord", OneDayOneWord.getOneDayOneWord(Static.MY_MUSIC_WORD_ARRAY));
		return modelAndView;
	}

	@GetMapping({"recentFrameLoad.do"})
	public ModelAndView recentFrameLoad(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("Song_InformationDispalyFrame");
		List<Song> myRecentPlayList = this.myMusicService.getMyRecentPlayListWithCollectionFlag(request);
		modelAndView.addObject("myRecentPlayList", myRecentPlayList);
		modelAndView.addObject("oneDayOneWord", OneDayOneWord.getOneDayOneWord(Static.MY_MUSIC_WORD_ARRAY));
		return modelAndView;
	}

	@GetMapping({"collectedFrameLoad.do"})
	public ModelAndView collectedFrameLoad(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("HomePage_Top_myMusic_SongList_Collected、PalyedRecently_Frame");
		List<Song> myCollectionList = this.myMusicService.getMyCollectionWithCollectionFlag(request);
		modelAndView.addObject("myCollectionList", myCollectionList);
		modelAndView.addObject("oneDayOneWord", OneDayOneWord.getOneDayOneWord(Static.MY_MUSIC_WORD_ARRAY));
		return modelAndView;
	}
}

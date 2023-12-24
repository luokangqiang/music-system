

package top.stu.musicsystem.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import top.stu.musicsystem.service.NewTrackOnShelfService;
import top.stu.musicsystem.model.Song;

@Controller
public class NewTrackOnShelfFrameController {
	@Autowired
	private NewTrackOnShelfService newTrackOnShelfService;

	public NewTrackOnShelfFrameController() {
	}

	@RequestMapping(
			value = {"NewTrackOnShelfFrameLoad.do"},
			method = {RequestMethod.GET}
	)
	public ModelAndView newTrackOnShelfFrameLoad(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("HomePage_3Column_newSongComeOutFrame");
		List<Song> newTrackSongList = this.newTrackOnShelfService.getNewTrackWithCollectionFlag(request);
		modelAndView.addObject("newTrackSongList", newTrackSongList);
		modelAndView.addObject("test", "Name");
		return modelAndView;
	}
}

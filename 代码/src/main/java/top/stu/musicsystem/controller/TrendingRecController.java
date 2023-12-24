
package top.stu.musicsystem.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import top.stu.musicsystem.service.TrendingRecService;
import top.stu.musicsystem.model.Song;

@Controller
public class TrendingRecController {
	@Autowired
	private TrendingRecService trendingRecService;

	public TrendingRecController() {
	}

	@RequestMapping(
			value = {"trendingRecFrameLoad.do"},
			method = {RequestMethod.GET}
	)
	public ModelAndView trendingRecFrameLoad(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("HomePage_3Column_trendingRecommendationFrame");
		List<Song> trendingSongList = this.trendingRecService.getSongWithCollectionFlag(request);
		modelAndView.addObject("trendingSongList", trendingSongList);
		modelAndView.addObject("test", "Name");
		return modelAndView;
	}
}


package top.stu.musicsystem.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import top.stu.musicsystem.service.RankingPageService;
import top.stu.musicsystem.utils.OneDayOneWord;
import top.stu.musicsystem.model.Song;
import top.stu.musicsystem.utils.Static;

@Controller
public class RankingPageCotroller {
	@Autowired
	private RankingPageService rankingPageService;

	public RankingPageCotroller() {
	}

	@GetMapping({"rankingFrameLoad.do"})
	public ModelAndView rankingFrameLoad(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("HomePage_Top_rankingFrame");
		List<Song> weekRankingList = this.rankingPageService.getRankWithCollectionFlag(request, 1);
		List<Song> monthRankingList = this.rankingPageService.getRankWithCollectionFlag(request, 2);
		modelAndView.addObject("weekRankingList", weekRankingList);
		modelAndView.addObject("monthRankingList", monthRankingList);
		modelAndView.addObject("oneDayOneWord", OneDayOneWord.getOneDayOneWord(Static.RANKING_WORD_ARRAY));
		return modelAndView;
	}
}

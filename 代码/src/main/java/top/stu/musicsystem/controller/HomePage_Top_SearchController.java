

package top.stu.musicsystem.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import top.stu.musicsystem.service.SearchService;
import top.stu.musicsystem.utils.OneDayOneWord;
import top.stu.musicsystem.model.Song;
import top.stu.musicsystem.service.UserService;
import top.stu.musicsystem.utils.Static;

@Controller
public class HomePage_Top_SearchController {
	@Autowired
	private SearchService searchService;
	@Autowired
	private UserService userService;

	public HomePage_Top_SearchController() {
	}

	@RequestMapping(
			value = {"searchFrameLoad.do"},
			method = {RequestMethod.GET}
	)
	public ModelAndView searchFrameLoad(HttpServletRequest request, String keyword, String mode) {
		ModelAndView modelAndView = new ModelAndView();
		if (mode != null && this.userService.isHasPrivilege(request)) {
			int modeInt = Integer.parseInt(mode);
			List userManageSearchList;
			if (modeInt == 0) {
				modelAndView.setViewName("HomePage_ManagerSearch_SongNameResult.jsp_Frame");
				userManageSearchList = this.searchService.getSearchSong(keyword);
				modelAndView.addObject("songManageSearchList", userManageSearchList);
				if (userManageSearchList.size() == 0) {
					modelAndView.addObject("oneDayOneWord", "下落不明");
				} else {
					modelAndView.addObject("oneDayOneWord", OneDayOneWord.getOneDayOneWord(Static.SEARCH_WORD_ARRAY));
				}
			} else if (modeInt == 1) {
				modelAndView.setViewName("HomePage_ManagerSearch_UserResult.jsp_Frame");
				userManageSearchList = this.searchService.getSearchUser(request, keyword);
				modelAndView.addObject("userManageSearchList", userManageSearchList);
				if (userManageSearchList.size() == 0) {
					modelAndView.addObject("oneDayOneWord", "下落不明");
				} else {
					modelAndView.addObject("oneDayOneWord", OneDayOneWord.getOneDayOneWord(Static.SEARCH_WORD_ARRAY));
				}
			} else {
				modelAndView.setViewName("HomePage_ManagerSearch_CommentResult.jsp_FrameFrame");
				userManageSearchList = this.searchService.getSearchReview(keyword);
				modelAndView.addObject("reviewManageSearchList", userManageSearchList);
				if (userManageSearchList.size() == 0) {
					modelAndView.addObject("oneDayOneWord", "下落不明");
				} else {
					modelAndView.addObject("oneDayOneWord", OneDayOneWord.getOneDayOneWord(Static.SEARCH_WORD_ARRAY));
				}
			}
		} else {
			modelAndView.setViewName("HomePage_Top_searchFrame");
			List<Song> searchSongList = this.searchService.getSearchSongWithCollectionFlag(request, keyword);
			modelAndView.addObject("searchSongList", searchSongList);
			if (searchSongList.size() == 0) {
				modelAndView.addObject("oneDayOneWord", "下落不明");
			} else {
				modelAndView.addObject("oneDayOneWord", OneDayOneWord.getOneDayOneWord(Static.SEARCH_WORD_ARRAY));
			}
		}

		return modelAndView;
	}
}

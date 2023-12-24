

package top.stu.musicsystem.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import top.stu.musicsystem.service.ReviewService;
import top.stu.musicsystem.model.Review;
import top.stu.musicsystem.model.Song;
import top.stu.musicsystem.service.SongService;
import top.stu.musicsystem.service.UserService;
import top.stu.musicsystem.utils.ReturnMsg;

@Controller
public class ReviewController {
	@Autowired
	private SongService songService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private UserService userService;

	public ReviewController() {
	}

	@RequestMapping(
			value = {"reviewFrameLoad.do"},
			method = {RequestMethod.GET}
	)
	public ModelAndView reviewFrameLoad(HttpServletRequest request, int songId) {
		Song song = this.songService.getSongByIdWithCollectionFlag(request, songId);
		List<Review> hotReviewList = this.reviewService.getHotReviewBySongIdWithLikeFlag(request, songId);
		List<Review> newReviewList = this.reviewService.getNewReviewBySongIdWithLikeFlag(request, songId);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("Song_CommentAreaFrame");
		modelAndView.addObject("song", song);
		modelAndView.addObject("hotReviewList", hotReviewList);
		modelAndView.addObject("newReviewList", newReviewList);
		return modelAndView;
	}

	@PostMapping({"review.do"})
	@ResponseBody
	public String review(HttpServletRequest request, int songId, String review) {
		boolean isAdded = this.reviewService.addReview(request, songId, review);
		return isAdded ? ReturnMsg.msg(200, "评论成功") : ReturnMsg.msg(400, "评论出错");
	}

	@GetMapping(
			value = {"reviewLike.do"},
			produces = {"text/html;charset=UTF-8"}
	)
	@ResponseBody
	public String reviewLike(HttpServletRequest request, int reviewId) {
		boolean isLiked = this.reviewService.reviewLikeChange(request, reviewId);
		return ReturnMsg.msg(200, isLiked + "");
	}

	@RequestMapping(
			value = {"newReviewFrameLoad.do"},
			method = {RequestMethod.GET}
	)
	public ModelAndView newReviewFrameLoad(HttpServletRequest request, int songId) {
		List<Review> newReviewList = this.reviewService.getNewReviewBySongIdWithLikeFlag(request, songId);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("Song_CommentArea_eachComment_Frame");
		modelAndView.addObject("newReviewList", newReviewList);
		return modelAndView;
	}

	@RequestMapping(
			value = {"deleteReview.do"},
			method = {RequestMethod.POST}
	)
	public void deleteReview(HttpServletRequest request, int[] reviewIds) {
		if (this.userService.isHasPrivilege(request)) {
			this.reviewService.batchDeleteById(reviewIds);
		}

	}
}



package top.stu.musicsystem.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import top.stu.musicsystem.service.SongService;
import top.stu.musicsystem.service.UserService;
import top.stu.musicsystem.utils.ReturnMsg;

@Controller
public class SongController {
	@Autowired
	private UserService userService;
	@Autowired
	private SongService songService;

	public SongController() {
	}

	@RequestMapping(
			value = {"deleteSong.do"},
			method = {RequestMethod.POST}
	)
	public void deleteSong(HttpServletRequest request, int[] songIds) {
		if (this.userService.isHasPrivilege(request)) {
			this.songService.batchDeleteById(request, songIds);
		}

	}

	@PostMapping({"addSong.do"})
	@ResponseBody
	public String addSong(HttpServletRequest request, MultipartFile song, MultipartFile lyric) {
		if (this.userService.isHasPrivilege(request) && this.songService.checkFormat(song, lyric)) {
			boolean isSuccessful = this.songService.addSong(request, song, lyric);
			return isSuccessful ? ReturnMsg.msg(200, "上传成功") : ReturnMsg.msg(400, "上传失败");
		} else {
			return ReturnMsg.msg(400, "格式错误");
		}
	}
}



package top.stu.musicsystem.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.stu.musicsystem.service.CollectionService;
import top.stu.musicsystem.utils.ReturnMsg;

@Controller
public class CollectionController {
	@Autowired
	private CollectionService collectionService;

	public CollectionController() {
	}

	@PostMapping(
			value = {"collectSong.do"},
			produces = {"text/html;charset=UTF-8"}
	)
	@ResponseBody
	public String collectSong(HttpServletRequest request, int songId) {
		boolean isCollected = this.collectionService.collectionChange(request, songId);
		return ReturnMsg.msg(200, isCollected + "");
	}
}

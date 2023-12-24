

package top.stu.musicsystem.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import top.stu.musicsystem.service.RecordPlayService;

@Controller
public class RecordPlayController {
	@Autowired
	private RecordPlayService recordPlayService;

	public RecordPlayController() {
	}

	@GetMapping({"recordPlay.do"})
	public void recordPlay(HttpServletRequest request, int songId) {
		this.recordPlayService.recordPlay(request, songId);
	}
}

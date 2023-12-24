

package top.stu.musicsystem.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomePage_Controller {
	public HomePage_Controller() {
	}

	@RequestMapping({"/index.do"})
	public String index() {
		return "HomePage";
	}

	@RequestMapping({"logout.do"})
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		System.out.println("logout success");
		return "redirect:index.do";
	}

	@RequestMapping(
			value = {"HomePage_TopLoad.do"},
			method = {RequestMethod.GET}
	)
	public ModelAndView headerFrameLoad(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("HomePage_Top");
		return modelAndView;
	}
}

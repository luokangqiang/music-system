

package top.stu.musicsystem.controller;

import com.alibaba.fastjson.JSONObject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.stu.musicsystem.model.User;
import top.stu.musicsystem.service.UserService;
import top.stu.musicsystem.utils.ReturnMsg;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;

	public LoginController() {
	}

	@PostMapping(
			value = {"login.do"},
			produces = {"text/html;charset=UTF-8"}
	)
	@ResponseBody
	public String login(HttpServletRequest request, User u) {
		boolean isUserExisted = this.userService.findLogin(u);
		if (!isUserExisted) {
			return ReturnMsg.msg(400, "帐号或密码错误");
		} else {
			request.getSession().setAttribute("user", u);
			request.getSession().setAttribute("isHasPrivilege", this.userService.isHasPrivilege(request));
			return ReturnMsg.msg(200, JSONObject.toJSON(u).toString());
		}
	}
}

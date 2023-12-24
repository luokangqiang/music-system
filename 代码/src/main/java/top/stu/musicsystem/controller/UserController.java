

package top.stu.musicsystem.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import top.stu.musicsystem.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	public UserController() {
	}

	@RequestMapping(
			value = {"deleteUser.do"},
			method = {RequestMethod.POST}
	)
	public void deleteUser(HttpServletRequest request, int[] userIds) {
		if (this.userService.isHasPrivilege(request)) {
			this.userService.batchDeleteById(userIds);
		}

	}
}



package top.stu.musicsystem.controller;

import com.alibaba.fastjson.JSONObject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.stu.musicsystem.service.PersonalRecService;
import top.stu.musicsystem.utils.SendEmail;
import top.stu.musicsystem.model.User;
import top.stu.musicsystem.service.UserService;
import top.stu.musicsystem.utils.ReturnMsg;

@Controller
public class RegisterController {
	@Autowired
	private UserService userService;
	@Autowired
	private PersonalRecService personalRecService;

	public RegisterController() {
	}

	@PostMapping(
			value = {"getValidateCode.do"},
			produces = {"text/html;charset=UTF-8"}
	)
	@ResponseBody
	public String getValidateCode(HttpServletRequest request, String email) {
		boolean isExisted = this.userService.isEmailExisted(email);
		if (isExisted) {
			return ReturnMsg.msg(400, "该用户已存在");
		} else if (this.userService.tooQuickly(request, 1)) {
			return ReturnMsg.msg(400, "发送频率太快");
		} else {
			String code = 100000 + (int)(Math.random() * 900000.0) + "";
			String content = "Welcome to High Octave music knowledge management system, your email verified code is：" + code + "\n\nSincerely,";
			boolean isSuccessful = SendEmail.sendemail("Email Validation", content, email);
			if (isSuccessful) {
				request.getSession().setAttribute("code", code);
				return ReturnMsg.msg(200, "发送成功");
			} else {
				return ReturnMsg.msg(400, "发送失败");
			}
		}
	}

	@PostMapping(
			value = {"register.do"},
			produces = {"text/html;charset=UTF-8"}
	)
	@ResponseBody
	public String register(HttpServletRequest request, User u) {
		String code = (String)request.getSession().getAttribute("code");
		if (code != null && code.equals(u.getValidateCode())) {
			boolean isInserted = this.userService.insert(u);
			if (isInserted) {
				request.getSession().setAttribute("user", u);
				this.personalRecService.initializePersonalRecList(request);
				return ReturnMsg.msg(200, JSONObject.toJSON(u).toString());
			} else {
				return ReturnMsg.msg(400, "注册失败");
			}
		} else {
			return ReturnMsg.msg(400, "验证码错误");
		}
	}
}
